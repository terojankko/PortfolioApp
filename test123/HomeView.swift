//
//  HomeView.swift
//  test123
//
//  Created by Tero on 1/22/22.
//

import SwiftUI

struct HomeView: View {
    
    static let tag: String? = "Home"
    
    @EnvironmentObject var dataController: DataController
    var body: some View {
        NavigationView {
            VStack {
                Button("Add Data") {
                    try? dataController.createSampleData()
                }
            }
        }
        .navigationTitle("Home")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
