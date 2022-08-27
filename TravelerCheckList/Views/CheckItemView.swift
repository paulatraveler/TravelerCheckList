//
//  CheckItemView.swift
//  TravelerCheckList
//
//  Created by PAULA on 24/08/2022.
//

import SwiftUI

struct CheckItemView: View {

    @AppStorage("itemSections") var itemSections: [CountriesSection] = Bundle.main.decode([CountriesSection].self, from: "countries.json")

    var body: some View {
        NavigationView{
            VStack() {
                List(){
                    ForEach(itemSections.indices, id: \.self){ id in
                        NavigationLink(destination: ItemSectionDetailedView(
                            items: $itemSections[id].items)) {
                                
                                Text(itemSections[id].name)
                                
                            }
                            .padding()
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}


extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }
    
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

//struct CheckItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckItemView()
//    }
//}
