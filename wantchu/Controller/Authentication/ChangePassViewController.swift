//
//  ChangePassViewController.swift
//  wantchu
//
//  Created by Dustin on 2020/08/19.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class ChangePassViewController: UIViewController {
    
    //MARK: - Properties
    
    let networkModel = CallRequest()
    let networkUrl = NetWorkURL()
    var number = "전화번호"
    
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(systemName: "lock")!
        return iv
    }()
    
    private lazy var passwordCheckContainerView: UIView = {
        let view = Utilites().inputContainerView(withImage: UIImage(systemName: "plus")!, textField: passwordCheckTextField )
        
        return view
        
    }()
    
    private lazy var passwordContainerView: UIView = {
        let view = Utilites().inputContainerView(withImage: UIImage(systemName: "plus")!, textField: passwordTextField )
        
        return view
        
    }()
    
    private let passwordCheckTextField : UITextField = {
        let tf =  Utilites().textField(withPlaceholder: "비밀번호 입력")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let passwordTextField : UITextField =  {
        let tf =  Utilites().textField(withPlaceholder: "비밀번호 재입력")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    
    private let logInButton : UIButton = {
        let button = Utilites().buttonUI(setTitle: "완료")
        button.addTarget(self, action: #selector(handleDone), for: .touchUpInside)
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
        
        view.addSubview(logInButton)
        
        logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        logoImageView.setDimensions(width: 150, height: 150)
        
        let stack = UIStackView(arrangedSubviews: [passwordCheckContainerView,passwordContainerView])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        view.addSubview(stack)
        stack.anchor(top:logoImageView.bottomAnchor, left: view.leftAnchor ,right: view.rightAnchor, paddingTop: 30 , paddingLeft: 16, paddingRight: 16)
        
        
        logInButton.anchor(top:stack.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 100,paddingLeft: 16,paddingRight: 16)
        
        
        
    }
    
    //MARK: - Selectors
    
    @objc func handleDone() {
        
        guard let password = passwordTextField.text else { return }
        guard let passwordCheck = passwordCheckTextField.text else { return }
        
        if password == passwordCheck {
            
            let param = ["phone": number, "pass":"4321"]
            
            networkModel.post(method: .put, param: param, url: networkUrl.passwordUpdateURL) { json in
                print(json)
                
                let alert = UIAlertController(title: "비밀번호 변경 완료", message: "비밀번호가 변경되었습니다.", preferredStyle: .alert)
                
                
                let ok = UIAlertAction(title: "확인", style: .default) { completion in
                    self.navigationController?.popToRootViewController(animated: true)
                }
                alert.addAction(ok)
                
                self.present(alert, animated: true , completion: nil)
            }
            
        } else {
            
            let alert = UIAlertController(title: "비밀번호를 다시 확인해주세요.", message: "비밀번호가 일치하지 않습니다.", preferredStyle: .alert)
            
            
            let ok = UIAlertAction(title: "확인", style: .cancel) { completion in
                
            }
            alert.addAction(ok)
            
            self.present(alert, animated: true , completion: nil)
            
            
        }
        
    }
    
    func showAlertOK(mainTitle : String , mainMessage : String , alertMessage: String){
        
        
    }
    
}
