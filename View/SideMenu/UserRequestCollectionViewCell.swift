//
//  UserRequestCollectionViewCell.swift
//  wantchu
//
//  Created by Dustin on 2020/08/20.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class UserRequestCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    let title: UILabel = {
        let text = UILabel()
        text.text = "문의 제목"
        text.textAlignment = .center
        return text
    }()
    
    let inquiry_date: UILabel = {
        let text = UILabel()
        text.text = "2020년 8월 20일 11시 36분 41초"
        text.textAlignment = .center
        return text
    }()

    
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubview(title)
        addSubview(inquiry_date)
        
        title.anchor(top:topAnchor,left: leftAnchor,paddingTop: 5,paddingLeft: 5)
        inquiry_date.anchor(top:topAnchor,left: leftAnchor,paddingTop: 5,paddingLeft: 5)

        
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



