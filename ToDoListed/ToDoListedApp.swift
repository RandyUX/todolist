//
//  ToDoListedApp.swift
//  ToDoListed
//
//  Created by Randy on 16/06/22.
//

import SwiftUI

/*MVVM Architecture
 Model - data Point
 View- UI
 ViewModel - manages Models for View
 */
@main
struct ToDoListedApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    //now have the object
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
