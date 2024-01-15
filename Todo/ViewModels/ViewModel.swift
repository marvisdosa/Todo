//
//  ViewModel.swift
//  Todo
//
//  Created by Marvis Ighedosa on 28/10/2023.
//

import Foundation

class NoteViewModel: ObservableObject {
    @Published var note:[noteModel] = [] {
        didSet {
            saveItem()
        }
    }
    var itemsKey:String = "items"
    
    init(){
       getItem()
    }
    
    func getItem(){
        guard
            let savedData = UserDefaults.standard.data(forKey: itemsKey),
            let decodedData = try? JSONDecoder().decode([noteModel].self, from: savedData) else {return}
            self.note = decodedData
    }
    
    
    func addItem(title:String){
        let header = noteModel(title: title, isCompleted: false)
        note.append(header)
    }
    
    func deleteItem(indexSet: IndexSet){
        note.remove(atOffsets: indexSet)
    }
    func moveItem(from:IndexSet, to: Int ){
        note.move(fromOffsets: from, toOffset: to)
    }
    func updateItem(item: noteModel){
        if let index = note.firstIndex(where: {$0.id == item.id }) {
            note[index].isCompleted.toggle()
        }
    }
    
    func saveItem() {
        if let encodedData = try? JSONEncoder().encode(note) {
            UserDefaults().set(encodedData, forKey: itemsKey)
        }
    }
    
    
//
//    func dowloadedEpisodes() -> [noteModel]  {
//        guard let episodeData = data(forKey: UserDefaults.dowloadEpisodeKey) else {return []}
//        do {
//            let data =  try JSONDecoder().decode([noteModel].self, from: episodeData)
//            return data
//        } catch let error {
//            print(error)
//        }
//        return []
//    }
}
