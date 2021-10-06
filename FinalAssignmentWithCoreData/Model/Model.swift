//
//  Model.swift
//  FinalAssignmentWithCoreData
//
//  Created by shivam kumar on 28/09/21.
//

import Foundation

struct ResponseModel: Decodable {
    let status, message: String
    let data: DataListModel
    
    enum CodingKeys: String, CodingKey {
        case status
        case message
        case data
    }
}

struct DataListModel: Decodable {
    let totalBatches: [BatchesListModel]
    let batchesCount, archivedBatchesCount: Int
    
    enum CodingKeys: String, CodingKey {
        case totalBatches
        case batchesCount
        case archivedBatchesCount
    }
}

struct BatchesListModel: Decodable,Equatable {
    var batchId: Int
    var name: String
    var isActive: Int
    var batchCode: String
    var createdDate : String
    
    enum CodingKeys: String, CodingKey {
        case batchId
        case name
        case isActive
        case batchCode
        case createdDate
    }
}

// Post Structure

struct NewBatch: Encodable{
    let batchCode, batchStartDate, batchName: String
}

struct DecodbaleData: Decodable {
    let status: String
    let data: DataClass
    let message: String
}

// MARK: - DataClass
struct DataClass: Codable {
    let batchName, batchCode, batchStartDate: String
    let isNew, id, coinsCreadited: Int
}

struct DecodabeleData2 : Decodable {
    let status: String
    let message: String
}

// MARK: - Datum
struct Detail: Decodable {
    let batchID: Int
    let batchCode, createdDate: String
    let name: String
    enum CodingKeys: String, CodingKey {
        case batchID = "batchId"
        case batchCode, createdDate
        
        case name
    }
}

struct Decodable2: Decodable {
    let status: String?
    let data: DataClass2?
    let message: String?
}


struct DataClass2: Decodable {
    let removedBatch: String?
}




