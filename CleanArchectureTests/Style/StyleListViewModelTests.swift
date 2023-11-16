//
//  StyleListViewModelTests.swift
//  CleanArchectureTests
//
//  Created by Hologram1 on 11/15/23.
//

import XCTest
@testable import CleanArchecture

final class StyleListViewModelTests: XCTestCase {
    func test_fetch_styles() async {
       let mocKStyleRemoteDataSource = MockStyleRemoteDataSource(styleResponse: .success(StyleApiResponse(data: [StyleModel.mockStyle])))
     
     let repo = StyleRepository(remoteDataSource: mocKStyleRemoteDataSource)
     
     let getStylesUseCase = GetStylesFromServerUseCase(repo: repo)
     
     
     let styleUseCases = StyleUseCases(getStyleListUseCase: getStylesUseCase)
     let styleListViewModel = StyleListViewModel(styleUseCases: styleUseCases)
     
      await styleListViewModel.fetchStyles()
     
     XCTAssertEqual(styleListViewModel.styles.isEmpty, false)
     
    }
    
    func test_fetch_styles_when_empty() async {
     let mocKStyleRemoteDataSource = MockStyleRemoteDataSource(styleResponse: .success(StyleApiResponse(data: [])))
     
     let repo = StyleRepository(remoteDataSource: mocKStyleRemoteDataSource)
     
     let getStylesUseCase = GetStylesFromServerUseCase(repo: repo)
     
     
     let styleUseCases = StyleUseCases(getStyleListUseCase: getStylesUseCase)
     let styleListViewModel = StyleListViewModel(styleUseCases: styleUseCases)
     
     await styleListViewModel.fetchStyles()
     
     XCTAssertEqual(styleListViewModel.styles.isEmpty, true)
     
    }
    
    
    func test_property_wrapper_not_nill_useCase() async {
       let viemModelTest = ViewModelTest()
     
       
       XCTAssertNotNil(viemModelTest.addOrderUseCase)
    }
}



