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
  let invoiceDescription: String
  let customerName: String
  let collectionStatus: Bool
  let invoiceDate: String
  let expiryDate: String
  let products: [SaleProduct]
  let totalPrice: Double
}
struct SaleProduct {
  let productName: String
  let quantity: Int
  let salePrice: Double
}
