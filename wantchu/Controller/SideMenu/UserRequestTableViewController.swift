//
//  UserRequestTableViewController.swift
//  wantchu
//
//  Created by Dustin on 2020/08/20.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class UserRequestTableViewController: UITableViewController {
  
    let customView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
    let button = UIButton(frame: CGRect(x: 85, y: 0, width: 200, height: 50))
    let networkModel = CallRequest()
    let networkURL = NetWorkURL()
    var requestList = [RequestModel]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        let param = ["email":"sky_battle@naver.com "]
        //let param = ["email":"p4569zz@naver.com "]
        networkModel.get(method: .get
        , param: param, url: networkURL.requestList) { (json) in
            
            print("불리언\(json["result"].boolValue)")
            var requestModel = RequestModel()
            
           if json["result"].boolValue {
                
                for item in json["inquiry"].array! {
                    requestModel.title = item["title"].stringValue
                    requestModel.inquiry_id = item["inquiry_id"].intValue
                    requestModel.is_replied = item["is_replied"].stringValue
                    requestModel.inquiry_date = item["inquiry_date"].stringValue
                    
                    self.requestList.append(requestModel)
                }
                
            }
            self.tableView.reloadData()
            
            
        }

        
        
    }
    
    
    func configureUI() {
        
        customView.backgroundColor = UIColor.red
        button.setTitle("Submit", for: .normal)
        
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        customView.addSubview(button)
        tableView.register(UserRequestTableViewCell.self, forCellReuseIdentifier: "UserRequestTableViewCell")

        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requestList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserRequestTableViewCell", for: indexPath) as! UserRequestTableViewCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
       return customView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
       return 50
    }
    

    @objc func buttonAction() {
        let controller = WriteViewController()
        navigationController?.pushViewController(controller, animated: true)
        
    }
}



    
    
    
