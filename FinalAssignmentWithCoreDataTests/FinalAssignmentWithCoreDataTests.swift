//
//  FinalAssignmentWithCoreDataTests.swift
//  FinalAssignmentWithCoreDataTests
//
//  Created by shivam kumar on 28/09/21.
//

import XCTest
@testable import FinalAssignmentWithCoreData
import Mocker

class FinalAssignmentWithCoreDataTests: XCTestCase {
    
    func test_load_VC_from_storyBoard() {
        let vc = get()
        XCTAssertNotNil(vc.view)
    }
    
    func test_iboutlet_are_connected() {
        let vc = get()
        XCTAssertNotNil(vc.tableView)
        XCTAssertNotNil(vc.searchBar)
        XCTAssertNotNil(vc.segmentControl)
        XCTAssertNotNil(vc.segmentControlActive)
    }
    
    func test_tableView_has_delegate_and_dataSourse() {
        let vc = get()
        XCTAssertNotNil(vc.tableView.dataSource)
        XCTAssertNotNil(vc.tableView.delegate)
    }
    
    func test_tableView_conforms_tableViewDataSourceProtocol() {
        let vc = get()
        XCTAssertTrue(vc.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(vc.responds(to: #selector(vc.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(vc.responds(to: #selector(vc.tableView(_:cellForRowAt:))))
    }
    
    func test_tableView_conforms_tableViewDelegate() {
        let vc = get()
        XCTAssertTrue(vc.conforms(to: UITableViewDelegate.self))
        vc.users = [BatchesListModel(batchId: 2, name: "tabel dem", isActive: 1, batchCode: "qsadfx", createdDate: "2021-10-8")]
        let cell = vc.tableView(vc.tableView, cellForRowAt: IndexPath(row: Constants.DEFAULT_VALUE, section: Constants.DEFAULT_VALUE)) as! TableViewCell
        XCTAssertNotNil(vc.tableView(vc.tableView, willDisplay: cell, forRowAt: IndexPath(row: Constants.DEFAULT_VALUE, section: Constants.DEFAULT_VALUE)))
    }
    
    func test_conform_protocol_check() {
        let vc = get()
        XCTAssertTrue(vc.conforms(to: UISearchBarDelegate.self))
    }
    
    func testTableViewCellHasReuseIdentifier() {
        let vc = get()
        vc.users = [BatchesListModel(batchId: 2, name: "tabel dem", isActive: 1, batchCode: "qsadfx", createdDate: "2021-10-8")]
        let cell = vc.tableView(vc.tableView, cellForRowAt: IndexPath(row: Constants.DEFAULT_VALUE, section: Constants.DEFAULT_VALUE)) as? TableViewCell
        let actualReuseIdentifer = cell?.reuseIdentifier
        let expectedReuseIdentifier = "cell"
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }
    
    func test_searchbarfunction() {
        let vc = get()
        vc.searchBar(vc.searchBar, textDidChange: "")
        XCTAssertNotNil(vc.searchBar(_:textDidChange:))
        XCTAssertEqual(vc.users, vc.duplicate_array)
        vc.duplicate_array = [BatchesListModel(batchId: 2, name: "aabel dem", isActive: 1, batchCode: "qsadfx", createdDate: "2021-10-8")]
        vc.searchBar(vc.searchBar, textDidChange: "a")
        XCTAssertNotNil(vc.searchBar(_:textDidChange:))
        XCTAssertNotEqual(vc.users.count, 0)
    }
    
    func test_transfer() {
        let vc = get()
        vc.transfer()
        XCTAssertNotNil(vc.transfer)
    }
    
    func test_navigate() {
        let vc = get()
        vc.navigate()
        XCTAssertNotNil(vc.navigate)
    }
    
    func test_segment() {
        let vc = get()
        vc.segmentedChange(UISegmentedControl(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 5.0)))
        XCTAssertNotNil(vc.segmentedChange(_:))
        vc.segmentedChange1(UISegmentedControl(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 5.0)))
        XCTAssertNotNil(vc.segmentedChange1(_:))
    }
    
    func test_tableViewCell() {
        let vc = get()
        XCTAssertNotNil(vc.tableViewCell(_:subscribeButtonTappedFor:))
    }
    
    // Table View cell
    
    func test_subcribebutton() {
        let vc = get()
        vc.users = [BatchesListModel(batchId: 2, name: "tabel dem", isActive: 1, batchCode: "qsadfx", createdDate: "2021-10-8")]
        let cell = vc.tableView(vc.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? TableViewCell
        cell?.subscribeButtonTapped(UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 10.0)))
        XCTAssertFalse(vc.responds(to: #selector(cell?.subscribeButtonTapped(_:))))
    }
    
    // Add View Controller
    
    func test_view1() {
        let vc = get_AddEmployee_object()
        XCTAssertNotNil(vc.view)
    }
    
    func test_dataInjectFunction() {
        let vc = get_AddEmployee_object()
        vc.dataInject(text: "")
        XCTAssertNotNil(vc.dataInject(text:))
    }
    
    func test_iboutlet_are_connected1() {
        let vc = get_AddEmployee_object()
        XCTAssertNotNil(vc.txtHeader)
        XCTAssertNotNil(vc.txtfield_BatchId)
        XCTAssertNotNil(vc.txtfield_BatchName)
        XCTAssertNotNil(vc.txtfield_BatchCode)
        XCTAssertNotNil(vc.txtfield_StartingDate)
    }
    
    func test_addTapped() {
        let vc = get_AddEmployee_object()
        vc.addTapped()
    }
    
    func test_isUpdateFunction() {
        let vc = get_AddEmployee_object()
        vc.isUpdate = true
        vc.addTapped()
        XCTAssertNotNil(vc.addTapped)
    }
    
    func test_configure() {
        let vc = get_AddEmployee_object()
        vc.configure(data: BatchesListModel(batchId: 0, name: "s", isActive: 1, batchCode: "s", createdDate: "2021-10-12"))
        XCTAssertNotNil(vc.object)
        vc.setupforEdit()
    }
}

extension FinalAssignmentWithCoreDataTests {
    func get() -> RootViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(identifier: "RootViewController") as! RootViewController
        _ = vc.view
        return vc
    }
    
    func get_AddEmployee_object() -> AddEmployeeViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(identifier: "AddEmployeeViewController") as! AddEmployeeViewController
        _ = vc.view
        return vc
    }
}
