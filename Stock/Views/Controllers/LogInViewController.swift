//
//  LogInViewController.swift
//  Stock
//
//  Created by Amber ÇATALBAŞ on 26.05.2021.
//

import UIKit
import Firebase
import SafariServices


class LogInViewController: UIViewController {
    
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }
  private let headerView: UIView = {
          let header = UIView()
          header.clipsToBounds = true
        let backgroudImageView = UIImageView(image: UIImage(named: "Logo"))
          header.addSubview(backgroudImageView)
          return header
      } ()
    
    private let emailText: UITextField = {
        
        let field = UITextField()
        field.placeholder = "Username or email"
        field.returnKeyType = .next
        field.leftViewMode  = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor  = UIColor.secondaryLabel.cgColor
        field.keyboardType = .emailAddress
        return field
    } ()
    
    private let passwordText: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password..."
        field.returnKeyType = .continue
        field.leftViewMode  = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor  = UIColor.secondaryLabel.cgColor
        return field
    } ()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        
        return button
    } ()
    
  
    
    
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        return button
    } ()
    
    private let termsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Terms of Service", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    } ()
    private let privacyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        loginButton.addTarget(self,
                              action: #selector(didTapLoginButton),
                              for: .touchUpInside)
        privacyButton.addTarget(self,
                              action: #selector(didTapPrivacyButton),
                              for: .touchUpInside)
        termsButton.addTarget(self,
                              action: #selector(didTapTermsButton),
                              for: .touchUpInside)
        createAccountButton.addTarget(self,
                              action: #selector(didTapCreateAccountButton),
                              for: .touchUpInside)
        
                              
        
        
        emailText.delegate = self
        passwordText.delegate = self
        
        addSubviews()
        
        view.backgroundColor = .systemBackground
        
    
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        //assign frames
      
    
        headerView.frame = CGRect(
            x: 0,
          y: view.safeAreaInsets.bottom,
            width: view.width,
            height: view.height/3)
        
        emailText.frame = CGRect(
            x: 25,
            y: headerView.bottom + 10,
            width: view.width - 50,
            height: 52.0)
        
        passwordText.frame = CGRect(
            x: 25,
            y: emailText.bottom + 10,
            width: view.width - 50,
            height: 52.0)
        
        loginButton.frame = CGRect(
            x: 25,
            y: passwordText.bottom + 10,
            width: view.width - 50,
            height: 52.0)
        
        createAccountButton.frame = CGRect(
            x: 25,
            y: loginButton.bottom + 10,
            width: view.width - 50,
            height: 52.0)
        
        termsButton.frame = CGRect(
            x: 10,
            y: view.height - view.safeAreaInsets.bottom - 100,
            width: view.width - 20,
            height: 50)
        privacyButton.frame = CGRect(
            x: 10,
            y: view.height - view.safeAreaInsets.bottom - 50,
            width: view.width - 20,
            height: 50)
        
        
       
        configureHeaderView()
       
    }
    
    private func configureHeaderView() {
        guard headerView.subviews.count == 1 else {
            return
        }
        guard let backgroundView = headerView.subviews.first else {
            return
        }
        backgroundView.frame = headerView.bounds
        
        //add Instagram logo
        let imageView = UIImageView(image: UIImage(named: "mobirollerText"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width/100-5,
                                 y: view.safeAreaInsets.top+100,
                                 width: headerView.width,
                                 height: headerView.height - view.safeAreaInsets.top)

    }
    
    private func addSubviews() {
        view.addSubview(emailText)
        view.addSubview(passwordText)
        view.addSubview(loginButton)
        view.addSubview(createAccountButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(headerView)
    }
    @objc private func didTapLoginButton() {
        passwordText.resignFirstResponder()
        emailText.resignFirstResponder()
        
        if emailText.text != "" && passwordText.text != ""  {
            Auth.auth().signIn(withEmail: emailText.text!,
                               password: passwordText.text!) { (authdata, error) in
                if error != nil {
                    self.makeAlert(title: "Error",
                                   message: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }

        } else {
            makeAlert(title: "Error", message: "Email/Password is empty!")
        }
    }
    @objc private func didTapTermsButton() {
        guard let url = URL(string: "https://catalbas-yemcilik-besicilik.business.site/") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @objc private func didTapPrivacyButton() {
        guard let url = URL(string: "https://catalbas-yemcilik-besicilik.business.site/") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @objc private func didTapCreateAccountButton() {
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().createUser(withEmail: emailText.text!,
                                   password: passwordText.text!) { (authdata, error) in
                if error != nil {
                    self.makeAlert(title: "Error!",
                              message: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else {
            self.makeAlert(title: "Error",
                         message: "Email/Password is empty!")
            
        }
    }
  
}

extension LogInViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailText {
            passwordText.becomeFirstResponder()
        } else if textField == passwordText {
            didTapLoginButton()
        }
        return true
    }
}

extension UIViewController {
  func makeAlert(title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okButton = UIAlertAction(title: "OK",
                                 style: .default,
                                 handler: nil)
    alert.addAction(okButton)
    self.present(alert, animated: true, completion: nil)
    
  }
}
