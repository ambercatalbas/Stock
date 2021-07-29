//
//  SettingsViewController.swift
//  Stock
//
//  Created by Amber ÇATALBAŞ on 26.05.2021.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }
    
    private let logOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log Out", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        
        return button
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(logOutButton)
        view.backgroundColor = .systemBackground
        
        logOutButton.addTarget(self,
                              action: #selector(didTaplogOutButton),
                              for: .touchUpInside)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        logOutButton.frame = CGRect(
            x: (view.width-view.width/3)/2,
            y: view.height/2 - view.safeAreaInsets.bottom,
            width: view.width/3,
            height: 52.0)
    }
    
    @objc private func didTaplogOutButton() {
        
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toLogInVC", sender: nil)
        } catch {
            print("Error")
        
        }
}
}
