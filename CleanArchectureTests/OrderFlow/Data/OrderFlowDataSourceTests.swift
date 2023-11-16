//
//  OrderFlowDataSourceTests.swift
//  CleanArchectureTests
//
//  Created by Hologram1 on 11/15/23.
//

import XCTest
@testable import CleanArchecture



extension OrderItem {
    static let testingOrderItem = OrderItem(style: StyleModel.mockStyle, quantity: 1)
}


class MockOrderFlowDataSource: OrderFlowDataSourceProtocol {
    func getOrderItem(for styleId: Int) -> CleanArchecture.OrderItem? {
        self.orderItems.first(where: {$0.style.id == styleId})
    }
    
    func update(orderItem: OrderItem) {
        if let index = self.orderItems.firstIndex(where: {$0.style.id == orderItem.style.id}) {
           
           self.orderItems.remove(at: index)
           self.orderItems.insert(orderItem, at: index)
        }
    }
    
    
    func addCustomerInfo() {
        
    }
    
    func addPaymentInfo() {
        
    }
    
    func add(orderItem: CleanArchecture.OrderItem) {
      self.orderItems.append(orderItem)
    }
    
    func remove(orderItem: OrderItem) {
       self.orderItems.removeAll(where: {$0.style.id == orderItem.style.id})
    }
    
    func getOrderItems() -> [OrderItem] {
        return orderItems
    }
    
    private var orderItems = [OrderItem]()
    
}


class OrderFlowDataSourceTests: XCTestCase {
   func test_add_order_item_in_order_flow() {
       let mockOrderFlowDataSource = MockOrderFlowDataSource()
     
     mockOrderFlowDataSource.add(orderItem: OrderItem.testingOrderItem)
     XCTAssertEqual(mockOrderFlowDataSource.getOrderItems().count, 1)
     
   }
   
   
   func test_remove_orderItem_when_orderItems_array_empty() {
    let mockOrderFlowDataSource = MockOrderFlowDataSource()
     mockOrderFlowDataSource.add(orderItem: OrderItem.testingOrderItem)
     mockOrderFlowDataSource.add(orderItem: OrderItem.testingOrderItem)
     mockOrderFlowDataSource.add(orderItem: OrderItem.testingOrderItem)
    mockOrderFlowDataSource.remove(orderItem: OrderItem.testingOrderItem)
    
    XCTAssertEqual(mockOrderFlowDataSource.getOrderItems().isEmpty, true)
    
   }
   
   
   func test_update_order_item() {
   let mockOrderFlowDataSource = MockOrderFlowDataSource()
     mockOrderFlowDataSource.add(orderItem: OrderItem.testingOrderItem)
    mockOrderFlowDataSource.update(orderItem: OrderItem(style: OrderItem.testingOrderItem.style, quantity: 5))
    
    XCTAssertEqual(mockOrderFlowDataSource.getOrderItems().first?.quantity, 5)
    
   }
   
}
