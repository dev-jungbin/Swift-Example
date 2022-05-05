//
//  ToDoModel.swift
//  MVVM-Example
//
//  Created by madilyn on 2022/05/05.
//

import Foundation

struct EntityElement: Codable {
    var userID: Int
    var id: Int
    var title: String
    var completed: Bool

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id = "id"
        case title = "title"
        case completed = "completed"
    }
}

typealias Entity = [EntityElement]
