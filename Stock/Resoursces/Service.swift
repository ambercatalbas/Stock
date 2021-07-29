//
//  Service.swift
//  Stock
//
//  Created by Amber ÇATALBAŞ on 5.07.2021.
//

import Foundation
import Firebase
import FirebaseFirestore

class FirebaseService {
  
  let firestoreDatabase = Firestore.firestore()
  
  func didTapSave(filePath: String, productModel: [String: Any]) {
    
    
    //Database

    var firestoreReference : DocumentReference? = nil
    
    firestoreReference = firestoreDatabase.collection(filePath).addDocument(data: productModel, completion: { (error) in
      
      if error != nil {
        
        print(error?.localizedDescription ?? "Error")
      } else {
        print("succes save")
      }
    })
  }
  



}
