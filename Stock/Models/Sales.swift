//
//  Sales.swift
//  Stock
//
//  Created by Yasemin YEL on 8.07.2021.
//

import Foundation

struct Sales {
  let sales : [Sale]
 
}

struct Sale {
  let customerName: String
  let collectionStatus: String
  let expiryDate: String
  let products: String
  let productName: String
  let quantity: Int
  let salePrice: Double
}
