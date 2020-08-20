//
//  UserRequestTableViewCell.swift
//  wantchu
//
//  Created by Dustin on 2020/08/20.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class UserRequestTableViewCell: UITableViewCell {
    
    let mainView : UIView = {
        let uv = UIView()
        uv.makeAborderWidth(border: 1, color: UIColor.black.cgColor)
        return uv
    }()
    
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
    
    let answerLabel: UILabel = {
        let text = UILabel()
        text.text = "미 답변"
        text.textAlignment = .center
        return text
    }()
    
    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        addSubview(mainView)
        mainView.anchor(top:topAnchor,left: leftAnchor,bottom: bottomAnchor,right: rightAnchor,paddingTop: 5,paddingLeft: 5,paddingBottom: 5,paddingRight: 5)
        mainView.addSubview(title)
        mainView.addSubview(inquiry_date)
        mainView.addSubview(answerLabel)
        
        title.anchor(top:mainView.topAnchor,left: mainView.leftAnchor,paddingTop: 5,paddingLeft: 5)
        inquiry_date.anchor(top:title.bottomAnchor,left : mainView.leftAnchor,bottom: mainView.bottomAnchor,paddingTop: 5 ,paddingLeft: 5,paddingBottom: 5)
        answerLabel.anchor(top:mainView.topAnchor,right: mainView.rightAnchor,paddingTop: 5,paddingRight: 5)
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
