//
//  ItemSectionDetailedView.swift
//  TravelerCheckList
//
//  Created by PAULA on 24/08/2022.
//

import SwiftUI

struct ItemSectionDetailedView: View {
    
    @Binding var items: [Country]
    
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

struct CheckToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Label {
                configuration.label
            } icon: {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .foregroundColor(configuration.isOn ? .accentColor : .secondary)
                    .accessibility(label: Text(configuration.isOn ? "Checked" : "Unchecked"))
                    .imageScale(.large)
            }
        }.buttonStyle(PlainButtonStyle())
    }
}
