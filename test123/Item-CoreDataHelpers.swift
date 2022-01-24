//
//  Item-CoreDataHelpers.swift
//  test123
//
//  Created by Tero on 1/25/22.
//

import Foundation

extension Item {
    var itemTitle: String {
        title ?? ""
    }
    
    var itemDetail: String {
        detail ?? ""
    }
    
    var itemCreationDate: Date {
        creationDate ?? Date()
    }
    
    static var example: Item {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext
        let item = Item(context: viewContext)
        item.title = "exmaple item"
        item.detail = "Item detail here"
        item.creationDate = Date()
        
        return item
    }
}
