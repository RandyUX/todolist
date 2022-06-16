//
//  ListView.swift
//  ToDoListed
//
//  Created by Randy on 16/06/22.
//

import SwiftUI

struct ListView: View {

    @EnvironmentObject var listViewModel: ListViewModel
//@State var items: [itemModel] = [
//        itemModel(title: "This is the first title", isCompleted: false),
//        itemModel(title: "Second", isCompleted: true),
//        itemModel(title: "third", isCompleted: false)
//    ]
    var body: some View {
        //here start building list
        //Text("Hi")
        List {
            //we need access the listViewModel and the items inside of it
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                //toggle for completed checked
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItems)
            .onMove(perform: listViewModel.moveItems)
        }
        //this is how to add button +
        //plain list style how to make it better list to left side
        .listStyle(PlainListStyle())
        .navigationTitle("To Do List")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("+", destination: AddView())
            //after destination were add new file is AddView to the next slide after click button + 
            )
    }
    //this is for delete Items
//    func deleteItems(indexSet: IndexSet) {
//        items.remove(atOffsets: indexSet)
//    }
//    //this is for move items
//    func moveItems(from: IndexSet, to : Int)
//    {
//        items.move(fromOffsets: from, toOffset: to)
//    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        //make sure in navigation
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}


