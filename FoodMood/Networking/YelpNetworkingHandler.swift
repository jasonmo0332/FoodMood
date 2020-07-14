//
//  YelpNetworkingHandler.swift
//  FoodMood
//
//  Created by Timothy Horng on 6/2/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import Foundation

/// The Internally accessible network handler for Yelp's API.
/// Usage:      let networkingHandler = YelpNetworkingHandler()
///         networkingHandler.retrieveVenues(...)
class YelpNetworkingHandler {
    /// Retrieves a list of 10 food venues, in English (US), from Yelp's API, given a location.
    /// - Parameters:
    ///   - latitude:Longitude of a given location.
    ///   - longitude: Latitude of a given location.
    ///   - completionHandler: An array of `YelpBusiness` objects if it exists, or an `Error` object if something goes wrong.
    func retrieveVenues(latitude: Double, longitude: Double, category: String, completionHandler: @escaping ([YelpBusiness]?, Error?) -> Void) {
        ServiceLayer.request(router: .retrieveVenues(latitude, longitude, category)) { (result: Result<Data?, Error>) in
            
            switch result {
            case .success(let data):
                guard let data = data else {
                    // TODO: Handle error here
                    completionHandler(nil, nil) // TODO: fix
                    return
                }
                
                var targetData: YelpBusinessSearchResponse?
                do {
                    try targetData = BaseModelDecoder.decode(data)
                } catch {
                    self.handleError(error)
                    completionHandler(nil, error)
                }
                
                if let targetData = targetData {
                    //accesses the businesses of the search response from Yelp (not businessSearch)
                    completionHandler(targetData.businesses, nil)
                } else {
                    completionHandler(nil, nil) // TODO: fix
                }
            case .failure(let error):
                self.handleError(error)
                completionHandler(nil, error)
            }
        }
    }
    
    func retrieveVenue(id : String, completionHandler: @escaping (YelpBusinessSearchIdResponse?, Error?) -> Void) {
        ServiceLayer.request(router: .retrieveVenue(id)) { (result: Result<Data?, Error>) in
                switch result {
                case .success(let data):
                    guard let data = data else {
                        // TODO: Handle error here
                        completionHandler(nil, nil) // TODO: fix
                        return
                    }
                    
                    var targetData: YelpBusinessSearchIdResponse?
                    do {
                        try targetData = BaseModelDecoder.decode(data)
                    } catch {
                        self.handleError(error)
                        completionHandler(nil, error)
                    }
                    
                    if let targetData = targetData {
                        completionHandler(targetData, nil)
                    } else {
                        completionHandler(nil, nil) // TODO: fix
                    }
                case .failure(let error):
                    self.handleError(error)
                    completionHandler(nil, error)
                }
            }
    }
        
    func handleError(_ error: Error) {
        // TODO: Write error function
        print(error)
    }
}

/// An enum that provides components of URLComponents & URLRequest for given cases to be sent to the YelpAPI
/// I made it private for now since it doesn't need to accessed by anything other than YelpNetworkingHandler.
/// If you expand it you can make it internal.
private enum Router {
    // Venues given a latitude (Double) and longitude (Double)
    case retrieveVenues(Double, Double, String)
    // You can add more cases here when you want to access the YelpAPI (other any other API)'s different endpoints
    case retrieveVenue(String)
    /// The scheme subcomponent of the URL
    var scheme: String {
        switch self {
        case .retrieveVenues(_,_,_):
            return "https"
        case .retrieveVenue(_):
            return "https"
        }
    }
    
    /// The host subcomponent
    var host: String {
        switch self {
        default:
            return "api.yelp.com"
        }
    }
    
    /// The path subcomponent
    var path: String {
        switch self {
        case .retrieveVenues(_,_,_):
            return "/v3/businesses/search"
        case .retrieveVenue(let id):
            return "/v3/businesses/" + id
        }
    }
    
    /// Parameters in the form of URLQueryItems given a latitude/longitude pair
    var parameters: [URLQueryItem] {
        switch self {
        case .retrieveVenues(let latitude, let longitude, let category):
            return [
                URLQueryItem(name: "latitude", value: "\(latitude)"),
                URLQueryItem(name: "longitude", value: "\(longitude)"),
                URLQueryItem(name: "categories", value: "\(category)"),
                URLQueryItem(name: "radius", value: "\(40000)"),
                URLQueryItem(name: "limit", value: "\(50)"),
                URLQueryItem(name: "sortBy", value: "best_match"),
                URLQueryItem(name: "locale", value: "en_US")
            ]
        case .retrieveVenue:
            return [
                URLQueryItem(name: "locale", value: "en_US")
            ]
            
        }
    }
    
    /// The authorization header
    var authHeader: String {
        let appSecret = "6hguexb3FmGuqh6mwkSouX46D7HnPGkl63GKaqvPhM-mELhyRNH9BthtIOGwsQg_8X6edpGfsKYRllR2ITIj1PXb1duVwhysxvr1k6SLrnZ2IqS5uGS1MxFL_2jQXnYx"
        return "Bearer \(appSecret)"
    }
    
    /// The HTTP method
    var method: String {
        switch self {
        case .retrieveVenues:
            return "GET"
        case .retrieveVenue:
            return "GET"
        }
    }
}

/// The service layer performing the actual URLRequest.
/// https://www.swiftbysundell.com/articles/constructing-urls-in-swift/
private class ServiceLayer {
    class func request(router: Router, completion: @escaping (Result<Data?, Error>) -> ()) {
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = router.parameters
        
        guard let url = components.url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method
        urlRequest.setValue(router.authHeader, forHTTPHeaderField: "Authorization")
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            
            completion(.success(data))
        }
        dataTask.resume()
    }
}

/// Contains the JSON decoding method. You can add additional decoder customizations here.
/// It is designed to be generic (T) to conform to any model.
/// It is private for the same reason ServiceLayer is private.
private class BaseModelDecoder {
    class func decode<T: Codable>(_ json: Data) throws -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(T.self, from: json)
    }
}
