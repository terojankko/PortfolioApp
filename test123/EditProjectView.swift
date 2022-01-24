//
//  EditProjectView.swift
//  test123
//
//  Created by Tero on 2/4/22.
//

import SwiftUI

struct EditProjectView: View {
    
    let project: Project

    @EnvironmentObject var dataController: DataController

    @State private var title: String
    @State private var detail: String
    @State private var color: String
    
    init(project: Project) {
        self.project = project

        _title = State(wrappedValue: project.projectTitle)
        _detail = State(wrappedValue: project.projectDetail)
        _color = State(wrappedValue: project.projectColor)
    }
    
    let colorColumns = [
        GridItem(.adaptive(minimum: 44))
    ]
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct EditProjectView_Previews: PreviewProvider {
    static var previews: some View {
        EditProjectView(project: Project.example)
    }
}
