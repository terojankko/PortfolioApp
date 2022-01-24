//
//  EditItemView.swift
//  test123
//
//  Created by Tero on 1/28/22.
//

import SwiftUI

struct EditItemView: View {
    
    let item: Item
    
    @EnvironmentObject var dataController: DataController
    
    @State private var title: String
    @State private var detail: String
    @State private var priority: Int
    @State private var completed: Bool

    init(item: Item) {
        self.item = item
        _title = State(wrappedValue: item.itemTitle)
        _detail = State(wrappedValue: item.itemDetail)
        _priority = State(wrappedValue: Int(item.priority))
        _completed = State(wrappedValue: item.completed)
    }
    var body: some View {
        Form {
            Section(header: Text("Basic settings")) {
                TextField("Item name", text: $title.onChange(update))   // onChange is because of the Binding extension, it could be called only on Form, see below
                TextField("Description", text: $detail.onChange(update))
            }
            Section(header: Text("Priority")) {
                Picker("Priority", selection: $priority.onChange(update)) {
                    Text("Low").tag(1)
                    Text("medium").tag(2)
                    Text("High").tag(3)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section {
                Toggle("Mark completed", isOn: $completed.onChange(update))
            }
        }
        .navigationTitle("Edit Item")
        .onDisappear(perform: dataController.save)
        
        //.onDisappear(perform: update) // update the model with edits but this has a delay, below is the defauklt swfit ui way
        
        // .onChange(of: title) { _ in update() } // immediate update on previous screen
        // but it's replaced with Binding extension:
    }
    
    func update() {
        item.project?.objectWillChange.send() // will flow down to item as well
        item.title = title
        item.detail = detail
        item.priority = Int16(priority)
        item.completed = completed

    }
}

struct EditItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditItemView(item: Item.example)
    }
}
