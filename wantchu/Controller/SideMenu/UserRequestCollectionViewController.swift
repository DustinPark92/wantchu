//
//  UserRequestCollectionViewController.swift
//  wantchu
//
//  Created by Dustin on 2020/08/20.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

private let reuseIdentifier = "UserRequestCollectionViewCell"
private let footerIdentifier = "UserRequestFooterView"

class UserRequestCollectionViewController: UICollectionViewController {
    
    private let layout = UICollectionViewFlowLayout()
    
    let networkModel = CallRequest()
    let networkURL = NetWorkURL()
    var couponList = [CouponListModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureCV()
        configureCVLayout()

        

    }
    
    func configureCV() {
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        collectionView.register(UserRequestFooterView.self,
                                     forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                     withReuseIdentifier: footerIdentifier)
        
        
    }
    
    func configureCVLayout() {
        
        layout.itemSize = CGSize(width: view.frame.width, height: 100)
        collectionView.collectionViewLayout = layout
        
    }
    
    func configureUI() {
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        tabBarController?.tabBar.isHidden = true
        
    }


    // MARK: UICollectionViewDataSource



    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
       
    
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {

        switch kind {

        case UICollectionView.elementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerIdentifier, for: indexPath as IndexPath) as! UserRequestFooterView

            return footerView

        default:

            assert(false, "Unexpected element kind")
        }
    }
    
   
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }

 

}


extension UserRequestCollectionViewController : UICollectionViewDelegateFlowLayout {
    
    
    
}
