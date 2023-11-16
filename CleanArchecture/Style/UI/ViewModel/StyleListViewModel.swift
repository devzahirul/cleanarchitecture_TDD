//
//  StyleListViewModel.swift
//  CleanArchecture
//
//  Created by Hologram1 on 11/15/23.
//

import Combine
import SwiftDependency

class OrderFlowViewModel: ObservableObject {
    // inject usecases using @Inject propertywrapper
    @Inject<AddOrderItemUseCase> private var orderItemUseCase
    
    // published
    @Published private var addItemStatus: Bool = false
    
    func addInOrderFlow(orderItem: OrderItem) async {
       let result = await orderItemUseCase.execute(requestModel: orderItem)
       
       switch result {
         case .success(let addStatus): do {
         self.addItemStatus = addStatus
         print("Item add status: \(addStatus)")}
         case .failure(let error): do { print("Fail to add item: \(error.localizedDescription)")}
       }
    }
}
