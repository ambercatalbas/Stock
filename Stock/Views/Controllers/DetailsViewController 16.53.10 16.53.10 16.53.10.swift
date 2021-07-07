//
//  DetailsViewController.swift
//  StockTarcking
//
//  Created by Yasemin YEL on 6.07.2021.
//

import UIKit

class DetailsViewController: UIViewController {

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
    field.keyboardType = .numberPad
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
    
    return field
  } ()
  
  private let salePriceText: UITextField = {
    
    let field = UITextField()
    field.placeholder = "salePriceText"
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
  private let initialStockQuantityText: UITextField = {
    
    let field = UITextField()
    field.placeholder = "initialStockQuantityText"
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
  private let dateText: UITextField = {
    
    let field = UITextField()
    field.placeholder = "dateText"
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
  private let totalStockText: UITextField = {
    
    let field = UITextField()
    field.placeholder = "totalStockText"
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
  
  
  private let saveButton: UIButton = {
    let button = UIButton()
    button.setTitle("SAVE", for: .normal)
    button.layer.masksToBounds = true
    button.layer.cornerRadius = Constants.cornerRadius
    button.backgroundColor = .systemBlue
    button.setTitleColor(.white, for: .normal)
    
    return button
  } ()
  
  private let updateButton: UIButton = {
    let button = UIButton()
    button.setTitle("UPDATE DATA", for: .normal)
    button.layer.masksToBounds = true
    button.layer.cornerRadius = Constants.cornerRadius
    button.backgroundColor = .systemGreen
    button.setTitleColor(.white, for: .normal)
    
    return button
  } ()
  
  var productName = ""
  var purchaseNumber = ""
  var initialStockQuantity = ""
  var purchasePrice = ""
  var salePrice = ""
  var date = ""
  var totalStock = ""
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
      
      productNameText.text = productName
      purchaseNumberText.text = purchaseNumber
      initialStockQuantityText.text = initialStockQuantity
      purchasePriceText.text = purchasePrice
      salePriceText.text = salePrice
      dateText.text = date
      totalStockText.text = totalStock
      
    }
  private func addSubviews() {
    view.addSubview(productNameText)
    view.addSubview(purchaseNumberText)
    view.addSubview(initialStockQuantityText)
    view.addSubview(purchasePriceText)
    view.addSubview(salePriceText)
    view.addSubview(dateText)
    view.addSubview(saveButton)
    view.addSubview(totalStockText)
    
    
  }
    

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    
    
    productNameText.frame = CGRect(
      x: 20,
      y: view.safeAreaInsets.bottom + 20,
      width: view.width - 40,
      height: 52.0)
    
    initialStockQuantityText.frame = CGRect(
      x: 20,
      y: productNameText.bottom + 10,
      width: view.width/2-25,
      height: 52.0)
    
    purchaseNumberText.frame = CGRect(
      x: view.width/2+5,
      y: productNameText.bottom + 10,
      width: view.width/2-25,
      height: 52.0)
    purchasePriceText.frame = CGRect(
      x: 20,
      y: purchaseNumberText.bottom + 10,
      width: view.width/2-25,
      height: 52.0)
    salePriceText.frame = CGRect(
      x: view.width/2+5,
      y: purchaseNumberText.bottom + 10,
      width: view.width/2-25,
      height: 52.0)
    dateText.frame = CGRect(
      x: view.width/2+5,
      y: salePriceText.bottom + 10,
      width: view.width/2-25,
      height: 52.0)
    totalStockText.frame = CGRect(
      x: 20,
      y: salePriceText.bottom + 10,
      width: view.width/2-25,
      height: 52.0)
    
    saveButton.frame = CGRect(
      x: 25,
      y: dateText.bottom + 10,
      width: view.width - 50,
      height: 52.0)
    
    
  }
  
  
}
