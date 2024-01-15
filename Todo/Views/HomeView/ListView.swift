//
//  ListView.swift
//  Todo
//
//  Created by Marvis Ighedosa on 20/11/2023.
//

import SwiftUI


struct ListView: View {
    @EnvironmentObject var noteViewModel:NoteViewModel
    
    var body: some View {
        List {
            ForEach(noteViewModel.note) { x in
                HStack(spacing:24){
                    Button {
                        withAnimation (.linear){
                            noteViewModel.updateItem(item: x)
                        }
                    } label: {
                        Image( systemName: x.isCompleted ? "checkmark.circle" : "circle")
                            .foregroundColor(x.isCompleted ? .green : .gray)
                    }
                    Text(x.title)
                    Spacer()
                }
            }
            .onMove(perform: noteViewModel.moveItem)
            .onDelete(perform: noteViewModel.deleteItem)
            
            .listRowBackground(
                Capsule()
                    .fill(.white)
                    .padding(.vertical, 4)
            )
            .padding(16)
            .listRowSeparator(.hidden)
        }
        .scrollIndicators(.hidden)
        .padding(.horizontal, 16)
        .listStyle(PlainListStyle())
        
        
    }
}
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
