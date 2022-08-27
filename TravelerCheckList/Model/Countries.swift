//
//  Countries.swift
//  TravelerCheckList
//
//  Created by PAULA on 24/08/2022.
//

import Foundation

struct CountriesSection: Codable, Identifiable, Hashable  {
    var id: UUID = UUID()
    var name: String
    var items: [Country]
}

struct Country: Codable, Equatable, Identifiable,Hashable  {
    var id: UUID = UUID()
    var name: String
    var isOn: Bool = false
}
