//
//  Protocols.swift
//  FinalAssignmentWithCoreData
//
//  Created by shivam kumar on 21/10/21.
//

import Foundation

protocol ApiServiceProtocol {
    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T)-> Void)
    func postApiData<T:Decodable>(requestUrl: URL, requestBody: Data, resultType: T.Type, completionHandler:@escaping(_ result: T)-> Void)
    func deleteApiData<T:Decodable>(requestUrl: URL,resultType: T.Type, completionHandler:@escaping(_ result: T)-> Void)
}

protocol dataTransfer {
    func transfer()
    func tranfer2(data : NewBatch,batchcode:String)
}

protocol TableViewCellDelegate : AnyObject {
    func tableViewCell(_ tableViewCell : TableViewCell, subscribeButtonTappedFor index: BatchesListModel)
}

