//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Domenico Montalto on 12/17/22.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
