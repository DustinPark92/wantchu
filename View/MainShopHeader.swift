//
//  MainShopHeader.swift
//  wantchu
//
//  Created by Dustin on 2020/08/20.
//  Copyright © 2020 Dustin. All rights reserved.
//


import UIKit
import MapKit
import CoreLocation

class MainShopHeader: UICollectionReusableView, CLLocationManagerDelegate {
    
    // MARK: - Properties
    
    let locationManager = CLLocationManager()
    
    var country: String = ""
    var city: String = ""
    
    let textLabel: UITextField = {
        let text = UITextField()
        text.textAlignment = .center
//        text.backgroundColor = .gray
        text.borderStyle = .roundedRect
        text.placeholder = "현재 위치"
        return text
    }()
    
    
    let locationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "location"), for: .normal)
        button.addTarget(self, action: #selector(handleLocation), for: .touchUpInside)
        return button
        
    }()
    
    let searchBar: UISearchBar = {
        let sb = UISearchBar()
//        sb.backgroundColor = .white
//        sb.searchBarStyle = .minimal
        sb.placeholder = ""
        return sb
    }()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(textLabel)
        textLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, paddingTop: 20 ,paddingLeft: 20, paddingBottom: 20)
        
        addSubview(locationButton)
        locationButton.anchor(top: topAnchor, left: textLabel.rightAnchor,
                              bottom: bottomAnchor, right: rightAnchor,
                              paddingLeft: 20, paddingRight: 40)
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        
//        addSubview(searchBar)
//        searchBar.anchor(top: topAnchor, left: leftAnchor,
//                         right: rightAnchor, paddingTop: 10,
//                         paddingLeft: 20, paddingRight: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Selector
    
    
    // 위치정보 사용 요청
    @objc func handleLocation() {
        locationManager.requestWhenInUseAuthorization()
        self.textLabel.text = "\(country), \(city)"
    }
    
    
    // MARK: - Helper
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location: CLLocation = manager.location else { return }
        fetchCityAndCountry(from: location) { city, country, error in
            guard let city = city, let country = country, error == nil else { return }
            self.country = country
            self.city = city
//            self.textLabel.text = "\(country), \(city)"
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
    
    
}
