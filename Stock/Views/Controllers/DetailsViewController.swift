//
//  DetailsViewController.swift
//  StockTarcking
//
//  Created by Yasemin YEL on 6.07.2021.
//

import UIKit
import Firebase
import FirebaseFirestore

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
    field.keyboardType = .decimalPad
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
    field.keyboardType = .decimalPad
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
  
  
  private let updateButton: UIButton = {
    let button = UIButton()
    button.setTitle("GÜNCELLE", for: .normal)
    button.layer.masksToBounds = true
    button.layer.cornerRadius = Constants.cornerRadius
    button.backgroundColor = .systemGreen
    button.setTitleColor(.white, for: .normal)
    
    return button
  } ()
  
  
  private let productNameTextLabel: UILabel = {
    
    let label = UILabel()
    label.text = "Ürün Adı:"
    label.textAlignment = .left
    return label
  } ()
  private let initialStockQuantityTextLabel: UILabel = {
    
    let label = UILabel()
    label.text = "Stok Adedi:"
    label.textAlignment = .left
    return label
  } ()
  private let purchaseNumberTextLabel: UILabel = {
    
    let label = UILabel()
    label.text = "Alınan Miktar:"
    label.textAlignment = .left
    return label
  } ()
  private let purchasePriceTextLabel: UILabel = {
    
    let label = UILabel()
    label.text = "Alış Fiyatı:"
    label.textAlignment = .left
    return label
  } ()
  private let salePriceTextLabel: UILabel = {
    
    let label = UILabel()
    label.text = "Satış Fiyatı"
    label.textAlignment = .left
    return label
  } ()

  
  var productName = ""
  var purchaseNumber = ""
  var initialStockQuantity = ""
  var purchasePrice = ""
  var salePrice = ""
  var date = ""
  var totalStock = ""
  var productID = ""
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
      updateButton.addTarget(self, action: #selector(didTapUpdateButton), for: .touchUpInside)
     
    }
 
 
  private func addSubviews() {
    view.addSubview(productNameText)
    view.addSubview(purchaseNumberText)
    view.addSubview(initialStockQuantityText)
    view.addSubview(purchasePriceText)
    view.addSubview(salePriceText)
    view.addSubview(dateText)
    view.addSubview(updateButton)
    view.addSubview(totalStockText)
    view.addSubview(productNameTextLabel)
    view.addSubview(purchaseNumberTextLabel)
    view.addSubview(initialStockQuantityTextLabel)
    view.addSubview(purchasePriceTextLabel)
    view.addSubview(salePriceTextLabel)
    
  }
    

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    
    productNameTextLabel.frame = CGRect(
      x: 20,
      y: view.safeAreaInsets.bottom + 20,
      width: view.width - 40,
      height: 20.0)
    
    productNameText.frame = CGRect(
      x: 20,
      y: productNameTextLabel.bottom,
      width: view.width - 40,
      height: 52.0)
    
    initialStockQuantityTextLabel.frame = CGRect(
      x: 20,
      y: productNameText.bottom + 10,
      width: view.width/2-25,
      height: 20)
    
    initialStockQuantityText.frame = CGRect(
      x: 20,
      y: initialStockQuantityTextLabel.bottom,
      width: view.width/2-25,
      height: 52.0)
    
    purchaseNumberTextLabel.frame = CGRect(
      x: view.width/2+5,
      y: productNameText.bottom + 10,
      width: view.width/2-25,
      height: 20)
    purchaseNumberText.frame = CGRect(
      x: view.width/2+5,
      y: purchaseNumberTextLabel.bottom,
      width: view.width/2-25,
      height: 52.0)
    purchasePriceTextLabel.frame = CGRect(
      x: 20,
      y: purchaseNumberText.bottom + 10,
      width: view.width/2-25,
      height: 20)
    purchasePriceText.frame = CGRect(
      x: 20,
      y: purchasePriceTextLabel.bottom,
      width: view.width/2-25,
      height: 52.0)
    salePriceTextLabel.frame = CGRect(
      x: view.width/2+5,
      y: purchaseNumberText.bottom + 10,
      width: view.width/2-25,
      height: 20)
    salePriceText.frame = CGRect(
      x: view.width/2+5,
      y: salePriceTextLabel.bottom,
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
    
    updateButton.frame = CGRect(
      x: 25,
      y: dateText.bottom + 10,
      width: view.width - 50,
      height: 52.0)
    
    
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    
    productNameText.text = productName
    purchaseNumberText.text = purchaseNumber
    initialStockQuantityText.text = initialStockQuantity
    purchasePriceText.text = purchasePrice
    salePriceText.text = salePrice
    dateText.text = date
    totalStockText.text = totalStock
  }
  @objc private func didTapUpdateButton() {
      
      //update data
      
      let fireStoreDatabase = Firestore.firestore()
           
                      let productStore = ["productName": self.productNameText.text!,
                                       "purchaseNumber" : self.purchaseNumberText.text!,
                                       "initialStockQuantity" : self.initialStockQuantityText.text!,
                                       "purchasePrice" : self.purchasePriceText.text!,
                                       "salePrice" : self.salePriceText.text!] as [String : Any]
    let productModel = [
      "productName": self.productNameText.text!,
      "purchaseNumber": self.purchaseNumberText.text!,
      "purchasePrice": self.purchasePriceText.text!,
      "salePrice": self.salePriceText.text!,
      "initialStockQuantity": self.initialStockQuantityText.text!] as [String: Any]
                      
                      fireStoreDatabase.collection("Product").document(productID).setData(productModel, merge: true)
      self.dismiss(animated: true, completion: nil)
      
      
  }
  
}
