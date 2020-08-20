//
//  VerifyPhoneNumberViewController.swift
//  wantchu
//
//  Created by Dustin on 2020/08/18.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit
import Firebase

class VerifyPhoneNumberViewController: UIViewController {
        
        
        //MARK: - Properties
    
    
        var ref = Database.database().reference()
        var number = "전화번호"
        let networkModel = CallRequest()
        let networkUrl = NetWorkURL()

    
    
        private let mainImageView: UIImageView = {
            let iv = UIImageView()
            iv.contentMode = .scaleAspectFit
            iv.clipsToBounds = true
            iv.image = UIImage(systemName: "lock")!
            return iv
        }()
        
        
        private let mainLabel : UILabel = {
            let lb = UILabel()
            lb.text = "문자인증"
            lb.font = UIFont.systemFont(ofSize: 30)
            return lb
        }()
    
        private let verifyView : UIView = {
            let uv = UIView()
            
            return uv
        }()
    
        private let digitTextField : UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .red
        tf.textContentType = .oneTimeCode
        tf.borderStyle = .roundedRect
        tf.keyboardType = .numberPad
        tf.setDimensions(width: 40, height: 40)
        return tf
        }()
        
        private let digitTextField1 : UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .red
        tf.textContentType = .oneTimeCode
        tf.borderStyle = .roundedRect
             tf.keyboardType = .numberPad
        tf.setDimensions(width: 40, height: 40)
        return tf
        }()
    
        private let digitTextField2 : UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .red
        tf.textContentType = .oneTimeCode
            tf.borderStyle = .roundedRect
             tf.keyboardType = .numberPad
        tf.setDimensions(width: 40, height: 40)
        return tf
        }()
    
        private let digitTextField3 : UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .red
        tf.textContentType = .oneTimeCode
            tf.borderStyle = .roundedRect
             tf.keyboardType = .numberPad
        tf.setDimensions(width: 40, height: 40)
        return tf
        }()
    
            private let digitTextField4 : UITextField = {
            let tf = UITextField()
            tf.backgroundColor = .red
            tf.textContentType = .oneTimeCode
                tf.borderStyle = .roundedRect
                 tf.keyboardType = .numberPad
            tf.setDimensions(width: 40, height: 40)
            return tf
            }()
        
            private let digitTextField5 : UITextField = {
            let tf = UITextField()
            tf.backgroundColor = .red
            tf.textContentType = .oneTimeCode
                tf.borderStyle = .roundedRect
                 tf.keyboardType = .numberPad
            tf.setDimensions(width: 40, height: 40)
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
            configureTextField()
            view.backgroundColor = .twitterBlue
        }
        
        
        //MARK: - Helpers
    
    func configureTextField() {
        digitTextField.delegate = self
        digitTextField1.delegate = self
        digitTextField2.delegate = self
        digitTextField3.delegate = self
        digitTextField4.delegate = self
        digitTextField5.delegate = self
        
        
    }
        
        
        func configureUI() {
         
            view.addSubview(mainImageView)
            view.addSubview(mainLabel)
            view.addSubview(requestButton)
            
            let tfStack = UIStackView(arrangedSubviews: [digitTextField,digitTextField1,digitTextField2,digitTextField3,digitTextField4,digitTextField5])
            tfStack.spacing = 5
            tfStack.distribution = .fillProportionally
            tfStack.axis = .horizontal
            view.addSubview(tfStack)
            mainImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
            mainImageView.setDimensions(width: 150, height: 150)
            
            
            mainLabel.centerX(inView: view,topAnchor: mainImageView.bottomAnchor,paddingTop: 30)
            tfStack.centerX(inView: view, topAnchor: mainLabel.bottomAnchor, paddingTop: 30)
           
            requestButton.centerX(inView: view, topAnchor: tfStack.bottomAnchor, paddingTop: 30)
            requestButton.setDimensions(width: view.frame.width - 60, height: 50)
            
            
   

            
            
            
            
            
            
        }
        
        //MARK: - objc
        
        
        @objc func handleRequest() {
            
            guard let  verificationID = UserDefaults.standard.string(forKey: "authVerificationID") else { return }
            
            guard let tf1 = digitTextField.text else { return }
            guard let tf2 = digitTextField1.text else { return }
            guard let tf3 = digitTextField2.text else { return }
            guard let tf4 = digitTextField3.text else { return }
            guard let tf5 = digitTextField4.text else { return }
            guard let tf6 = digitTextField5.text else { return }
            
            
            let verificationCode = "\(tf1)\(tf2)\(tf3)\(tf4)\(tf5)\(tf6)"
            
            print(verificationCode)
            
            let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationID,
            verificationCode: verificationCode)
            
            
            Auth.auth().signInAndRetrieveData(with: credential) { (success, err) in
                if err == nil {
                    print("Login Success")
                    let controller = SignUpViewController()
                    controller.number = self.number
                    controller.modalPresentationStyle = .fullScreen
                    self.present(controller, animated: false
                        , completion: nil)
                } else {
                    print(err?.localizedDescription)
                }
            }
            
    
            
        }
        
        
        

    }


extension VerifyPhoneNumberViewController : UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // On inputing value to textfield
        if ((textField.text?.count)! < 1  && string.count > 0){
            if(textField == digitTextField)
            {
                digitTextField1.becomeFirstResponder()
            }
            if(textField == digitTextField1)
            {
                digitTextField2.becomeFirstResponder()
            }
            if(textField == digitTextField2)
            {
                digitTextField3.becomeFirstResponder()
            }
            
            if(textField == digitTextField3)
            {
                digitTextField4.becomeFirstResponder()
            }
            
            if(textField == digitTextField4)
            {
                digitTextField5.becomeFirstResponder()
            }

            textField.text = string
            return false
        }
        else if ((textField.text?.count)! >= 1  && string.count == 0){
            // on deleting value from Textfield
            if(textField == digitTextField1)
            {
                digitTextField.becomeFirstResponder()
            }
            if(textField == digitTextField2)
            {
                digitTextField1.becomeFirstResponder()
            }
            if(textField == digitTextField3)
            {
                digitTextField2.becomeFirstResponder()
            }
            
            if(textField == digitTextField4)
            {
                digitTextField3.becomeFirstResponder()
            }
            if(textField == digitTextField5)
            {
                digitTextField4.becomeFirstResponder()
            }
     
            textField.text = ""
            return false
        }
        else if ((textField.text?.count)! >= 1  )
        {
            textField.text = string
            return false
        }
        return true
    }
}
