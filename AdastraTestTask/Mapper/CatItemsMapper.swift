//
//  CatItemsMapper.swift
//  AdastraTestTask
//
//  Created by Aleksandr on 19.09.2022.
//

import Foundation

final class CatItemsMapper {
    static func map(_ data: Data) -> [Cat] {
        guard let root = try? JSONDecoder().decode([Cat].self, from: data) else {
            return []
        }
        
        return root
    }
}
