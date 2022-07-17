//
//  FootballModel.swift
//  10Lesson_HW
//
//  Created by Reek i on 07.07.2022.
//

import UIKit

struct Irek: Codable {
    let abbr: String?
    let rukovod: String?
    let email: String?
    let www: String?
}

//struct FootballModel: Decodable {
//    let status: Bool?
//    let ddata: Ddata?
//
//    enum CodingKeys: String, CodingKey {
//        case status
//        case ddata = "data"
//    }
//}
//
//struct Ddata: Decodable {
//    let name: String?
//    let seasonDisplay: String?
//    let standings: [Standing]?
//}
//
//struct Standing: Decodable {
//    let team: Team?
//    let note: Note?
//}
//
//struct Team: Decodable {
//    let name: String?
//    let logos: [Logo]?
//}
//
//struct Logo: Decodable {
//    let href: String?
//}
//
//struct Note: Decodable {
//    let color: String?
//    let rank: Int?
//}


