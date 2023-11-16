//
//  AddOrderItemUseCaseTests.swift
//  CleanArchectureTests
//
//  Created by Hologram1 on 11/15/23.
//

import XCTest
@testable import CleanArchecture

final class AddOrderItemUseCaseTests: XCTestCase {
   func test_add_order_item_when_empty() async {
      let mockDataSource = MockOrderFlowDataSource()
      let repo = OrderFlowRepository(dataSource: mockDataSource)
      let useCase = AddOrderItemUseCase(repo: repo)
      
       await useCase.execute(requestModel: OrderItem.testingOrderItem)
       XCTAssertEqual(mockDataSource.getOrderItems().count, 1)
       await useCase.execute(requestModel: OrderItem.testingOrderItem)
       XCTAssertEqual(mockDataSource.getOrderItems().count, 1)
   }
}
