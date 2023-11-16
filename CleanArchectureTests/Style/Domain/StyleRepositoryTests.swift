//
//  StyleRepositoryTests.swift
//  CleanArchectureTests
//
//  Created by Hologram1 on 11/14/23.
//
import XCTest
@testable import CleanArchecture

final class StyleRepositoryTests: XCTestCase {
    
    func test_style_repository_when_return_empty() async -> Void {
        //when
        let mockDataSource = MockStyleRemoteDataSource(styleResponse: .success(StyleApiResponse(data: [])))
        let repo = StyleRepository(remoteDataSource: mockDataSource)
        
        let result = await repo.getStylesFromServer()
        
        //then
        switch result {
        case .success(let styles): XCTAssertEqual(styles.count, 0)
        case .failure(let appError): XCTAssertNil(appError)
        }
    }
    
    func test_style_repository_when_return_one() async -> Void {
        let mockDataSource = MockStyleRemoteDataSource(styleResponse: .success(StyleApiResponse(data: [StyleModel.mockStyle])))
        let repo = StyleRepository(remoteDataSource: mockDataSource)
        
        let result = await repo.getStylesFromServer()
        switch result {
        case .success(let styles): XCTAssertEqual(styles.count, 1)
        case .failure(let appError): XCTAssertNil(appError)
        }
    }
    
    func test_style_repository_when_return_failure() async -> Void {
       let errorMessage = "no internet connection!"
       
        let mockDataSource = MockStyleRemoteDataSource(styleResponse: .failure(TestServerError.serverError(message: errorMessage)))
        
        let repo = StyleRepository(remoteDataSource: mockDataSource)
        
        let result = await repo.getStylesFromServer()
        
         switch result {
           case .failure(let appError):
             switch appError {
             case .notImplemented:
                 do{}
             case .error(let message):
                 XCTAssertEqual(message, errorMessage)
             }
           default: do{}
         }
    }
}


