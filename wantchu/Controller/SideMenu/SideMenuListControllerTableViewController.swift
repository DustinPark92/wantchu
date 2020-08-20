//
//  SideMenuListControllerTableViewController.swift
//  wantchu
//
//  Created by Dustin on 2020/08/20.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class SideMenuListController: UITableViewController {
    
    // MARK: - Properties
    
    let cellIdentifier = "cell"
    var items = ["쿠폰", "공지사항", "입점요청", "1:1문의"]
    let layout = UICollectionViewFlowLayout()
    
    let header = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200))
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
//        view.backgroundColor = .white
        
    }
    
    // MARK: - Helper
    
    func configureUI() {
        
        // 테이블 뷰 헤더
//        header.backgroundColor = .yellow
        tableView.tableHeaderView = header
        
        // 테이블 뷰 메뉴에 밑 줄 없애기.... //
        tableView.separatorStyle = .none
        
        // 헤더 텍스트 레이블 현재 이름 세글자만 볼드 됨 //
        
        let label = UILabel(frame: header.bounds)
        let str = "  환영합니다\n  김성재 고객님" // 공백 유의
        let attributedString = NSMutableAttributedString(string: str)
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 28), range: NSRange(location: 0, length: 7))
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 36), range: NSRange(location: 8, length: 5))
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 24), range: NSRange(location: 13, length: 4))
        label.attributedText = attributedString
        label.numberOfLines = 0
        label.textAlignment = .left
        header.addSubview(label)
//        label.font = .boldSystemFont(ofSize: 30)
        
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
//        cell.backgroundColor = .gray
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
        let controller = CouponCollectionViewController(collectionViewLayout: layout)
        navigationController?.pushViewController(controller, animated: true)
        case 1:
            print(123)
        case 2:
            showMailView()
        case 3:
            let controller = UserRequestTableViewController()
            navigationController?.pushViewController(controller, animated: true)

        default:
            break
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let label = UILabel(frame: header.bounds)
//        return label
//    }
}
