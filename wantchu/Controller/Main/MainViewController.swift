//
//  MainViewController.swift
//  wantchu
//
//  Created by Dustin on 2020/08/20.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit
import SideMenu

private let headerIdentifier = "headerView"
private let topCellIdentifier = "topCell"
private let bottomCellIdentifier = "bottomCell"

class MainViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    let searchController = UISearchController(searchResultsController: nil)
    let label = UILabel()
    
    var menu: SideMenuNavigationController?
    var topCollectionViewCellLayout = UICollectionViewFlowLayout()
    var bottomCollectionViewCellLayout = UICollectionViewFlowLayout()
    let networkModel = CallRequest()
    let networkURL = NetWorkURL()
    var storeList = [StoreListModel]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello world")
//        let vc = LoginController()
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: true, completion: nil)
        
        configureUI()
        
        networkModel.post(method: .get, url: networkURL.storeListURL) { (json) in
            var storeModel = StoreListModel()
            for item in json["type"].array! {
                storeModel.type_code = item["type_code"].stringValue
                storeModel.type_name = item["type_name"].stringValue
                storeModel.type_image = item["type_image"].stringValue
                self.storeList.append(storeModel)
            }
            
            
            self.collectionView.reloadData()
        }
        
        menu = SideMenuNavigationController(rootViewController: SideMenuListController())
        menu?.leftSide = true
        menu?.menuWidth = view.frame.width * 0.8
        menu?.presentationStyle = .menuSlideIn
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        
    }
    
    
    // MARK: - Selectors
    
    @objc func handleAdd() {
        print("handle add")
    }
    
    // sidemenu library
    @objc func handleMenu() {
        present(menu!, animated: true, completion: nil)
    }
    
    // MARK: - Helper
    
    func configureUI() {
        
        navigationItem.title = "TITLE"
        collectionView.backgroundColor = .white
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        
        
        // Right bar button item
        let rightButton: UIBarButtonItem = {
            let button = UIBarButtonItem(barButtonSystemItem: .add,
                                         target: self, action: #selector(handleAdd))
            return button
        }()
        navigationItem.rightBarButtonItem = rightButton
        
        // Left bar button item
        let leftButton: UIBarButtonItem = {
            let button = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(handleMenu))
            return button
        }()
        navigationItem.leftBarButtonItem = leftButton
        
        
        // Register header
        collectionView.register(MainHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: headerIdentifier)
        
        
        // Register cell
        collectionView.register(MainCellBottom.self, forCellWithReuseIdentifier: bottomCellIdentifier)
        
    }
    
    
    
}

// MARK: - UICollectionViewDataSoucre/Delegate

extension MainViewController {
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath)
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let store = storeList[indexPath.item]
        
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bottomCellIdentifier, for: indexPath) as! MainCellBottom
            cell.layer.cornerRadius = ((view.frame.width - 80) / 3) / 4
            cell.backgroundColor = .darkGray
            cell.textLabel.text = store.type_name
        
            return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return storeList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let layout = UICollectionViewFlowLayout()
        let vc = MainShopCollectionViewController(collectionViewLayout: layout)
        vc.type = storeList[indexPath.item].type_code
        vc.name = storeList[indexPath.item].type_name
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    // header sizing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 280)
    }
    
    // cell sizing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (collectionView.frame.size.width - 50) / 4 , height: 120)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
       return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
    }
    
}

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
