//
//  StyleAPIResponse.swift
//  CleanArchecture
//
//  Created by Hologram1 on 11/14/23.
//

import Foundation


struct StyleModel: Codable {
    let id: Int
    let style_no: String
    let price: String
    let orig_price: String?
    let pack_id: Int
    let image: String?
    let pack_name: String?
    let pack_ratio: String?
    let sales_ratio_total: Int?
    let color_id: Int?
    let item_id: Int
    let color_name: String
    let pre_order: String?
}

typealias StyleApiResponse = ListResponse<StyleModel>
