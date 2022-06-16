//
//  AddView.swift
//  ToDoListed
//
//  Created by Randy on 16/06/22.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var text2: String = ""
    @State var Desc: String = ""
    
    @State var alertTitle: String = ""//-> this is for the title of alert
    @State var showAlert: Bool = false//-> this is for show the title of the alert
    var body: some View {
        ScrollView {
            VStack {
                TextField("Title", text: $textFieldText)
                TextField("Subtitle", text: $text2)
                TextField("Description", text: $Desc)
                
               
                   
               
        
                Button(action: saveButtonPressed, label: {
                    Text("Create".uppercased())
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame( maxWidth: 	.infinity )
                        .background(Color.accentColor)
                })
            }
            .padding(14)
        }
        .navigationTitle("Create")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    func saveButtonPressed(){
        //so if this func is equal to true
        //then this gonna run of all this logic below
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText, subtitle: text2, Desc: Desc)
            presentationMode.wrappedValue.dismiss()
        }
     //after create add func from ListViewModel class
       
        
    }
    // this is for check the textField not empty and minimum character that have to fill
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "cannot input new list"
            showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
