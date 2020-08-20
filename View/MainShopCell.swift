//
//  MainShopCell.swift
//  wantchu
//
//  Created by Dustin on 2020/08/20.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class MainShopCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    func makeLabel(_ letters: String, alignment: NSTextAlignment) -> UILabel {
        let text = UILabel()
        text.text = letters
        text.textAlignment = alignment
        return text
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: UIImage(systemName: "bolt"))
        iv.contentMode = .scaleToFill
//        iv.frame.size = CGSize(width: 100, height: 100)
        return iv
    }()
    
    let titleLabel: UILabel = {
        let text = UILabel()
        text.text = "title" // 백엔드에서 받아오기
        text.textAlignment = .left
        return text
    }()
    
    let statusLabel: UILabel = {
        let text = UILabel()
        text.text = "영업중" // 백엔드에서 받아오기
        text.textAlignment = .right
        return text
    }()
    
    let locationLabel: UILabel = {
        let text = UILabel()
        text.text = "하남시 미사강변동로 20 미사파크 3층 301호" // 백엔드에서 받아오기
        text.textAlignment = .left
        text.numberOfLines = 0
        return text
    }()
    
    let distanceLabel: UILabel = {
        let text = UILabel()
        text.text = "34m" // 백엔드에서 받아오기
        text.textAlignment = .right
        return text
    }()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: leftAnchor, paddingRight: -100) // OR 이미지 width, height를 고정해줘야함
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: imageView.rightAnchor, paddingTop: 20, paddingLeft: 10)
        
        addSubview(statusLabel)
        statusLabel.anchor(top:topAnchor, right: rightAnchor, paddingTop: 20, paddingRight: 20)
        
        addSubview(distanceLabel)
        distanceLabel.anchor(bottom: bottomAnchor, right: rightAnchor, paddingLeft: 10, paddingBottom: 10,paddingRight: 20)
        
        addSubview(locationLabel)
        locationLabel.anchor(left:imageView.rightAnchor, bottom: bottomAnchor,right: distanceLabel.leftAnchor, paddingLeft: 10, paddingBottom: 10,paddingRight: 10)
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Helper
    
    
}
