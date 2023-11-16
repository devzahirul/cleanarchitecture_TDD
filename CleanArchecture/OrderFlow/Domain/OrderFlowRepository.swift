//
//  OrderFlowRepository.swift
//  CleanArchecture
//
//  Created by Hologram1 on 11/15/23.
//

import Foundation

protocol OrderFlowRepositoryProtocol {
  func add(orderItem: OrderItem)
  func remove(orderItem: OrderItem)
  func getOrderItems() -> [OrderItem]
  func update(orderItem: OrderItem)
  func getOrderItem(for styleId: Int) -> OrderItem?
  func selectCustomerInfo()
  func addPaymentInfo()
}

class OrderFlowRepository: OrderFlowRepositoryProtocol {
    func remove(orderItem: OrderItem) {
        dataSource.remove(orderItem: orderItem)
    }
    
    func getOrderItem(for styleId: Int) -> OrderItem? {
        dataSource.getOrderItem(for: styleId)
    }
    
    func add(orderItem: OrderItem) {
        dataSource.add(orderItem: orderItem)
    }
    
    func getOrderItems() -> [OrderItem] {
        dataSource.getOrderItems()
    }
    
    func update(orderItem: OrderItem) {
        dataSource.update(orderItem: orderItem)
    }
    
   
    
    func selectCustomerInfo() {
        
    }
    
    func addPaymentInfo() {
        
    }
    
    private var dataSource: OrderFlowDataSourceProtocol
    
    init(dataSource: OrderFlowDataSourceProtocol) {
      self.dataSource = dataSource
    }
    
    
    
}
