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
        
        restaurantView.photoCollectionView.delegate = self
        restaurantView.photoCollectionView.dataSource = self
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        print(id)
        
        retrievingBusinessDetails()
        
        
    }
    override func loadView() {
        view = restaurantView
    }
    
    @objc func changeImage() {
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
            
            DispatchQueue.main.async {
                
                self.setupView()
                
                self.activityIndicator.stopActivityIndicator()
//                self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
                self.restaurantView.photoCollectionView.reloadData()
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
        
        
        
        
    }
    
    func setupParameters() {
        guard let businessPhoneNumber = self.yelpBusinessDetails?.phone, let yelpBusinessUrl = yelpBusinessDetails?.url, let addressLatitude = yelpBusinessDetails?.coordinates?.latitude, let addressLongitude = self.yelpBusinessDetails?.coordinates?.longitude else { return }
        self.businessPhoneNumber = businessPhoneNumber
        self.yelpBusinessUrl = yelpBusinessUrl
        self.addressLatitude = addressLatitude
        self.addressLongitude = addressLongitude
        
        //retrieves images
        guard let yelpUrl = yelpBusinessDetails?.photos else { return }
        for currentPhotoUrl in yelpUrl {
            remoteImageHelper.retrieveImage(urlString: currentPhotoUrl) {
                image in guard let image = image else { return }
                self.yelpImages.append(image)
            }
        }
        
        
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
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension RestaurantViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return yelpImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        print("\(yelpImages) Here")
//        cell.imageView.image = yelpImages[indexPath.row
        
        return cell
    }
}
