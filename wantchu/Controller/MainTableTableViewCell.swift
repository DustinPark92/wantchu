//
//  MainTableTableViewCell.swift
//  wantchu
//
//  Created by Dustin on 2020/08/19.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class MainTableTableViewCell: UITableViewCell {
    
    
    var collectionviewTop : UICollectionView!
    var collectionviewBottom : UICollectionView!
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        var topLayout = UICollectionViewFlowLayout()
        collectionviewTop = UICollectionView(frame: self.bounds, collectionViewLayout: topLayout)
        var bottomLayout = UICollectionViewFlowLayout()
        collectionviewBottom = UICollectionView(frame: self.bounds, collectionViewLayout: bottomLayout)
        self.addSubview(collectionviewTop)
        self.addSubview(collectionviewBottom)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopCollectionViewCell", for: indexPath) as! TopCollectionViewCell
        
        return cell
    }

}
