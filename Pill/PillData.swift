//
//  PillData.swift
//  Pill
//
//  Created by 김은서 on 2022/06/02.
//

import Foundation

// MARK: - PillModel
typealias PillModel = [PillModelElement]

struct PillModelElement: Codable {
    let id: ID?
    let image, activeIngredient, efficacy, uses: String?
    let precaution: String?
    let dur: [Dur]?
    let productName, appearance, shape, manufacturer: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case image
        case activeIngredient = "active_ingredient"
        case efficacy, uses, precaution
        case dur = "DUR"
        case productName = "product_name"
        case appearance, shape, manufacturer
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(ID.self, forKey: .id) ?? nil
        image = try values.decodeIfPresent(String.self, forKey: .image) ?? ""
        activeIngredient = try values.decodeIfPresent(String.self, forKey: .activeIngredient) ?? ""
        efficacy = try values.decodeIfPresent(String.self, forKey: .efficacy) ?? ""
        dur = try values.decodeIfPresent(Array.self, forKey: .dur) ?? []
        productName = try values.decodeIfPresent(String.self, forKey: .productName) ?? ""
        appearance = try values.decodeIfPresent(String.self, forKey: .appearance) ?? ""
        uses = try values.decodeIfPresent(String.self, forKey: .uses) ?? ""
        precaution = try values.decodeIfPresent(String.self, forKey: .precaution) ?? ""
        shape = try values.decodeIfPresent(String.self, forKey: .shape) ?? ""
        manufacturer = try values.decodeIfPresent(String.self, forKey: .manufacturer) ?? ""
        
        
    }
}

// MARK: - Dur
struct Dur: Codable {
    let 단일복합, duR성분성분1성분2병용성분, duR유형, 제형: String?
    let 금기및주의내용, 비고: String?

    enum CodingKeys: String, CodingKey {
        case 단일복합 = "단일/복합"
        case duR성분성분1성분2병용성분 = "DUR성분(성분1/성분2..[병용성분])"
        case duR유형 = "DUR유형"
        case 제형
        case 금기및주의내용 = "금기 및 주의내용"
        case 비고
    }
}

// MARK: - ID
struct ID: Codable {
    let oid: String?

    enum CodingKeys: String, CodingKey {
        case oid = "$oid"
    }
}
