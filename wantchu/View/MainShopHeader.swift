//
//  MainShopHeader.swift
//  wantchu
//
//  Created by Dustin on 2020/08/20.
//  Copyright © 2020 Dustin. All rights reserved.
//


import UIKit

class MainShopHeader: UICollectionReusableView {
    
    // MARK: - Properties
    
    var country: String = ""
    var city: String? {
        didSet { location() }
    }
    
    
    
    let textLabel: UITextField = {
        let text = UITextField()
        text.textAlignment = .center
//        text.backgroundColor = .gray
        text.borderStyle = .roundedRect
        text.placeholder = "현재 위치"
        text.isUserInteractionEnabled = false
        return text
    }()
    
    
    let locationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "location"), for: .normal)
//        button.addTarget(self, action: #selector(handleLocation), for: .touchUpInside)
        return button
        
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
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Selector
    
    
    // MARK: - Helper
    
    func location() {
        self.textLabel.text = city
    }
    
}
