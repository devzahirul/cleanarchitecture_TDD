//
//  GetStylesFromServer.swift
//  CleanArchecture
//
//  Created by Hologram1 on 11/14/23.
//

import Foundation


class GetStylesFromServerUseCase: UseCase<[Style], Void> {
    private var repo: StyleRepositoryProtocol
    
    init(repo: StyleRepositoryProtocol) {
        self.repo = repo
    }
    
    override func execute(requestModel: Void) async -> Response<[Style]> {
        let result = await self.repo.getStylesFromServer()
        return result
    }
}


