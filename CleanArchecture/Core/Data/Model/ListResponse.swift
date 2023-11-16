//
//  ListResponse.swift
//  CleanArchecture
//
//  Created by Hologram1 on 11/14/23.
//

import Foundation

struct ListResponse<D: Codable>: Codable {
  let data: [D]
}
