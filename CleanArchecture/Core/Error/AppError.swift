//
//  AppError.swift
//  CleanArchecture
//
//  Created by Hologram1 on 11/14/23.
//

import Foundation

enum AppError: Error {
   case notImplemented
   case error(message: String)
   
   public var localizedDescription: String {
       switch self {
       case .error(let message): return message
       case .notImplemented: return "notImplemented"
       }
   }
}


