//
//  OrderFlowRepositoryTests.swift
//  CleanArchectureTests
//
//  Created by Hologram1 on 11/15/23.
//

import XCTest
@testable import CleanArchecture

class OrderFlowRepositoryTests: XCTestCase {
   func test_update_orderItem() {
       let mockOrderFlowDataSource = MockOrderFlowDataSource()
     mockOrderFlowDataSource.add(orderItem: OrderItem.testingOrderItem)
     
     let repo = OrderFlowRepository(dataSource: mockOrderFlowDataSource)
     repo.update(orderItem: OrderItem(style: StyleModel.mockStyle, quantity: 6))
     XCTAssertEqual(repo.getOrderItems().first?.quantity, 6)
     
     
   }
   
   func test_getOrderItem_byStyleId() {
       let mockOrderFlowDataSource = MockOrderFlowDataSource()
     mockOrderFlowDataSource.add(orderItem: OrderItem.testingOrderItem)
     
     let repo = OrderFlowRepository(dataSource: mockOrderFlowDataSource)
     
     XCTAssertNotNil(repo.getOrderItem(for: OrderItem.testingOrderItem.style.id))
     XCTAssertEqual(repo.getOrderItem(for: OrderItem.testingOrderItem.style.id)?.style.id,StyleModel.mockStyle.id)
     
   }
   
}
