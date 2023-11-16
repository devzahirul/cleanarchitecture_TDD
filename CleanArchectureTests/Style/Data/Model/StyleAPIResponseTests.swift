//
//  StyleAPIResponseTests.swift
//  CleanArchectureTests
//
//  Created by Hologram1 on 11/14/23.
//

import XCTest
@testable import CleanArchecture



extension StyleModel {
 static let mockStyle = StyleModel(id: 0, style_no: "", price: "", orig_price: nil, pack_id: 1, image: nil, pack_name: nil, pack_ratio: nil, sales_ratio_total: nil, color_id: nil, item_id: 0, color_name: "", pre_order: nil)
}

final class StyleAPIResponseTests: XCTestCase {

    func test_empty_model_create() throws {
        let data = try JSONEncoder().encode(StyleModel.mockStyle)
        let styleModel = try JSONDecoder().decode(StyleModel.self, from: data)
    
      XCTAssertNotNil(styleModel)
    }
}
