//
//  SelectStylesForOrderUseCase.swift
//  CleanArchecture
//
//  Created by Hologram1 on 11/15/23.
//

import Foundation

class AddOrderItemUseCase: UseCase<Bool, OrderItem> {
    private var repo: OrderFlowRepositoryProtocol
    
    init(repo: OrderFlowRepositoryProtocol) {
      self.repo = repo
    }
    override func execute(requestModel: OrderItem) async -> Response<Bool> {
         guard let _ = repo.getOrderItem(for: requestModel.style.id) else {
          repo.add(orderItem: requestModel)
          return .success(true)
         }
        return .failure(.notImplemented)
    }
}



class OrderFlowDataSource: OrderFlowDataSourceProtocol {
    func add(orderItem: OrderItem) {
        
    }
    
    func remove(orderItem: OrderItem) {
        
    }
    
    func update(orderItem: OrderItem) {
        
    }
    
    func getOrderItem(for styleId: Int) -> OrderItem? {
        nil
    }
    
    func getOrderItems() -> [OrderItem] {
        []
    }
    
    func addCustomerInfo() {
        
    }
    
    func addPaymentInfo() {
        
    }
    

}


