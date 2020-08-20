//
//  CouponCollectionViewController.swift
//  wantchu
//
//  Created by Dustin on 2020/08/20.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CouponCollectionViewCell"
private let headerIdentifier = "CouponCollectionViewHeader"

class CouponCollectionViewController: UICollectionViewController {
    
    private let layout = UICollectionViewFlowLayout()
    
    let networkModel = CallRequest()
    let networkURL = NetWorkURL()
    var couponList = [CouponListModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureCVLayout()
        configureCV()
        
        let param = ["phone":"01072209810"]
        
        networkModel.get(method: .get, param: param, url: networkURL.couponList) { (json) in
            var couponModel = CouponListModel()
            
            
            if json["result"].boolValue {
            
            for item in json["coupon"].array! {
                
                couponModel.coupon_title = item["coupon_title"].stringValue
                couponModel.coupon_condition = item["coupon_condition"].stringValue
                couponModel.coupon_id = item["coupon_id"].intValue
                couponModel.coupon_content = item["coupon_content"].stringValue
                couponModel.coupon_enddate = item["coupon_enddate"].stringValue
                couponModel.coupon_discount = item["coupon_discount"].stringValue
                couponModel.coupon_type = item["coupon_type"].stringValue
                
                self.couponList.append(couponModel)
                
                
                
            }
                
                self.collectionView.reloadData()
            
            
            
        }
        }
        
        
        
        
    }
    
    func configureUI() {
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        tabBarController?.tabBar.isHidden = true
        
    }
    
    func configureCVLayout() {
        layout.itemSize = CGSize(width: view.frame.width, height: 200)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        collectionView.collectionViewLayout = layout
    }
    
    func configureCV() {
        self.collectionView!.register(CouponCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.register(CouponCollectionViewHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: headerIdentifier)
        
    }
    
    
    // MARK: UICollectionViewDataSource
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return couponList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CouponCollectionViewCell
        
        
        let coupon = couponList[indexPath.item]
        
        cell.couponTitle.text = coupon.coupon_title
        cell.couponCondition.text = coupon.coupon_condition
        cell.couponContent.text = coupon.coupon_content
        cell.couponEndDate.text = coupon.coupon_enddate
        
        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath)
        
        return header
    }
    
    
    
    
    
    
}


extension CouponCollectionViewController : UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
}
