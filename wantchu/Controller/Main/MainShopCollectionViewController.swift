//
//  MainShopCollectionViewController.swift
//  wantchu
//
//  Created by Dustin on 2020/08/20.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

private let headerIdentifier = "HeaderView"
private let cellIdentifier = "Cell"

class MainShopCollectionViewController: UICollectionViewController, CLLocationManagerDelegate {
    
    // MARK: - Properties
    var type = "타입"
    var name = ""
    
    let networkModel = CallRequest()
    let networkURL = NetWorkURL()
    
    var storeDetailModel = [StoreDetailModel]()
    
    let locationManager = CLLocationManager()
    
    let header = MainShopHeader()
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: UIImage(systemName: "bolt"))
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    let textLabel: UILabel = {
        let text = UILabel()
//        text.text = "cafe" // 백엔드에서 받아오기
        text.textAlignment = .center
        return text
    }()
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        configureUI()
        
        
    }
    
    // MARK: - Helper
    
    func configureUI() {
        title = name
        
        let param = ["type_code": type]
        
        networkModel.get(method: .get, param: param, url: networkURL.storeDetailListURL) { (json) in
            var storeDetail = StoreDetailModel()
            
            for item in json["store"].array! {
                storeDetail.store_id = item["store_id"].stringValue
                storeDetail.store_image = item["store_image"].stringValue
                storeDetail.store_info = item["store_info"].stringValue
                storeDetail.store_latitude = item["store_latitude"].stringValue
                storeDetail.store_location = item["store_location"].stringValue
                storeDetail.store_longitude = item["store_longitude"].stringValue
                storeDetail.store_name = item["store_name"].stringValue
                self.storeDetailModel.append(storeDetail)
            }
            self.collectionView.reloadData()
        }
        
        collectionView.backgroundColor = .lightGray
        
        // register cell & header
        self.collectionView.register(MainShopCell.self, forCellWithReuseIdentifier: cellIdentifier)
        self.collectionView.register(MainShopHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location: CLLocation = manager.location else { return }
        fetchCityAndCountry(from: location) { city, country, error in
            guard let city = city, let country = country, error == nil else { return }
            
            self.header.city = country + city
        }
    }
        
        // fetch city and country name
        func fetchCityAndCountry(from location: CLLocation, completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
            CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
                completion(placemarks?.first?.locality,
                           placemarks?.first?.country,
                           error)
            }
        }
    
    
    // MARK: - UICollectionViewDataSoucre/Delegate
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath)
        
        return header
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return storeDetailModel.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! MainShopCell
        
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 18
        cell.titleLabel.text = storeDetailModel[indexPath.item].store_name
        cell.titleLabel.font = .boldSystemFont(ofSize: 18)
        cell.locationLabel.text = storeDetailModel[indexPath.item].store_location
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let layout = UICollectionViewFlowLayout()
        let vc = StoreDetailCollectionViewController(collectionViewLayout: layout)
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension MainShopCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width * 0.9, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left:0, bottom: 10, right:0)
    }
    
    
}
