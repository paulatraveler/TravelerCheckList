//
//  ItemSelectionViewModel.swift
//  TravelerCheckList
//
//  Created by PAULA on 26/08/2022.
//

import Foundation
import SwiftUI

class ItemSelectionViewModel: ObservableObject {
    
    @AppStorage("saved1") var itemSections: [CountriesSection] = []
    
    init(){
        if itemSections.isEmpty{
            loadData()
        }
    }
    
    func loadData()  {
        
        guard let url = Bundle.main.url(forResource: "countries", withExtension: "json")
        else {
            print("Json file not found")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let sections = try JSONDecoder().decode([CountriesSection].self, from: data)
            //UserDefaults.standard.set(sections, forKey: "saved1")
            self.itemSections = sections
        } catch {
            print("failed loading or decoding with error: ", error)
        }
    }
    
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
