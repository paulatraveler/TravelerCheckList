//
//  Total.swift
//  TravelerCheckList
//
//  Created by PAULA on 25/08/2022.
//

import SwiftUI

struct Total: View {
    
    @EnvironmentObject var viewModel: ItemSelectionViewModel
    
    var body: some View {
        VStack(alignment: .center){
            Text("Number of checked items: \(viewModel.getSelectedItemsCount())")
                .padding()
        }
    }
}

//struct Total_Previews: PreviewProvider {
//    static var previews: some View {
//        Total(count: .constant(0))
//    }
//}
