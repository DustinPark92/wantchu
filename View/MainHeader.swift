//
//  File.swift
//  wantchu
//
//  Created by Dustin on 2020/08/20.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class MainHeader: UICollectionReusableView {
    
    let headerCellIdentifier = "HeaderCell"
    
    // MARK: - Properties
    
    let layout = UICollectionViewFlowLayout()
    
    let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 1
        pc.numberOfPages = 5 // 백엔드에서 동적으로 페이지 갯수 받아오기.
        pc.currentPageIndicatorTintColor = .black
        pc.pageIndicatorTintColor = .lightGray
        return pc
    }()
    
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        
        
        
        cv.dataSource = self
        cv.delegate = self
        
        layout.scrollDirection = .horizontal
        cv.isPagingEnabled = true
        
//         Add collectionView
        addSubview(cv)
        cv.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
        // add pageControl
        addSubview(pageControl)
        pageControl.anchor(left: cv.leftAnchor, bottom: cv.bottomAnchor, right: cv.rightAnchor)
        
        cv.register(MainHeaderCell.self, forCellWithReuseIdentifier: headerCellIdentifier)
        cv.backgroundColor = .white
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - collectionView dataSource/delegate


extension MainHeader: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let page = Int(targetContentOffset.pointee.x / self.frame.width)
        self.pageControl.currentPage = page
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerCellIdentifier, for: indexPath)
        
        cell.backgroundColor = indexPath.row % 2 == 0 ? .red : .systemBlue
        cell.layer.cornerRadius = 60
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
