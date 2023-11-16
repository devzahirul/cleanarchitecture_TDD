//
//  StyleRepository.swift
//  CleanArchecture
//
//  Created by Hologram1 on 11/14/23.
//

import Foundation

protocol StyleRepositoryProtocol {
  func getStylesFromServer() async -> Response<[Style]>
}

class StyleRepository: StyleRepositoryProtocol {
    private var remoteDataSource: StyleRemoteDataSourceProtocol
    
    init(remoteDataSource: StyleRemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getStylesFromServer() async -> Response<[Style]> {
        let styleResponse = await self.remoteDataSource.fetchStyles()
       
       switch styleResponse {
         case .success(let styleApiResponse): return .success(styleApiResponse.data.map({Style.mapFrom($0)}))
         case .failure(let error):
           return .failure(.error(message: error.localizedDescription))
       }
    }
}
