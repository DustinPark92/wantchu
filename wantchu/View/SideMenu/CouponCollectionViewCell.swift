//
//  CouponCollectionViewCell.swift
//  wantchu
//
//  Created by Dustin on 2020/08/20.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class CouponCollectionViewCell: UICollectionViewCell {
    
    
    // MARK: - Properties
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "couponImg"))
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    let couponTitle: UILabel = {
        let text = UILabel()
        text.text = "TEST COUPON1"
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.textAlignment = .center
        return text
    }()
    
    let couponCondition: UILabel = {
        let text = UILabel()
        text.text = "10000원 이상 구매"
        text.textAlignment = .center
        return text
    }()
    
    let couponContent: UILabel = {
        let text = UILabel()
        text.text = "30% 할인권"
        text.font = UIFont.boldSystemFont(ofSize: 40)
        text.textAlignment = .center
        return text
    }()
    
    let couponEndDate: UILabel = {
        let text = UILabel()
        text.text = "2020년 8월 26일 16시 6분 23초"
        text.textAlignment = .center
        return text
    }()
    
    let mainView: UIView = {
        let uv = UIView()
        return uv
    }()
    
    
    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(mainView)
        mainView.anchor(top:topAnchor,left: leftAnchor,bottom: bottomAnchor,right: rightAnchor)
        
        
        mainView.addSubview(imageView)
        mainView.addSubview(couponTitle)
        mainView.addSubview(couponCondition)
        mainView.addSubview(couponContent)
        mainView.addSubview(couponEndDate)
        imageView.anchor(top:mainView.topAnchor,left: mainView.leftAnchor,bottom: mainView.bottomAnchor,right: mainView.rightAnchor)
        couponTitle.anchor(top:mainView.topAnchor,left: mainView.leftAnchor,paddingTop: 10,paddingLeft: 5)
        
        couponCondition.anchor(top:mainView.topAnchor,right: mainView.rightAnchor,paddingTop: 10,paddingRight: 5)
        couponContent.anchor(left:mainView.leftAnchor,bottom: mainView.bottomAnchor, paddingLeft: 15, paddingBottom: 15)
        
        couponEndDate.anchor(bottom : mainView.bottomAnchor,right: mainView.rightAnchor)
        
        
        
        
        
        
    
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
