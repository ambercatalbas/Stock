//
//  AddProductViewController.swift
//  Stock
//
//  Created by Amber ÇATALBAŞ on 12.07.2021.
//

import UIKit

class AddProductViewController: UIViewController {

  struct Constants {
    static let cornerRadius: CGFloat = 8.0
  }
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

      addSubviews()
      addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    
    }
  @objc func addButtonTapped() {
    performSegue(withIdentifier: "toAddProductVC", sender: self)
  }
    
  private func addSubviews() {
 
    view.addSubview(productNameText)
    view.addSubview(quantityText)
    view.addSubview(salePriceText)
    view.addSubview(addButton)
    
    
    productNameText.inputView = pickerView
    
  }
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    productNameText.frame = CGRect(
      x: 20,
      y: view.safeAreaInsets.bottom + 20,
      width: view.width - 40,
      height: 40.0)
    
    quantityText.frame = CGRect(
      x: 20,
      y: productNameText.bottom+5,
      width: view.width - 40,
      height: 40.0)
    salePriceText.frame = CGRect(
      x: 20,
      y: quantityText.bottom + 5,
      width: view.width/2-25,
      height: 40)
    
    addButton.frame = CGRect(
      x: view.width/2+5,
      y: salePriceText.bottom + 5,
      width: view.width/2-25,
      height: 40)

}
}

extension AddProductViewController: UIPickerViewDelegate, UIPickerViewDataSource {
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
    
    productNameText.text = cities[row]
    productNameText.resignFirstResponder()
    
  }
}
