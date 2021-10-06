//
//  FinalAssignmentWithCoreDataUITests.swift
//  FinalAssignmentWithCoreDataUITests
//
//  Created by shivam kumar on 28/09/21.
//

import XCTest

class FinalAssignmentWithCoreDataUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
         XCUIApplication().launch()
        let app = XCUIApplication()
        
        
        
        
        app.navigationBars["Employee Records"].buttons["Add"].tap()
        
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.textFields["Enter Batch Id"].tap()
        
        let enterBatchCodeTextField = elementsQuery.textFields["Enter Batch Code"]
        enterBatchCodeTextField.tap()
        enterBatchCodeTextField.tap()
        
        let enterBatchStartDateTextField = elementsQuery.textFields["Enter Batch Start date"]
        enterBatchStartDateTextField.tap()
        enterBatchStartDateTextField.tap()
        
        let enterBatchNameTextField = elementsQuery.textFields["Enter Batch Name"]
        enterBatchNameTextField.tap()
        enterBatchNameTextField.tap()
        app.navigationBars["Create"].buttons["Done"].tap()
        
        
    }
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
