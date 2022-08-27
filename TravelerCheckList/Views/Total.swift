//
//  Total.swift
//  TravelerCheckList
//
//  Created by PAULA on 25/08/2022.
//

import SwiftUI





struct Total: View {
    @AppStorage("itemSections") var itemSections: [CountriesSection] = Bundle.main.decode([CountriesSection].self, from: "countries.json")

    func getSelectedItemsCount() -> Int{
        var i: Int = 0
        for itemSection in itemSections {
            let filteredItems = itemSection.items.filter { item in
                return item.isOn
            }
            i = i + filteredItems.count
        }
        return i
    }
    
    var body: some View {
        VStack(alignment: .center){
        Text("Number of checked items:  \(getSelectedItemsCount())")
            .padding()
        }}
}

struct Total_Previews: PreviewProvider {
    static var previews: some View {
        Total()
    }
}
