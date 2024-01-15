//
//  noteModel.swift
//  Todo
//
//  Created by Marvis Ighedosa on 19/11/2023.
//

import Foundation

struct noteModel:Identifiable , Codable {
    var id:String = UUID().uuidString
    let title:String
    var isCompleted:Bool
//
//    init(id: String = UUID().uuidString , title: String, isCompleted: Bool) {
//        self.id = id
//        self.title = title
//        self.isCompleted = isCompleted
//    }
//
//    func updateModelId() -> noteModel {
//        return noteModel(id: id, title: title, isCompleted: !isCompleted)
//    }
    
}
