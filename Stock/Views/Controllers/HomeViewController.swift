//
//  HomeViewController.swift
//  StockTarcking
//
//  Created by Yasemin YEL on 6.07.2021.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

  private let tableView: UITableView = {
      let tableView = UITableView()
      tableView.register(FeedTableViewCell   .self, forCellReuseIdentifier: FeedTableViewCell.identifier)
  return tableView
  }()
  
  
  private var productsViewModel: ProductsViewModel!
  private var productsListViewModel: ProductsListViewModel!
  private var products = [Product]()
  
  var productIDArray = [String]()
  
  var selectedproductName = ""
  var selectedpurchaseNumber = ""
  var selectedinitialStockQuantity = ""
  var selectedpurchasePrice = ""
  var selectedsalePrice = ""
  var selecteddate = ""
  var selectedtotalStock = ""
  
  var selectedproductNameArray = [String]()
  var selectedpurchaseNumberArray = [String]()
  var selectedinitialStockQuantityArray = [String]()
  var selectedpurchasePriceArray = [String]()
  var selectedsalePriceArray = [String]()
  var selecteddateArray = [String]()
  var selectedtotalStockArray = [String]()
  var num: Int = 0
  
    override func viewDidLoad() {
        super.viewDidLoad()
      tableView.delegate = self
      tableView.dataSource = self
      view.addSubview(tableView)
      getData()
     
    }
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableView.frame = view.bounds
    
  }

  func getData () {
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
              totalStock: product.get("totalStock") as! String)
            self.products.append(product)
            print(products)
            self.productsListViewModel = ProductsListViewModel(productList: products)
//
//            let productsListViewModell = self.productsListViewModel.productAtIndex(index)
            
            
          }
          self.tableView.reloadData()
        }
      }
    }
    
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    print(products.count)
      return products.count
    
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier, for: indexPath) as? FeedTableViewCell else {
          return UITableViewCell()
    
      }
    cell.configure(nameText: products[indexPath.row].productName, priceText: products[indexPath.row].initialStockQuantity )
    
    
      return cell
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "toDetailsVC" {
          let destinationVC = segue.destination as? DetailsViewController
        destinationVC?.productName = selectedproductName
        destinationVC?.initialStockQuantity = selectedinitialStockQuantity
        destinationVC?.purchaseNumber = selectedpurchaseNumber
        destinationVC?.purchasePrice = selectedpurchasePrice
        destinationVC?.salePrice = selectedsalePrice
        destinationVC?.totalStock = selectedtotalStock
        destinationVC?.date = selecteddate
        
      }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    tableView.reloadData()
    selectedproductName = productsListViewModel.productList[indexPath.row].productName
    selectedinitialStockQuantity = productsListViewModel.productList[indexPath.row].initialStockQuantity
    selectedpurchaseNumber = productsListViewModel.productList[indexPath.row].purchaseNumber
    selectedpurchasePrice = productsListViewModel.productList[indexPath.row].purchasePrice
    selectedsalePrice = productsListViewModel.productList[indexPath.row].salePrice
    selectedtotalStock = productsListViewModel.productList[indexPath.row].totalStock
    selecteddate = productsListViewModel.productList[indexPath.row].date
    

      performSegue(withIdentifier: "toDetailsVC", sender: nil)

  }


  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 100
  }


}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

}
