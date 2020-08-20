//
//  CouponCollectionViewHeader.swift
//  wantchu
//
//  Created by Dustin on 2020/08/20.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class CouponCollectionViewHeader: UICollectionReusableView {
    
    let mainLabel: UILabel = {
        let lb = UILabel()
        lb.text = "내 쿠폰 리스트"
        lb.font = UIFont.boldSystemFont(ofSize: 40)
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(mainLabel)
        mainLabel.anchor(left:leftAnchor,bottom: bottomAnchor,paddingLeft: 10,paddingBottom: 10)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
