//
//  ThronesModel.swift
//  10Lesson_HW
//
//  Created by Reek i on 17.07.2022.
//

import UIKit

struct GamesOfThrones: Codable {
    let fullName: String?
    let title: String?
    let family: String?
    let imageUrl: String?
    
    init(throneData: [String: Any]) {
        fullName = throneData["fullName"] as? String
        title = throneData["title"] as? String
        family = throneData["family"] as? String
        imageUrl = throneData["imageUrl"] as? String
    }
    
    static func getThrones(from value: Any) -> [GamesOfThrones] {
        guard let thronesData = value as? [[String: Any]] else { return []}
        
//        var thrones: [GamesOfThrones] = []
//
//        for throneData in thronesData {
//            let throne = GamesOfThrones(throneData: throneData)
//            thrones.append(throne)
//        }
//        return thrones
        
        return thronesData.compactMap { GamesOfThrones(throneData: $0) }
    }
}
