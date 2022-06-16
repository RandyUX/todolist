//
//  itemModel.swift
//  ToDoListed
//
//  Created by Randy on 16/06/22.
//

import Foundation

//Imutable Struct

struct itemModel: Identifiable, Codable {
    let id: String
    let title: String
    let subtitle : String
    let Desc : String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, subtitle: String, Desc: String, isCompleted: Bool){
        self.id = UUID().uuidString
        self.title = title
        self.subtitle = subtitle
        self.Desc = Desc
        self.isCompleted = isCompleted
        
    }
    func updateCompletion () -> itemModel {
        return itemModel(id: id, title: title, subtitle: subtitle, Desc: Desc, isCompleted: !isCompleted)
    }
}

//ItemModel(id: String, title: String, isCompleted: Bool)
//itemModel(title: String,isCompleted: <#T##Bool#>)
