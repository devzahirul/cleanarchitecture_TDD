//
//  CreateOrderUseCase.swift
//  CleanArchecture
//
//  Created by Hologram1 on 11/15/23.
//

import Foundation

class CreateOrderUseCase: UseCase<Bool, OrderModel> {
    override func execute(requestModel: OrderModel) async -> Response<Bool> {
        .failure(.notImplemented)
    }
}
