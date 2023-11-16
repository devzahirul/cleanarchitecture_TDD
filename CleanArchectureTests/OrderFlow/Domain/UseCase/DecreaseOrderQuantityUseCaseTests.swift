//
//  DecreaseOrderQuantityUseCaseTests.swift
//  CleanArchectureTests
//
//  Created by Hologram1 on 11/15/23.
//

import XCTest
@testable import CleanArchecture

final class DecreaseOrderQuantityUseCaseTests: XCTestCase {
   func test_add_order_item_when_empty() async {
      let mockDataSource = MockOrderFlowDataSource()
      let repo = OrderFlowRepository(dataSource: mockDataSource)
      let decreaseUseCase = DecreaseOrderQuantityUseCase(repo: repo)
      let increaseUseCase = IncreaseOrderQuantityUseCase(repo: repo)
      
    let addUseCase = AddOrderItemUseCase(repo: repo)
    await _ = addUseCase.execute(requestModel: OrderItem.testingOrderItem)
    
    await _ = increaseUseCase.execute(requestModel: OrderItem.testingOrderItem)
    await _ = increaseUseCase.execute(requestModel: OrderItem.testingOrderItem)
    await _ = increaseUseCase.execute(requestModel: OrderItem.testingOrderItem)
    await _ = increaseUseCase.execute(requestModel: OrderItem.testingOrderItem)
    await _ = increaseUseCase.execute(requestModel: OrderItem.testingOrderItem)
       
    XCTAssertNotNil(repo.getOrderItem(for: OrderItem.testingOrderItem.style.id))
   
    
    _ = await decreaseUseCase.execute(requestModel: OrderItem.testingOrderItem)
    _ = await decreaseUseCase.execute(requestModel: OrderItem.testingOrderItem)
    _ = await decreaseUseCase.execute(requestModel: OrderItem.testingOrderItem)
    _ = await decreaseUseCase.execute(requestModel: OrderItem.testingOrderItem)
    _ = await decreaseUseCase.execute(requestModel: OrderItem.testingOrderItem)
    _ = await decreaseUseCase.execute(requestModel: OrderItem.testingOrderItem)
    _ = await decreaseUseCase.execute(requestModel: OrderItem.testingOrderItem)
    _ = await decreaseUseCase.execute(requestModel: OrderItem.testingOrderItem)
    _ = await decreaseUseCase.execute(requestModel: OrderItem.testingOrderItem)
     XCTAssertNil(repo.getOrderItem(for: OrderItem.testingOrderItem.style.id))
      // XCTAssertEqual(mockDataSource.getOrderItems().first?.quantity, 4)
    _ = await decreaseUseCase.execute(requestModel: OrderItem.testingOrderItem)
    //XCTAssertEqual(mockDataSource.getOrderItems().first?.quantity, 4)
    
   
   }
}
