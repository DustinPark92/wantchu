//
//  LogInController.swift
//  wantchu
//
//  Created by Dustin on 2020/08/17.
//  Copyright © 2020 Dustin. All rights reserved.
//


import UIKit
import Alamofire
import SwiftyJSON

class LoginController: UIViewController {
    //MARK: - Properties
    
    let networkModel = CallRequest()
    let networkUrl = NetWorkURL()
    
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(systemName: "lock")!
        return iv
    }()
    
    private lazy var emailContainerView: UIView = {
        let view = Utilites().inputContainerView(withImage: UIImage(systemName: "plus")!, textField: emailTextField )
        
        return view
        
    }()
    
    private lazy var passwordContainerView: UIView = {
        let view = Utilites().inputContainerView(withImage: UIImage(systemName: "plus")!, textField: passwordTextField )
        
        return view
        
    }()
    
    private let emailTextField : UITextField = Utilites().textField(withPlaceholder: "전화번호")
    
    
    private let passwordTextField : UITextField =  {
        let tf =  Utilites().textField(withPlaceholder: "비밀번호")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let forgetPassButton : UIButton = {
        let bt = UIButton()
        bt.setTitle("비밀번호 찾기", for: .normal)
        bt.addTarget(self, action: #selector(handleFindPass), for: .touchUpInside)
        return bt
    }()
    
    private let rememberInfo : UIButton = {
        let bt = UIButton()
        bt.setTitle("아이디/비밀번호 저장", for: .normal)
        bt.setImage(UIImage(systemName: "square"), for: .normal)
        bt.isSelected = false
        bt.addTarget(self, action: #selector(handleRememberInfo), for: .touchUpInside)
        return bt
    }()
    
    private let logInButton : UIButton = {
        let button = Utilites().buttonUI(setTitle: "로그인")
        button.addTarget(self, action: #selector(handleLogin(_:)), for: .touchUpInside)
        return button
    }()
    

    
    private let dontHaveAccountButton: UIButton = {
        let button = Utilites().attributedButton("Don't have an account?", " Sign Up")
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    

    
    
    
    //MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barTintColor = .twitterBlue
        
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .twitterBlue
        //status 창 white로 바뀐다.
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = true
        
        
        view.addSubview(logoImageView)
        view.addSubview(forgetPassButton)
        view.addSubview(logInButton)
        view.addSubview(rememberInfo)
        logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        logoImageView.setDimensions(width: 150, height: 150)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView,passwordContainerView])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        view.addSubview(stack)
        stack.anchor(top:logoImageView.bottomAnchor, left: view.leftAnchor ,right: view.rightAnchor, paddingTop: 30 , paddingLeft: 16, paddingRight: 16)
        
        forgetPassButton.anchor(top:stack.bottomAnchor,right: view.rightAnchor , paddingTop: 23,paddingRight: 30)
        
        rememberInfo.anchor(top:stack.bottomAnchor,left: view.leftAnchor,paddingTop: 30,paddingLeft: 20)
        
        logInButton.anchor(top:stack.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 100,paddingLeft: 16,paddingRight: 16)
        
        
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(left:view.leftAnchor,bottom:view.safeAreaLayoutGuide.bottomAnchor,right: view.rightAnchor)
        
        
        
    }
    




    
    @objc private func handleLogin(_ sender: UIButton) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        let param = ["phone":"\(email)","pass":"\(password)"]
        
        networkModel.post(method: .post, param: param, url: networkUrl.logInURL) { json in
            print(json)
        }
        
        }
                
    
    
    @objc func handleSignUp() {
        let controller = AuthenticatePhoneViewController()
        navigationController?.pushViewController(controller, animated: true)

    }
    
    @objc func handleFindPass() {
        let controller = FogetPasswordViewController()
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
    @objc func handleRememberInfo(sender : UIButton) {
    
        if sender.isSelected == false {
            sender.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            sender.isSelected = true
        } else if sender.isSelected == true {
            sender.setImage(UIImage(systemName: "square"), for: .normal)
            sender.isSelected = false
        }
        
    }
    
 
    
}
