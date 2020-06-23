//
//  RestaurantViewController.swift
//  FoodMood
//
//  Created by Jason Mo on 5/26/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restaurantView.callButton.addTarget(self, action: #selector(callButtonDidPressed(_:)), for: .touchUpInside)
        restaurantView.visitYelpPageButton.addTarget(self, action: #selector(visitYelpPageButtonDidPressed(_:)), for: .touchUpInside)
        restaurantView.mapAddressButton.addTarget(self, action: #selector(openMapsButtonDidPressed(_:)), for: .touchUpInside)
        // Do any additional setup after loading the view.
        
        
        
        
        
    }
    
    func setupTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(collectionViewAutoScroll), userInfo: nil, repeats: true)
    }
    override func viewWillAppear(_ animated: Bool) {
//        print(id)
        
        retrievingBusinessDetails()
        
        
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
//            print(self.yelpBusinessDetails?.name)
//            print(self.yelpBusinessDetails?.phone)
//            print(self.yelpBusinessDetails?.url)
            
            self.setupParameters()
            
            guard let yelpUrl = self.yelpBusinessDetails?.photos else { return }
            for currentPhotoUrl in yelpUrl {
                self.remoteImageHelper.retrieveImage(urlString: currentPhotoUrl) {
                    image in guard let yelpImage = image else { return }
                    self.yelpImages.append(yelpImage)
                    
                    DispatchQueue.main.async {
                        self.restaurantView.photoCollectionView.delegate = self
                        self.restaurantView.photoCollectionView.dataSource = self
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
        guard let isBusinessCurrentlyOpen = yelpBusinessDetails?.hours?[0].isOpenNow else { return}
        restaurantView.isBusinessCurrentlyOpenLabel.text = isBusinessOpen(isOpen: isBusinessCurrentlyOpen)
        guard let numberOfRatings = yelpBusinessDetails?.reviewCount else { return }
        restaurantView.numberOfRatingsLabel.text = convertReviewCountIntToString(intValue: numberOfRatings)
        
        
    }
    
    func setupParameters() {
        guard let businessPhoneNumber = self.yelpBusinessDetails?.phone, let yelpBusinessUrl = yelpBusinessDetails?.url, let addressLatitude = yelpBusinessDetails?.coordinates?.latitude, let addressLongitude = self.yelpBusinessDetails?.coordinates?.longitude else { return }
        self.businessPhoneNumber = businessPhoneNumber
        self.yelpBusinessUrl = yelpBusinessUrl
        self.addressLatitude = addressLatitude
        self.addressLongitude = addressLongitude
    }
    func isBusinessOpen(isOpen: Bool) -> String {
        if isOpen {
            restaurantView.isBusinessCurrentlyOpenLabel.textColor = .green
            return "Open"
        }
        restaurantView.isBusinessCurrentlyOpenLabel.textColor = .red
        return "Currently Closed"
    }
    
    
    func convertReviewCountIntToString(intValue: Int) -> String {
        let convertedInt = intValue.description
        return convertedInt
        
    }
    
    func interpretTodayHoursOfOperation() {
        
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
        return 3
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
