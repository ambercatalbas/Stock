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
  private let invoiceDescriptionText: UITextField = {
    
    let field = UITextField()
    field.placeholder = " invoiceDescription"
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
  private let customerNameText: UITextField = {
    
    let field = UITextField()
    field.placeholder = " customerName"
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
  
  
  
  private let collectionStatusText: UITextField = {
    
    let field = UITextField()
    field.placeholder = "collectionStatus"
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
  
  private let invoiceDateText: UITextField = {
    
    let field = UITextField()
    field.placeholder = "invoiceDate"
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
  private let expiryDateText: UITextField = {
    
    let field = UITextField()
    field.placeholder = "expiryDateText"
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
  
  private let productsText: UITextField = {
    
    let field = UITextField()
    field.placeholder = "productsText"
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
  private let totalPriceText: UITextField = {
    
    let field = UITextField()
    field.placeholder = "totalPriceText"
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
  private let productNameText: UITextField = {
    
    let field = UITextField()
    field.placeholder = "productNameText"
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
  private let quantityText: UITextField = {
    
    let field = UITextField()
    field.placeholder = "quantityText"
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
    field.placeholder = "salePrice"
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
  private let addButton: UIButton = {
    let button = UIButton()
    button.setTitle("Ürün EKLE", for: .normal)
    button.layer.masksToBounds = true
    button.layer.cornerRadius = Constants.cornerRadius
    button.backgroundColor = .systemBlue
    button.setTitleColor(.white, for: .normal)
    
    return button
  } ()
  
  var pickerView = UIPickerView()
  
  
  
  var cities = ["a", "b", "c"]
  
    override func viewDidLoad() {
        super.viewDidLoad()

      
      pickerView.delegate = self
      pickerView.dataSource = self
      
 addSubviews()

      addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
      
    }
  @objc func addButtonTapped() {
    performSegue(withIdentifier: "toAddProductVC", sender: self)
    
  }
    
  private func addSubviews() {
    view.addSubview(invoiceDescriptionText)
    view.addSubview(customerNameText)
    view.addSubview(collectionStatusText)
    view.addSubview(invoiceDateText)
    view.addSubview(expiryDateText)
    view.addSubview(productsText)
    view.addSubview(totalPriceText)
    view.addSubview(productNameText)
    view.addSubview(quantityText)
    view.addSubview(salePriceText)
    view.addSubview(addButton)
    
    
    customerNameText.inputView = pickerView
    
  }
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    invoiceDescriptionText.frame = CGRect(
      x: 20,
      y: view.safeAreaInsets.bottom + 20,
      width: view.width - 40,
      height: 40.0)
    
    customerNameText.frame = CGRect(
      x: 20,
      y: invoiceDescriptionText.bottom+5,
      width: view.width - 40,
      height: 40.0)
    collectionStatusText.frame = CGRect(
      x: 20,
      y: customerNameText.bottom + 5,
      width: view.width/2-25,
      height: 40)
    
    expiryDateText.frame = CGRect(
      x: view.width/2+5,
      y: customerNameText.bottom + 5,
      width: view.width/2-25,
      height: 40)
    
    productsText.frame = CGRect(
      x: 20,
      y: collectionStatusText.bottom+5,
      width: view.width - 40,
      height: 40.0)
    
    
    totalPriceText.frame = CGRect(
      x: 20,
      y: productsText.bottom + 5,
      width: view.width/2-25,
      height: 40)
    
    invoiceDateText.frame = CGRect(
      x: view.width/2+5,
      y: productsText.bottom + 5,
      width: view.width/2-25,
      height: 40)
    
    addButton.frame = CGRect(
      x: view.width/2+5,
      y: totalPriceText.bottom + 5,
      width: view.width/2-25,
      height: 40)
    
    
    
    
  }

}

extension SaleViewController: UIPickerViewDelegate, UIPickerViewDataSource {
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return cities.count
  }
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return cities[row]
  }
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    //TODO
    
    customerNameText.text = cities[row]
    customerNameText.resignFirstResponder()
    
  }
}
