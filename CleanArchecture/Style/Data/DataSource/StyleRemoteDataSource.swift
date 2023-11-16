//
//  StyleRemoteDataSource.swift
//  CleanArchecture
//
//  Created by Hologram1 on 11/14/23.
//

import Foundation



typealias ServerResponse<T> = Result<T, Error>


protocol StyleRemoteDataSourceProtocol {
  func fetchStyles() async -> ServerResponse<StyleApiResponse>
}


class StyleRemoteDataSource: StyleRemoteDataSourceProtocol {
    private var service: ApiServiceProtocol
    
    init(service: ApiServiceProtocol) {
      self.service = service
    }
    
    func fetchStyles() async -> ServerResponse<StyleApiResponse> {
         //service.execute(request: URLRequest.ini)
        return .failure(AppError.notImplemented)
    }
}


protocol ApiServiceProtocol {
  func execute(request: URLRequest) async throws -> Data
}


struct ApiService: ApiServiceProtocol {
    private var urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func execute(request: URLRequest) async throws -> Data {
       try await urlSession.data(for: request).0
      
    }
}
