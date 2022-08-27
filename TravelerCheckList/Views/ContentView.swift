//
//  ContentView.swift
//  TravelerCheckList
//
//  Created by PAULA on 23/08/2022.
//

import SwiftUI


import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack() {
            Text("Count countries you've already visited").foregroundColor(Color.blue).font(.largeTitle).multilineTextAlignment(.center).padding()
            CheckItemView()
          
          
            Total().multilineTextAlignment(.center)
            Spacer()
            Button("Clear seclections"){
                UserDefaults.standard.resetUser()
            }
        }
    }
}
extension UserDefaults {
    func resetUser(){
        UserKeys.allCases.forEach{
            removeObject(forKey: $0.rawValue)
        }
    }
}
enum UserKeys: String, CaseIterable{
    case items = "itemSections"
}
// TODO: add view for packlist
// TODO: add view for plan to visit


