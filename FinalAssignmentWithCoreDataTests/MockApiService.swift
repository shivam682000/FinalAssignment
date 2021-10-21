//
//  MockApiService.swift
//  FinalAssignmentWithCoreDataTests
//
//  Created by shivam kumar on 21/10/21.
//

import Foundation
@testable import FinalAssignmentWithCoreData

class MockApiService {
    var getLoginResponse = MockedData.GET_LOGIN_RESPONSE
    var postResponse = MockedData.POST_RESPONSE
    var deleteResponse = MockedData.DELETE_RESPONSE
}

extension MockApiService : ApiServiceProtocol {
    
    func deleteApiData<T>(requestUrl: URL, resultType: T.Type, completionHandler: @escaping (T) -> Void) where T : Decodable {
        _ = completionHandler(self.deleteResponse as! T)
    }
    
    func postApiData<T>(requestUrl: URL, requestBody: Data, resultType: T.Type, completionHandler: @escaping (T) -> Void) where T : Decodable {
        _ = completionHandler(self.postResponse as! T)
    }
    
    func getApiData<T>(requestUrl: URL, resultType: T.Type, completionHandler: @escaping (T) -> Void) where T : Decodable {
        _ = completionHandler(self.getLoginResponse as! T)
    }
}
