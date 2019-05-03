//
//  HistoryItem.swift
//  HelloWorld
//
//  Created by iTung on 4/4/19.
//  Copyright © 2019 iTung. All rights reserved.
//

import RealmSwift

class HistoryItem: Object  {
    @objc dynamic var id = 0
    @objc dynamic var nameCustomer = ""
    @objc dynamic var phoneNumber = ""
    @objc dynamic var time = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
