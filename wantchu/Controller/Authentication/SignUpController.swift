//
//  SignUpController.swift
//  wantchu
//
//  Created by Dustin on 2020/08/17.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit


class SignUpViewController: UIViewController {
    //MARK: - Properties
    
    let networkModel = CallRequest()
    let networkUrl = NetWorkURL()
    var number = "전화번호"
    
    
    private let imagePicker = UIImagePickerController()
    private var profileImage : UIImage?
    
    
    
    private let plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleAddProfilerPhoto), for: .touchUpInside)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 128 / 2
        button.clipsToBounds = true
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()
    
    private lazy var emailContainerView: UIView = {
        let view = Utilites().inputContainerView(withImage: UIImage(systemName: "plus")!, textField: emailTextField )
        
        return view
        
    }()
    
    private lazy var passwordContainerView: UIView = {
        let view = Utilites().inputContainerView(withImage: UIImage(systemName: "plus")!, textField: passwordTextField )
        
        return view
        
    }()
    
    private lazy var passwordCheckContainerView: UIView = {
        let view = Utilites().inputContainerView(withImage: UIImage(systemName: "plus")!, textField: passwordCheckTextField )
        
        return view
        
    }()
    
    private lazy var usernameContainerView: UIView = {
        let view = Utilites().inputContainerView(withImage: UIImage(systemName: "plus")!, textField: usernameTextField )
        
        return view
        
    }()
    
    private let emailTextField : UITextField = Utilites().textField(withPlaceholder: "이메일 입력 ex) 이메일@naver.com")
    
    
    private let passwordTextField : UITextField =  {
        let tf =  Utilites().textField(withPlaceholder: "비밀번호 입력")
        tf.isSecureTextEntry = true
        
        return tf
    }()
    
    private let passwordCheckTextField : UITextField = Utilites().textField(withPlaceholder: "비밀번호 확인 입력")
    
    private let usernameTextField : UITextField = Utilites().textField(withPlaceholder: "이름을 입력하세요.")
    
    private let signUpButton : UIButton = {
        let button = Utilites().buttonUI(setTitle: "Sign Up")
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    
    private let alreadyHaveAccountButton: UIButton = {
        let button = Utilites().attributedButton("Already Have an account?", " Sign In")
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        return button
    }()
    
    //MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .twitterBlue
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        plusPhotoButton.setDimensions(width: 128, height: 128)
        
        let stack = UIStackView(arrangedSubviews: [usernameContainerView,passwordContainerView,passwordCheckContainerView,emailContainerView,signUpButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        view.addSubview(stack)
        stack.anchor(top:plusPhotoButton.bottomAnchor, left: view.leftAnchor ,right: view.rightAnchor, paddingTop: 30 , paddingLeft: 16, paddingRight: 16)
        
        
        
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.anchor(left:view.leftAnchor,bottom:view.safeAreaLayoutGuide.bottomAnchor,right: view.rightAnchor)
    }
    
    //MARK: - Selectors
    
    @objc func handleShowLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleSignUp() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let username = usernameTextField.text?.lowercased() else { return }
       

        
        
        let param = ["phone":"\(number)",
            "email":"\(email)",
            "nick":"\(username)",
            "pass":"\(password)"]
    
        if email.isValidEmailAddress(email: email) {
        networkModel.post(method: .post, param: param, url: networkUrl.SignUpURL) { json in
            print(json)
        }
        } else {
            print("Email 타입이 아닙니다.")
        }
          
        
        
    }
    
    @objc func handleAddProfilerPhoto() {
        
        present(imagePicker, animated: true, completion: nil)
        
    
        
    }
}


extension SignUpViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let profileImage = info[.editedImage] as? UIImage else { return }
        self.profileImage = profileImage
        
        //이미지에 보더 선 그리기
        plusPhotoButton.layer.borderColor = UIColor.white.cgColor
        plusPhotoButton.layer.borderWidth = 3
        self.plusPhotoButton.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal)
        dismiss(animated: true, completion: nil)
    }
    
}
