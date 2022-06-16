//
//  ListRowView.swift
//  ToDoListed
//
//  Created by Randy on 16/06/22.
//

import SwiftUI

struct ListRowView: View {
    
    let item: itemModel
    
    
    var body: some View {
        HStack {
            //Image(systemName: item.isCompleted //? "checkmark.circle" : "circle")
                //.foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
            Text(item.subtitle)
            Spacer()
            Text(item.Desc)
            Spacer()//to push everything to the left
        }
        .font(.title2)
        //.padding(.vertical, 8)
//        HStack {
//            //Image(systemName: item.isCompleted //? "checkmark.circle" : "circle")
//                //.foregroundColor(item.isCompleted ? .green : .red)
//           
//            
//            
//            //Spacer()//to push everything to the left
//        }
//        .font(.title2)
//        //.padding(.vertical, 8)
//        HStack {
//            //Image(systemName: item.isCompleted //? "checkmark.circle" : "circle")
//                //.foregroundColor(item.isCompleted ? .green : .red)
//           
//           
//            
//            //Spacer()//to push everything to the left
//        }
        .font(.title2)
        //.padding(.vertical, 8)
    }
}
struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = itemModel(title: "first!", subtitle: "two", Desc: "third", isCompleted: false)
    static var item2 = itemModel(title: "Second", subtitle:"two2", Desc:"third3",isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
            
        }
        .previewLayout(.sizeThatFits)
    }
}
