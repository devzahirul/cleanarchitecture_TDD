//
//  Style.swift
//  CleanArchecture
//
//  Created by Hologram1 on 11/14/23.
//

import Foundation

struct Style: Identifiable {
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

extension Style {
  static func mapFrom(_ styleModel: StyleModel) -> Style {
    return Style(id: styleModel.id,
      style_no: styleModel.style_no,
      price: styleModel.price,
      orig_price: styleModel.orig_price,
      pack_id: styleModel.pack_id,
      image: styleModel.image,
      pack_name: styleModel.pack_name,
      pack_ratio: styleModel.pack_ratio,
      sales_ratio_total: styleModel.sales_ratio_total,
      color_id: styleModel.color_id,
      item_id: styleModel.item_id,
      color_name: styleModel.color_name,
      pre_order: styleModel.pre_order)
  }
  
  static func mapTo(_ styleModel: Style) -> StyleModel {
    return StyleModel(id: styleModel.id,
      style_no: styleModel.style_no,
      price: styleModel.price,
      orig_price: styleModel.orig_price,
      pack_id: styleModel.pack_id,
      image: styleModel.image,
      pack_name: styleModel.pack_name,
      pack_ratio: styleModel.pack_ratio,
      sales_ratio_total: styleModel.sales_ratio_total,
      color_id: styleModel.color_id,
      item_id: styleModel.item_id,
      color_name: styleModel.color_name,
      pre_order: styleModel.pre_order)
  }
}
