//
//  SearchVC.swift
//  GHFollowers
//
//  Created by Shilpa Joy on 2023-03-15.
//

import UIKit

class SearchVC: UIViewController {

    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let callToActionButtom = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    var isUsernameEntered: Bool { return !usernameTextField.text!.isEmpty }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
        createDismissKeyboardTapGesture()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.isNavigationBarHidden = true
    }
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushFollowerListVC() {
        guard isUsernameEntered else {
            presentGFAlertOnMainThread(title: "Empty Username", message: "Please enter a username, We need to know who to look for 😀.", buttonTitle: "Ok")
            return
            
        }
        let follwerListVC = FolloweListVC()
        follwerListVC.userName = usernameTextField.text
        follwerListVC.title = usernameTextField.text
        navigationController?.pushViewController(follwerListVC, animated: true)
        
    }
    
    func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
        func configureTextField() {
            view.addSubview(usernameTextField)
            usernameTextField.delegate = self
            NSLayoutConstraint.activate([
                usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
                usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
                usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
                usernameTextField.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
    
    func configureCallToActionButton() {
        view.addSubview(callToActionButtom)
        callToActionButtom.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButtom.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButtom.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButtom.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButtom.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
