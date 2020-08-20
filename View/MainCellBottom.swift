//
//  MainCellBottom.swift
//  wantchu
//
//  Created by Dustin on 2020/08/20.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class MainCellBottom: UICollectionViewCell {
    
    // MARK: - Properties
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: UIImage(systemName: "photo"))
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    let textLabel: UILabel = {
        let text = UILabel()
        text.text = "cafe" // 백엔드에서 받아오기
        text.textAlignment = .center
        return text
    }()
    
    
    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        imageView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor)
        
        addSubview(textLabel)
        textLabel.anchor(top:imageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 4 ,paddingBottom: 4)
        
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
