//
//  JsonModel.swift
//  PrepZ
//
//  Created by Difa N Pratama on 22/06/21.
//

import Foundation

struct Result: Codable {
    let image: String
    let fact: String
    let concern: String
    let data: [ResultItem]
}

struct ResultItem: Codable {
    let imageName: String
    let title: String
    let subTitle: String
    let timer: String
}

var homeChosen = "beef"
