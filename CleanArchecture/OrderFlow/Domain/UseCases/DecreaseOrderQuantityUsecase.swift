//
//  RemoveQuantityForStyleUsecase.swift
//  CleanArchecture
//
//  Created by Hologram1 on 11/15/23.
//

import Foundation

class DecreaseOrderQuantityUseCase: UseCase<Bool, OrderItem> {
     private var repo: OrderFlowRepositoryProtocol
    
    init(repo: OrderFlowRepositoryProtocol) {
      self.repo = repo
    }
    override func execute(requestModel: OrderItem) async -> Response<Bool> {
         guard let current = repo.getOrderItem(for: requestModel.style.id) else {
          return .failure(.error(message: "not found"))
         }
         
         if current.quantity - 1 <= 0 {
           repo.remove(orderItem: requestModel)
         } else {
           repo.update(orderItem: OrderItem(style: current.style, quantity: current.quantity - 1))
         }
         
        return .failure(.notImplemented)
    }
}
