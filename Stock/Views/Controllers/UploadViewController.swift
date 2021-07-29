//
//  UploadViewController.swift
//  Stock
//
//  Created by Amber ÇATALBAŞ on 26.05.2021.
//

import UIKit
import Firebase
import FirebaseFirestore

class UploadViewController: UIViewController {
  
  struct Constants {
    static let cornerRadius: CGFloat = 8.0
  }
  
  private let productNameText: UITextField = {
    
    let field = UITextField()
    field.placeholder = " Ürün Adı"
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
    field.placeholder = "Alınan Miktar"
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
    field.placeholder = "Alış Fiyatı"
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
    field.placeholder = "Satış Fiyatı"
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
    field.placeholder = "Stok Adedi"
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
    field.placeholder = "Tarih"
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
    field.placeholder = "Toplam Stok"
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
  

  
  private let productNameTextLabel: UILabel = {
    
    let label = UILabel()
    label.text = "Ürün Adı:"
    label.textAlignment = .left
    return label
  } ()
  
  
  
  let datePicker = UIDatePicker()
  var totalStock = 0
  
  private var productsViewModel: ProductsViewModel!
  private var productsListViewModel: ProductsListViewModel!
  private var products = [Product]()
  
  
  var productIDArray = [String]()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemBackground
    
    addSubviews()
    
    saveButton.addTarget(self,
                         action: #selector(didTapSaveButton),
                         for: .touchUpInside)
   
    createDatePicker()
    //get()
    plusFunc()
  }
  func plusFunc() {
    if let initialStockQuantity = Int(initialStockQuantityText.text!){
      if let purchaseNumber = Int(purchaseNumberText.text!) {
        totalStock = initialStockQuantity + purchaseNumber
        totalStockText.text = String(totalStock)
        print(totalStock)
      }
    }
   
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
      y: productNameTextLabel.bottom + 10 ,
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
  private func createDatePicker () {
    
    dateText.textAlignment = .center
    
    
    //toolbar
    let toolBar = UIToolbar()
    toolBar.sizeToFit()
    // bar button
    let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(donePressed))
    
    toolBar.setItems([doneButton], animated: true)
    // assign toolbar
    dateText.inputAccessoryView = toolBar
    
    // assign date picker to tha text field
    dateText.inputView = datePicker
    
    //datepicker mode
    datePicker.preferredDatePickerStyle = .wheels
    datePicker.datePickerMode = .date
    
    let loc = Locale.init(identifier: "tr")
    self.datePicker.locale = loc
    
  }
  
  
  @objc func donePressed() {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .none
    formatter.locale = Locale(identifier: "tr")
    
    
    dateText.text = formatter.string(from: datePicker.date)
    self.view.endEditing(true)
    view.frame.origin.y = 0
    
    
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
    view.addSubview(productNameTextLabel)
    
    
    
  }
  @objc private func didTapSaveButton() {
    
    //Database
    plusFunc()
    
    
    let firestoreDatabase = Firestore.firestore()
    
    var firestoreReference : DocumentReference? = nil
    let productModel = [
      "productName": self.productNameText.text,
      "purchaseNumber": self.purchaseNumberText.text,
      "purchasePrice": self.purchasePriceText.text,
      "salePrice": self.salePriceText.text,
      "initialStockQuantity": self.initialStockQuantityText.text,
      "date": self.dateText.text,
      "totalStock": self.totalStockText.text] as [String: Any]
    
    FirebaseService().didTapSave(filePath: "Product", productModel: productModel)
    
    
    
    
  }
  func get()  {
    let docRef = Firestore.firestore().collection("Product").order(by: "date").addSnapshotListener { [self] (snapshot, error) in
      if error != nil {
        print("error")
      } else {
        if snapshot != nil {
          for product in snapshot!.documents {
            let documentID = product.documentID
            self.productIDArray.append(documentID)
            
            print(documentID)
            
            let product = Product(
              productName: product.get("productName") as! String,
              purchaseNumber: product.get("purchaseNumber") as! String,
              purchasePrice: product.get("purchasePrice") as! String,
              salePrice: product.get("salePrice") as! String,
              initialStockQuantity: product.get("initialStockQuantity") as! String,
              date: product.get("date") as! String,
              totalStock: product.get("totalStock" ) as! String)
            
              self.products.append(product)
            
            productNameText.text = products[0].productName
            purchaseNumberText.text = products[0].purchaseNumber
            purchasePriceText.text = products[0].purchasePrice
            salePriceText.text = products[0].salePrice
            initialStockQuantityText.text = products[0].initialStockQuantity
            dateText.text = products[0].date
              
          }
        }
      }
    }
    
  }

}








