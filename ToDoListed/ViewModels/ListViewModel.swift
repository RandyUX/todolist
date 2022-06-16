//
//  ListViewModel.swift
//  ToDoListed
//
//  Created by Randy on 16/06/22.
//

import Foundation

/*
 CRUD func
 */

/*
 userdefault is only can save user id or name small pieces of data not a big data
 */



class ListViewModel: ObservableObject {
    //why use @Published because it cannot using state in regular class
    @Published var items: [itemModel] = [] {
        //setiap kali ada perubahan dalam array items maka func didSet akan di panggil
        didSet {
            saveItems()
        }
    }
    let itemskey: String = "items_list"
    
    //call init func
    init(){
        getItems()
    }
    
    // so in this class ListViewModel create func getItems, then getItems create 3 itemModel, and then init the func, then append to items array
    
    func getItems() {
    //        let newItems = [
    //            itemModel(title: "Test1", isCompleted: false),
    //            itemModel(title: "test2", isCompleted: true),
    //            itemModel(title: "test3", isCompleted: false)
    //        ]
    //        items.append(contentsOf: newItems)
        //func ini get item dari UserDefaults
        guard
            let data = UserDefaults.standard.data(forKey: itemskey),
                let saveitem = try? JSONDecoder().decode([itemModel].self, from: data)
        else {return}
        self.items = saveitem
        
    }
    
    //this func copy from ListView Model and items is automatically referencing to items that created
    func deleteItems(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
        
    }
    //this is for move items
    func moveItems(from: IndexSet, to : Int)
    {
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title: String, subtitle: String, Desc: String) {
        let newItem = itemModel(title: title, subtitle: subtitle, Desc: Desc, isCompleted: false)
        items.append(newItem)
    }
    //this is for make sure that the animation toggle for checklist done the item from to do list
    func updateItem(item: itemModel){
//       if let index = items.firstIndex { (existingItem) -> Bool in
//            return existingItem.id == item.id
//       } {
//           // run this code
//      }
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompletion()
        }
    }
    //code for userdefaults
    func saveItems(){
       //we should convert itemModel to the userDefaults
        if let encodeData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodeData, forKey: itemskey)
        }
    }
}
