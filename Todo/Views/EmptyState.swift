//
//  EmptyState.swift
//  Todo
//
//  Created by Marvis Ighedosa on 28/10/2023.
//

import SwiftUI

struct EmptyState: View {
    @EnvironmentObject var noteViewModel:NoteViewModel
    
    var body: some View {
            ZStack {
                Color("backgroundColor").ignoresSafeArea()
                if noteViewModel.note.isEmpty {
                    VStack {
                        EmptyStateView()
                            .navigationBarItems(
                                leading:Image("profiilePic")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 32, height: 32)
                                    .clipShape(Circle()),
                                trailing: Image(systemName: "magnifyingglass")
                                .font(.headline))
                            .navigationBarBackButtonHidden(true)

                        NavigationLink {
                            CreateTask()
                        } label: {
                            addButtonView()
                        }
                        .navigationBarBackButtonHidden(true)
                    }
                } else {
                    ContentView()
                }
               
              
            }
            
            
        
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState()
    }
}

