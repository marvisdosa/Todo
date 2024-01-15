//
//  ContentView.swift
//  Todo
//
//  Created by Marvis Ighedosa on 28/10/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var noteViewModel:NoteViewModel
    
    var body: some View {
        if noteViewModel.note.isEmpty {
            VStack {
                EmptyStateView()
                NavigationLink {
                    CreateTask()
                } label: {
                    addButtonView()
                }
                .navigationBarBackButtonHidden(true)
            }
        } else {
            
            
            
            ZStack {
                Color("backgroundColor").ignoresSafeArea()
                ListView()
                VStack {
                    Spacer()
                    NavigationLink {
                        CreateTask()
                    } label: {
                        addButtonView()
                    }
                    
                    
                    .navigationBarItems(
                        leading:Image("profiilePic")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 32, height: 32)
                            .clipShape(Circle()),
                        trailing: Image(systemName: "magnifyingglass")
                            .font(.headline))
                    .navigationTitle("Note App")
                    .navigationBarBackButtonHidden(true)

                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(NoteViewModel())
    }
}
