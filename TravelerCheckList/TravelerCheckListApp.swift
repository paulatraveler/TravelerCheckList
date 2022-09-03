//
//  TravelerCheckListApp.swift
//  TravelerCheckList
//
//  Created by PAULA on 23/08/2022.
//

import SwiftUI

@main
struct MyApp: App {
    @StateObject var varModel = ItemSelectionViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(varModel)
        }
    }
}

