//
//  OrderModel.swift
//  CleanArchecture
//
//  Created by Hologram1 on 11/15/23.
//

import Foundation


struct OrderModel {
  let orderItems: [OrderItem]
  let customer: Customer
  let paymentInfo: PaymentInfo
  let createAt: Int64
  let orderNote: String
}

struct PaymentInfo {
 let cardHolderName: String
 let cardNumber: String
 let cvc: String
 let expireData: String
}
