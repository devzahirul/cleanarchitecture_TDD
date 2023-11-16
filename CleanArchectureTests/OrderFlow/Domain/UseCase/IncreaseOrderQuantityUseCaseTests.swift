//
//  IncreaseOrderQuantityUseCaseTests.swift
//  CleanArchectureTests
//
//  Created by Hologram1 on 11/15/23.
//

import XCTest
@testable import CleanArchecture

final class IncreaseOrderQuantityUseCaseTests: XCTestCase {
   func test_increaseOrderQuantity_when_has_one_order() async {
      let mockDataSource = MockOrderFlowDataSource()
      let repo = OrderFlowRepository(dataSource: mockDataSource)
      let inCreaseuseCase = IncreaseOrderQuantityUseCase(repo: repo)
      
       let addUseCase = AddOrderItemUseCase(repo: repo)
       _ = await addUseCase.execute(requestModel: OrderItem.testingOrderItem)
       _ = await addUseCase.execute(requestModel: OrderItem.testingOrderItem)
       
       
       XCTAssertEqual(mockDataSource.getOrderItems().first?.quantity, 1)
       _ = await inCreaseuseCase.execute(requestModel: OrderItem.testingOrderItem)
       XCTAssertEqual(mockDataSource.getOrderItems().first?.quantity, 2)
      
   }
}
