//
//  ItemSelectionViewModel.swift
//  TravelerCheckList
//
//  Created by PAULA on 26/08/2022.
//

import Foundation


class ItemSelectionViewModel: ObservableObject {
//    @Published var countriesSection = CountriesSection()
//    @Published var country = Country()
 
    //@Published private var items: [Country] = []
    @Published var items = [Country]()
    //@Published var countriesSection = [CountriesSection]()
    
//    var name: String = ""
//    
//    @Published var size: String = "Medium"
//    @Published var coffeName: String = ""

    //@Published var countriesSection = [ItemViewModel]()
    
    //    @AppStorage("itemSections") var itemSections: [CountriesSection] = Bundle.main.decode([CountriesSection].self, from: "countries.json")
    //
    
    private func readFile() {
      if let url = Bundle.main.url(forResource: "countries", withExtension: "json"),
         let data = try? Data(contentsOf: url) {
        let decoder = JSONDecoder()
        if let jsonData = try? decoder.decode(CountriesSection.self, from: data) {
            self.items = jsonData.items
        }
      }
    }
  
    
    init(){
        readFile()
    }
    


}

class ItemViewModel: ObservableObject {
    
    var countryS: [CountriesSection] = []
    

//    init(countryS: CountriesSection) {
//        self.countryS = countryS
//    }
    var name: String {
        return self.name
    }
    
    var isOn: Bool {
        return self.isOn
    }
    
    func getSelectedItemsCount() -> Int{
        var i: Int = 0
        for itemSection in countryS {
            let filteredItems = itemSection.items.filter { item in
                return item.isOn
            }
            i = i + filteredItems.count
        }
        return i
    }
    
}
