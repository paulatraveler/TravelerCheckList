//
//  CheckItemView.swift
//  TravelerCheckList
//
//  Created by PAULA on 24/08/2022.
//

import SwiftUI

struct CheckItemView: View {
    
    @EnvironmentObject var viewModel: ItemSelectionViewModel
    
    var body: some View {
        NavigationView{
            VStack() {
                List(){
                    ForEach(viewModel.itemSections.indices, id: \.self){ id in
                        NavigationLink(destination: ItemSectionDetailedView(
                            items: $viewModel.itemSections[id].items)) {
                                Text(viewModel.itemSections[id].name)
                            }.padding()
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

//struct CheckItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckItemView()
//    }
//}
