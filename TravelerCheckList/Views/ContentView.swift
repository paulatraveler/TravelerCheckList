//
//  ContentView.swift
//  TravelerCheckList
//
//  Created by PAULA on 23/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: ItemSelectionViewModel
    
    var body: some View {
        VStack() {
            CheckItemView()
            Total().multilineTextAlignment(.center)
            Spacer()
            Button("Clear seclections"){
                viewModel.itemSections = []
                viewModel.loadData()
            }
        }
    }
}
// TODO: add view for packlist
// TODO: add view for plan to visit


