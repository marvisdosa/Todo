//
//  TodoApp.swift
//  Todo
//
//  Created by Marvis Ighedosa on 28/10/2023.
//

import SwiftUI

@main
struct TodoApp: App {
    @StateObject var noteViewModel = NoteViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if noteViewModel.note.isEmpty{
                    onBoarding()
                } else {ContentView()}
            }.environmentObject(noteViewModel)
            
        }
    }
}
