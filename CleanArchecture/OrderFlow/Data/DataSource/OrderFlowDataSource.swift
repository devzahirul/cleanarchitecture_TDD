//
//  OrderFlowDataSource.swift
//  CleanArchecture
//
//  Created by Hologram1 on 11/15/23.
//

import Foundation

protocol OrderFlowDataSourceProtocol{
  func add(orderItem: OrderItem)
  func remove(orderItem: OrderItem)
  func update(orderItem: OrderItem)
  func getOrderItem(for styleId: Int) -> OrderItem?
  func getOrderItems() -> [OrderItem]
  func addCustomerInfo()
  func addPaymentInfo()
}
