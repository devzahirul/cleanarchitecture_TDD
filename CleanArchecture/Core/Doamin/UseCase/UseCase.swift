//
//  UseCase.swift
//  CleanArchecture
//
//  Created by Hologram1 on 11/14/23.
//

import Foundation

typealias Response<T> = Result<T, AppError>

protocol UseCaseProtocol {
  associatedtype ResponseModel
  associatedtype RequestModel
  func execute(requestModel: RequestModel) async -> Response<ResponseModel>
}

class UseCase<ResponseModel, RequestModel>: UseCaseProtocol {
    func execute(requestModel: RequestModel) async -> Response<ResponseModel> {
        .failure(.notImplemented)
    }
}
