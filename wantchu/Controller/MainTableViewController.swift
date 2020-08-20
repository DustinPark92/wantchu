//
//  mainTableViewController.swift
//  wantchu
//
//  Created by Dustin on 2020/08/19.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class MainTableViewController: UIViewController{
    
    let tableView = UITableView()
    var collectionViewTop : UICollectionView?
    //MainTableTableViewCell


    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionViewLayout()
        configureUI()

       
    }
    
    func configureUI() {
        view.addSubview(tableView)
        tableView.anchor(top:view.topAnchor,left: view.leftAnchor,bottom: view.bottomAnchor,right: view.rightAnchor)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MainTableTableViewCell.self, forCellReuseIdentifier: "MainTableTableViewCell")
        
        
    }
    
    func configureCollectionViewLayout() {

        
    }


}

extension MainTableViewController : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableTableViewCell", for: indexPath) as! MainTableTableViewCell


        
        if indexPath.section == 0  {
            cell.collectionviewTop.tag = indexPath.row
            cell.collectionviewTop.register(TopCollectionViewCell.self, forCellWithReuseIdentifier: "TopCollectionViewCell")
            cell.collectionviewTop.delegate = self
            cell.collectionviewTop.delegate = self

            
            
        }



        cell.collectionviewBottom.register(BottomCollectionViewCell.self, forCellWithReuseIdentifier: "BottomCollectionViewCell")
        cell.collectionviewBottom.delegate = self
        cell.collectionviewBottom.dataSource = self
        
  
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
    
    
}


    
extension MainTableViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewTop {
            return 5
        }
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionViewTop?.tag == indexPath.row  {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopCollectionViewCell", for: indexPath) as! TopCollectionViewCell
        
        return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BottomCollectionViewCell", for: indexPath) as! BottomCollectionViewCell
        cell.backgroundColor = .blue
        return cell
    }
    
    
    
    
}
