//
//  GetStylesFromServerTests.swift
//  CleanArchectureTests
//
//  Created by Hologram1 on 11/14/23.
//

import XCTest
@testable import CleanArchecture

final class GetStylesFromServerUseCaseTests: XCTestCase {
   func test_get_styles_from_server() async {
     let mocKStyleRemoteDataSource = MockStyleRemoteDataSource(styleResponse: .success(StyleApiResponse(data: [StyleModel.mockStyle])))
     
     let repo = StyleRepository(remoteDataSource: mocKStyleRemoteDataSource)
     
     let getStylesUseCase = GetStylesFromServerUseCase(repo: repo)
     
     let styleResponse = await getStylesUseCase.execute(requestModel: Void())
     
     XCTAssertNotNil(styleResponse)
     
   }
}
