//
//  SaleViewController.swift
//  Stock
//
//  Created by Yasemin YEL on 8.07.2021.
//

import UIKit

class SaleViewController: UIViewController {

  struct Constants {
    static let cornerRadius: CGFloat = 8.0
  }
  
  private let productNameText: UITextField = {
    
    let field = UITextField()
    field.placeholder = " productNameText"
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
    
    return field
  } ()
  
  
  
  private let purchaseNumberText: UITextField = {
    
    let field = UITextField()
    field.placeholder = "purchaseNumberText"
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
    field.keyboardType = .decimalPad
    return field
  } ()
  
  private let purchasePriceText: UITextField = {
    
    let field = UITextField()
    field.placeholder = "purchasePriceText"
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
    field.keyboardType = .decimalPad
    return field
  } ()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}
