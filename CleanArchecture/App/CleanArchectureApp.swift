//
//  CleanArchectureApp.swift
//  CleanArchecture
//
//  Created by Hologram1 on 11/14/23.
//

import SwiftUI
import SwiftDependency


@main
struct CleanArchectureApp: App {
    
    init() {
      let orderFlowDataSource = OrderFlowDataSource()
      let orderRepo = OrderFlowRepository(dataSource: orderFlowDataSource)
      let addOrderItemUseCase = AddOrderItemUseCase(repo: orderRepo)
      DI.add(addOrderItemUseCase)
      
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
