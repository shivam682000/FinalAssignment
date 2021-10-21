//
//  ServiceApiTest.swift
//  FinalAssignmentWithCoreDataTests
//
//  Created by shivam kumar on 19/10/21.
//

import XCTest
@testable import FinalAssignmentWithCoreData
import Mocker

class ServiceApiTest: XCTestCase {
    
    let object = MockApiService()
    let url2 = Constants.DELETE + "qwsdf"
    let request3 = ["batchCode":"m1ygf","batchStartDate":"2021-10-12","batchName":"request12"]
    let url1 = Constants.baseUrl + Constants.BATCHES + "mlaef" + Constants.EDIT
    
    func test_get_operation() {
        let expectation = self.expectation(description: "get Operation")
        object.getApiData(requestUrl: Constants.get_data_link!, resultType: OutputResponseGet.self) { (result) in
            XCTAssertEqual(result.status, "success")
            XCTAssertEqual(result.message, "Successfully fetched all details")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func test_post_operation() {
        let encodedRequest3 = try! JSONEncoder().encode(request3)
        let expectation = self.expectation(description: "post Operation")
        object.postApiData(requestUrl: Constants.post_data!, requestBody: encodedRequest3, resultType: OutputResponseGet.self) {
            (result) in
            XCTAssertEqual(result.status, "success")
            XCTAssertEqual(result.message, "Successfully Post all details")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func test_delete_operation() {
        let completeurl2 = URL(string: url2 )
        let expectation = self.expectation(description: "Delete Api Testing")
        object.deleteApiData(requestUrl: completeurl2!, resultType: TestingModel.self) {
            (result) in
            XCTAssertEqual(result.status, "success")
            XCTAssertEqual(result.message, "Deleted")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
