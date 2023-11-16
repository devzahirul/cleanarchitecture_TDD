//
//  StyleRemoteDataSourceTests.swift
//  CleanArchectureTests
//
//  Created by Hologram1 on 11/14/23.
//

import XCTest
@testable import CleanArchecture


struct MockStyleRemoteDataSource: StyleRemoteDataSourceProtocol {
    
    private var styleResponse: Result<StyleApiResponse, Error>
    
    init(styleResponse: Result<StyleApiResponse, Error>) {
        self.styleResponse = styleResponse
    }
    
    func fetchStyles() async -> ServerResponse<StyleApiResponse> {
        return styleResponse
    }
}

enum TestServerError: Error {
  case serverError(message: String)
  
  var localizedDescription: String {
      switch self {
      case .serverError(let message):
          return message
      }
  }
}

final class StyleRemoteDataSourceTests: XCTestCase {

    func test_fetch_styles_when_return_failed() async {
       let errorMessage = "No internet!"
       let mockDataSource = MockStyleRemoteDataSource(styleResponse:
       .failure(TestServerError.serverError(message: errorMessage)))
       
       let response = await mockDataSource.fetchStyles()
       
       switch response {
         case .failure(let serverError): do {
              XCTAssertEqual(errorMessage, serverError.localizedDescription)
         }
         default: do {}
       }
       
    }
}
