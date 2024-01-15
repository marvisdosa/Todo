//
//  CreateTask.swift
//  Todo
//
//  Created by Marvis Ighedosa on 28/10/2023.
//

import SwiftUI

struct CreateTask: View {
    @EnvironmentObject var noteViewModel:NoteViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var noteHeader:String = ""
    @State var showHomeScreen = false
    @State var showAlert = false
    
    var body: some View {
            ZStack {
                Color("backgroundColor").ignoresSafeArea()
                
                VStack(spacing:24){
                    TextField("Enter Task name", text: $noteHeader)
                        .padding(24)
                        .background(.white)
                        .cornerRadius(24)
                    
                    HStack {
                        DueDateView()
                        AccountabilityView()
                    }
                    Spacer()
                    
                    
                    
                    Button {
                        if isTextAppropriate(){
                            noteViewModel.addItem(title: noteHeader)
                            //                            showHomeScreen = true
                            presentationMode.wrappedValue.dismiss()
                        }
                    } label: {
                        Text("SAVE")
                            .foregroundColor(.white)
                            .padding(24)
                            .frame(maxWidth: .infinity)
                            .background(Color("SecondaryColor"))
                            .cornerRadius(24)
                    }
                    .alert( isPresented: $showAlert){
                        Alert(title: Text("Enter Task name"), message: Text("You have to get all your task name ready") , dismissButton: .cancel())
                        
                    }
                    //                    .fullScreenCover(isPresented: $showHomeScreen) {
                    //                        ContentView()
                    //                    }
                }
                .navigationBarTitle(Text("Add new task"))
                .padding(.horizontal, 16)
                
            }
        
        
    }
    
    func isTextAppropriate() -> Bool {
        if noteHeader.isEmpty || noteHeader.count < 4 {
            showAlert.toggle()
            return false
        }
        return true
    }
    
    
}

struct CreateTask_Previews: PreviewProvider {
    static var previews: some View {
        CreateTask().environmentObject(NoteViewModel())
    }
}

struct DueDateView: View {
    @State var selectDate = Date()
    var body: some View {
        HStack{
            DatePicker( selection: $selectDate, displayedComponents: .date){}
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.black)
                .padding(16)
                .background(.white)
                .cornerRadius(24)
            Spacer()
        }

    }
}

struct AccountabilityView: View {
    var body: some View {
        Button {
            
        } label: {
            HStack{
                Image(systemName:"person.2")
                    .font(.title2)
                Text("Accountability")
            }
            .frame(maxWidth: .infinity)
            .foregroundColor(.black)
            .padding(16)
            .background(.white)
            .cornerRadius(24)
            
        }
    }
}


