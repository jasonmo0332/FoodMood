//
//  RestaurantViewController.swift
//  FoodMood
//
//  Created by Jason Mo on 5/26/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class RestaurantViewController: UIViewController {
    var id: String?
    let restaurantView = RestaurantView()
    let networkingHandler = YelpNetworkingHandler()
    let activityIndicator = CustomActivityIndicator()
    var yelpBusinessDetails : YelpBusinessSearchIdResponse?
    var businessPhoneNumber : String?
    var yelpBusinessUrl : String?
    var addressLatitude : Double?
    var addressLongitude : Double?
    let remoteImageHelper = RemoteImageHelper()
    var yelpImages : [UIImage] = []
    var timer = Timer()
    var counter = 0
    var buildHours : [String] = []
    var hoursDict : [Int : String] = [:]
    var locationManager: CLLocationManager?
    var userLocation : CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restaurantView.callButton.addTarget(self, action: #selector(callButtonDidPressed(_:)), for: .touchUpInside)
        restaurantView.visitYelpPageButton.addTarget(self, action: #selector(visitYelpPageButtonDidPressed(_:)), for: .touchUpInside)
        restaurantView.mapAddressButton.addTarget(self, action: #selector(openMapsButtonDidPressed(_:)), for: .touchUpInside)
        // Do any additional setup after loading the view.
        self.title = "Details"
        
        restaurantView.mapView.delegate = self
        restaurantView.photoCollectionView.delegate = self
        restaurantView.photoCollectionView.dataSource = self
        checkLocationServices()
        
        retrievingBusinessDetails()
        
        
        
    }
    
    
    
    func setupTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(collectionViewAutoScroll), userInfo: nil, repeats: true)
    }
    
    override func loadView() {
        view = restaurantView
    }
    
    @objc func collectionViewAutoScroll() {
        if counter < yelpImages.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.restaurantView.photoCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.restaurantView.photoCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        }

    }
    
    
    
    func retrievingBusinessDetails() {
        activityIndicator.startActivityIndicator(view: self.restaurantView)
        guard let id = id else { return }
        networkingHandler.retrieveVenue(id: id) {
            [weak self] (properties, error) in
            
            guard let `self` = self else { return }
            self.yelpBusinessDetails = properties

            
            self.setupParameters()
            
            guard let yelpUrl = self.yelpBusinessDetails?.photos else { return }
            for currentPhotoUrl in yelpUrl {
                self.remoteImageHelper.retrieveImage(urlString: currentPhotoUrl) {
                    image in guard let yelpImage = image else { return }
                    self.yelpImages.append(yelpImage)
                    
                    DispatchQueue.main.async {
                        self.restaurantView.photoCollectionView.reloadData()
                    }
                }
            }
            DispatchQueue.main.async {
                self.setupView()
                self.setupTimer()
                self.activityIndicator.stopActivityIndicator()
            }
            
        }
        
    }
    func setupView() {
        guard let restaurantName = yelpBusinessDetails?.name else { return }
        restaurantView.restaurantName.text = restaurantName
        guard let yelpDisplayAddress = yelpBusinessDetails?.location?.displayAddress else { return }
        for currentDisplayAddress in yelpDisplayAddress {
            restaurantView.addressLabel.text! += currentDisplayAddress
        }
        guard let ratingValue = yelpBusinessDetails?.rating else { return }
        restaurantView.yelpRatingImageView.image = UIImage(named: setRatingImage(ratingValue: ratingValue))
        guard let isBusinessCurrentlyOpen = yelpBusinessDetails?.hours?[0].isOpenNow, let hours = yelpBusinessDetails?.hours?[0].open else { return}
        restaurantView.isBusinessCurrentlyOpenLabel.text = isBusinessOpen(isOpen: isBusinessCurrentlyOpen)
        restaurantView.currentDayHoursLabel.text = interpretTodayHoursOfOperation(yelpOpenHours: hours)
        guard let numberOfRatings = yelpBusinessDetails?.reviewCount else { return }
        restaurantView.numberOfRatingsLabel.text = convertReviewCountIntToString(intValue: numberOfRatings)
        
        
    }
    
    func setupParameters() {
        guard let businessPhoneNumber = self.yelpBusinessDetails?.phone, let yelpBusinessUrl = yelpBusinessDetails?.url, let addressLatitude = yelpBusinessDetails?.coordinates?.latitude, let addressLongitude = self.yelpBusinessDetails?.coordinates?.longitude else { return }
        self.businessPhoneNumber = businessPhoneNumber
        self.yelpBusinessUrl = yelpBusinessUrl
        self.addressLatitude = addressLatitude
        self.addressLongitude = addressLongitude
        getDirections()
    }
    func isBusinessOpen(isOpen: Bool) -> String {
        if isOpen {
            restaurantView.isBusinessCurrentlyOpenLabel.textColor = .green
            return "Open"
        }
        restaurantView.isBusinessCurrentlyOpenLabel.textColor = .red
        return "Closed"
    }
    
    
    func convertReviewCountIntToString(intValue: Int) -> String {
        let convertedInt = intValue.description
        return convertedInt
        
    }
    
    func interpretTodayHoursOfOperation(yelpOpenHours: [YelpBusinessSearchLocationOpen]?) -> String {
        
        let todayDate = Calendar.current.component(.weekday, from: Date()) - 1
        
        guard let yelpOpenHours = yelpOpenHours else { return "" }
        for time in yelpOpenHours {
            var currentString = ""
            guard let day = time.day, let start = time.start, let end = time.end else { return ""}
            
            if todayDate == day {
                
                let keyExists = hoursDict[todayDate]
                
                if (keyExists != nil) {
                    //equal to previous hours
                    
                    guard let previousHours = hoursDict[todayDate] else { return "" }
                    print("\(previousHours) printing previous hours")
                    let convertedStart = convertMilitaryTime(time: start)
                    let convertedEnd = convertMilitaryTime(time: end)
                    
                    currentString += convertedStart
                    currentString += " - "
                    currentString += convertedEnd
                    
                    let newHours = previousHours + "\n" + currentString
                    print("\(newHours) printing new hours")
                    hoursDict.updateValue(newHours, forKey: todayDate)
                } else {
                    let convertedStart = convertMilitaryTime(time: start)
                    let convertedEnd = convertMilitaryTime(time: end)
                    
                    currentString += convertedStart
                    currentString += " - "
                    currentString += convertedEnd
                    print("Check if date is converted \(currentString)")
                    hoursDict[todayDate] = currentString
                    print("\(currentString) printing current string")
                }
                
                
                
                
            }

        }
        
        guard let returnHours = hoursDict[todayDate] else { return "" }
        print("\(returnHours) returned hours")
        return returnHours
        
    }
    
    func convertMilitaryTime(time : String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HHmm"
        let date = dateFormatter.date(from: time)
        dateFormatter.dateFormat = "h:mm a"
        let convertedDate = dateFormatter.string(from: date!)
        
        
        
        
        
        return convertedDate
    }
    
    @objc func callButtonDidPressed(_ sender: Any) {
        print("clicked call")
        guard let businessPhoneNumber = businessPhoneNumber else { return }
        guard let number = URL(string: "tel://\(businessPhoneNumber)") else { return }
        UIApplication.shared.open(number)
    }
    
    @objc func visitYelpPageButtonDidPressed(_ sender: Any) {
        print("clicked URL")
        guard let yelpBusinessUrl = yelpBusinessUrl else { return }
        guard let url = URL(string: yelpBusinessUrl) else { return }
        UIApplication.shared.open(url)
    }
    
    
    @objc func openMapsButtonDidPressed(_ sender: Any) {
        print("clicked map")
        guard let addressLongitude = addressLongitude else { return }
        guard let addressLatitude = addressLatitude else { return }
        guard let url = URL(string:"http://maps.apple.com/?daddr=\(addressLatitude),\(addressLongitude)") else { return }
        UIApplication.shared.open(url)
    }
    
    //Ex rating value is 3, set to rating3
    func setRatingImage(ratingValue : Double) -> String {
        switch ratingValue {
        case 5.0:
            return "rating5"
        case 4.5:
            return "rating4Half"
        case 4.0:
            return "rating4"
        case 3.5:
            return "rating3Half"
        case 3.0:
            return "rating3"
        case 2.5:
            return "rating2Half"
        case 2.0:
            return "rating2"
        case 1.5:
            return "rating1Half"
        case 1:
            return "rating1"
        case 0.5:
            return "rating0Half"
        default:
            return "rating0"
        }
    }
    

}


extension RestaurantViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Created section")
        return yelpImages.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        print("Created cell")

        if yelpImages.count > 0 {
            cell.imageView.image = self.yelpImages[indexPath.row]
        }
        
       
        
        return cell
    }
}

extension RestaurantViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let currentLocation = locations.first else { return }
            if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
                CLLocationManager.authorizationStatus() == .authorizedAlways) {
                print(currentLocation)
                guard let addressLatitude = addressLatitude, let addressLongitude = addressLongitude else { return }
                let pin = MKPlacemark(coordinate: CLLocation(latitude: addressLatitude, longitude: addressLongitude).coordinate)
                restaurantView.mapView.addAnnotation(pin)
                
            }
            

        }
        
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("Failed to find user's location: \(error.localizedDescription)")
        }
}

extension RestaurantViewController : MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        // helps render the polyline
        let renderer = MKPolylineRenderer(overlay: overlay as! MKPolyline)
        renderer.strokeColor = .systemBlue
        
        return renderer
    }
}
//location manager items
extension RestaurantViewController {
    func setupLocationManager() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.requestLocation()
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            // Show alert letting the user know they have to turn this on.
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            

            restaurantView.mapView.showsUserLocation = true
            break
        case .denied:
            // Show alert instructing them how to turn on permissions
            break
        case .notDetermined:
            print("Not determined?")
            locationManager?.requestWhenInUseAuthorization()
        case .restricted:
            // Show an alert letting them know what's up
            break
        case .authorizedAlways:

            restaurantView.mapView.showsUserLocation = true
            break
        @unknown default:
            break
        }
    }
    
    
    
    func getDirections() {
        
        guard let location = locationManager?.location?.coordinate else { return }
        print("See \(location)")
        let request = getDirectionsRequest(from: location)
        let directions = MKDirections(request: request)
        
        directions.calculate { [unowned self] (response, error) in
            //TODO: Handle error if needed
            guard let response = response else { return } //TODO: Show response not available in an alert
            
            for route in response.routes {
                // adds actual poly line
                self.restaurantView.mapView.addOverlay(route.polyline)
                //multiplier to add bounds for the map
                let widthMultiplier = route.polyline.boundingMapRect.width / 4
                let heightMultipler = route.polyline.boundingMapRect.height / 4
                //parameters is origin which is topleft of screen, need to subtract multiplier to give room and add to the max height and width to give room for the furtherst points
                let mapRectBuffer = MKMapRect(x: route.polyline.boundingMapRect.minX - widthMultiplier, y: route.polyline.boundingMapRect.minY - heightMultipler, width: route.polyline.boundingMapRect.width + widthMultiplier*2, height: route.polyline.boundingMapRect.height + heightMultipler*2)
                
                self.restaurantView.mapView.setVisibleMapRect(mapRectBuffer, animated: false)
                
            }
        }
    }
    
    func getDirectionsRequest(from coordinate: CLLocationCoordinate2D) -> MKDirections.Request {
        
        let destinationCoordinate = CLLocation(latitude: addressLatitude!, longitude: addressLongitude!).coordinate
        let startingLocation = MKPlacemark(coordinate: coordinate)
        let destination = MKPlacemark(coordinate: destinationCoordinate)
        self.restaurantView.mapView.addAnnotation(destination)
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: startingLocation)
        request.destination = MKMapItem(placemark: destination)
        request.transportType = .automobile
        
        return request
    }
}
