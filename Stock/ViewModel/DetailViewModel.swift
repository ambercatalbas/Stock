//
//  DetailViewModel.swift
//  StockTarcking
//
//  Created by Yasemin YEL on 5.07.2021.
//

import Foundation


struct ProductsListViewModel {
  var productList: [Product]
  
  
  func countProducts() -> Int {
    return self.productList.count
    
  }
  
  func productAtIndex(_ index: Int) -> ProductsViewModel {
    let product = self.productList[index]
    return ProductsViewModel(product)
  }
}



struct ProductsViewModel {
  let product: Product
  
  init(_ product: Product) {
    self.product = product
  }
  
  
  var productName: String {
    return self.product.productName
  }
  var purchaseNumber: String {
    return self.product.purchaseNumber
  }
  var purchasePrice:  String {
    return self.product.purchasePrice
  }
  var salePrice: String {
    return self.product.salePrice
  }
  var initialStockQuantity: String {
    return self.product.initialStockQuantity
  }
  var date: String {
    return self.product.date
  }
  
}


struct DetailsListViewModel {
  var productList: [Product]
  
  
  func countProducts() -> Int {
    return self.productList.count
    
  }
  
  func productAtIndex(_ index: Int) -> DetailsViewModel {
    let product = self.productList[index]
    return DetailsViewModel(product)
  }
}



struct DetailsViewModel {
  let product: Product
  
  init(_ product: Product) {
    self.product = product
  }
  
  
  var productName: String {
    return self.product.productName
  }
  var purchaseNumber: String {
    return self.product.purchaseNumber
  }
  var purchasePrice:  String {
    return self.product.purchasePrice
  }
  var salePrice: String {
    return self.product.salePrice
  }
  var initialStockQuantity: String {
    return self.product.initialStockQuantity
  }
  var date: String {
    return self.product.date
  }
  
}



