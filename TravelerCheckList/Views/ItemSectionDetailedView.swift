//
//  ItemSectionDetailedView.swift
//  TravelerCheckList
//
//  Created by PAULA on 24/08/2022.
//

import SwiftUI

struct ItemSectionDetailedView: View {
   
    //    var function2: () -> Int
    @Binding var items: [Country]
    @AppStorage("itemSections") var itemSections: [CountriesSection] = Bundle.main.decode([CountriesSection].self, from: "countries.json")
    


    var body: some View {
        VStack{
            ScrollView() {
                ForEach(items.indices, id: \.self){ id in
                    HStack{
                        Toggle(items[id].name, isOn: $items[id].isOn).toggleStyle(CheckToggleStyle()).tint(.mint)
                            .padding()
                        Spacer()
                    }
                }
            }
            .frame(maxWidth: .infinity,alignment: .topLeading)
        }
    }
}

//struct ItemSectionDetailedView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemSectionDetailedView()
//    }
//}
struct CheckToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Label {
                configuration.label
            } icon: {
                Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(configuration.isOn ? .accentColor : .secondary)
                    .accessibility(label: Text(configuration.isOn ? "Checked" : "Unchecked"))
                    .imageScale(.large)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}
