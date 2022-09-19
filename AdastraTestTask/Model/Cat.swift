//
//  Cat.swift
//  AdastraTestTask
//
//  Created by Aleksandr on 19.09.2022.
//

import Foundation

// MARK: - Cat
struct Cat: Codable {
    let status: Status?
    let id, user, text, type: String?
    let createdAt, updatedAt: String?
    let v: Int?

    enum CodingKeys: String, CodingKey {
        case status
        case id = "_id"
        case user, text, type, createdAt, updatedAt
        case v = "__v"
    }
}

// MARK: - Status
struct Status: Codable {
    let sentCount: Int?
}
