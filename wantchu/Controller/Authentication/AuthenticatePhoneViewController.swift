//
//  AuthenticatePhoneViewController.swift
//  wantchu
//
//  Created by Dustin on 2020/08/18.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit
import Firebase
import Alamofire

class AuthenticatePhoneViewController: UIViewController {
    
    
    //MARK: - Properties
    
    var ref = Database.database().reference()
    let networkModel = CallRequest()
    let networkUrl = NetWorkURL()
    var returnValue = false
    
    
    private let mainImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(systemName: "lock")!
        return iv
    }()
    
    
    private let mainLabel : UILabel = {
        let lb = UILabel()
        lb.text = "회원가입"
        lb.font = UIFont.systemFont(ofSize: 30)
        return lb
    }()
    
    private let authTextField : UITextField = {
        let tf = Utilites().textField(withPlaceholder: "휴대폰 번호 입력")
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    
    private let requestButton : UIButton = {
        let button = Utilites().buttonUI(setTitle: "인증 번호 요청")
        button.addTarget(self, action: #selector(handleRequest), for: .touchUpInside)
        return button
    }()
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNav()
        view.backgroundColor = .twitterBlue
    }
    
    
    //MARK: - Helpers
    
    func configureNav() {
        
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.isTranslucent = true
        
    }
    
    
    func configureUI() {
        view.addSubview(mainImageView)
        view.addSubview(mainLabel)
        view.addSubview(authTextField)
        view.addSubview(requestButton)
        mainImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        mainImageView.setDimensions(width: 150, height: 150)
        
        mainLabel.centerX(inView: view,topAnchor: mainImageView.bottomAnchor,paddingTop: 30)
        authTextField.centerX(inView: view,topAnchor: mainLabel.bottomAnchor,paddingTop: 30)
        requestButton.centerX(inView: view, topAnchor: authTextField.bottomAnchor, paddingTop: 30)
        authTextField.setDimensions(width: view.frame.width - 60, height: 50)
        requestButton.setDimensions(width: view.frame.width - 60, height: 50)

        
    }
    
    func checkUserNumber(number : String) -> Bool{
        
        let param = ["phone" : number]
        
        
        networkModel.get(method: .get,param:param,url: networkUrl.phoneNumberCheckURL) { json in
            DispatchQueue.main.async {
                self.returnValue = json["result"].boolValue
            }
        }
        return returnValue
    }
    
//    func checkUser(number : String) {
//
//        ref.child("Users").observeSingleEvent(of: .value, with: { (snapshot) in
//          // Get user value
//          let value = snapshot.value as? NSDictionary
//
//            print(value?.allKeys)
//          // ...
//          }) { (error) in
//            print(error.localizedDescription)
//        }
//
//        print(ref.child("Users").key)
//    }
    
    //MARK: - objc
    
    
    @objc func handleRequest() {
        
        guard let number = authTextField.text else { return }
        
        
        print(number)
        if checkUserNumber(number: "01072209810") {
        
        
        PhoneAuthProvider.provider().verifyPhoneNumber(number, uiDelegate: nil) { (verificationID, error) in
          if let error = error {
            print(error.localizedDescription)
            return
          }
            
            Auth.auth().languageCode = "kr"
            UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
            
            let controller = VerifyPhoneNumberViewController()
            controller.modalPresentationStyle = .fullScreen
            controller.number = number
            self.present(controller, animated: true, completion: nil)
            
        }
        
        
    }
    }
    
    
    

}
