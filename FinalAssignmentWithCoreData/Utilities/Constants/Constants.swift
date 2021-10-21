//
//  Constants.swift
//  FinalAssignmentWithCoreData
//
//  Created by shivam kumar on 06/10/21.
//

import Foundation

struct Constants {
    static let baseUrl = "https://store.amarendra.dev.classplus.co/v2/"
    static let get_data_link = URL(string : baseUrl + "batches/details?limit=20&offset=0&sortBy=createdAt")
    static let post_data = URL(string: baseUrl + "batches/create/")
    static let patch_data = URL(string: "https://store.amarendra.dev.classplus.co/v2/batches/")
    static let LIMIT = "batches/details?limit=20&offset="
    static let SORT = "&sortBy=createdAt"
    static let DELETE = "https://store.amarendra.dev.classplus.co/batches/"
    static let POST_KEY = "post"
    static let DELETE_KEY = "delete"
    static let PATCH_KEY = "PATCH"
    static let BATCHES = "batches/"
    static let EDIT = "/edit"
    static let OFFSET = 10
    static let DEFAULT_VALUE = 0
    static let LAST_ELEMENT = 1
    static let CORNER_RADIUS = 20
    static let EMPTY_STRING = ""
    static let RED_COLOR_VALUE = 0.0275
    static let GREEN_COLOR_VALUE = 0.6627
    static let BLUE_COLOR_VALUE = 0.9373
    static let ALPHA_VALUE = 1.0
    static let SUCCESS = "success"
    static let PAGE_NUMBER = 1
    static let LIMIT_PAGE = 20
}

struct Literals {
    static let DONE = "Done"
    static let ACTIVE = "Active"
    static let CREATE = "Create"
    static let CREATE_BATCH = "Create Batch !"
    static let CHOOSE_OPTION = "Choose Option"
    static let EDIT_EMPLOYEE = "Edit Employee"
    static let EDIT1 = "Edit"
    static let EDIT_BATCH = "Edit Batch !"
    static let DELETE_EMPLOYEE = "Delete Employee"
    static let CANCEL = "Cancel"
    static let MAKE_IT_INACTIVE = "Make it Inactive"
    static let EMPLOYEE_RECORDS = "Employee Records"
    static let K = "k"
}

struct StoryBoard {
    static let TABLE_VIEW_CELL = "TableViewCell"
    static let CELL = "cell"
    static let ADD_EMPLOYEE_VIEW_CONTROLLER = "AddEmployeeViewController"
}

struct ApiConstants {
    static let GET_HEADER = [
        "User-Agent": "Mobile - iOS",
        "Accept-Encoding": "br;q=1.0, gzip;q=0.9, deflate;q=0.8",
        "Accept-Language": "en-IN;q=1.0",
        "Content-Type": "application/json",
        "x-access-token": "eyJhbGciOiJIUzM4NCIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwib3JnSWQiOjEsInR5cGUiOjMsIm1vYmlsZSI6IjkxOTg3MTI1MTgwNSIsIm5hbWUiOiJNYXN0ZXIgVHV0b3IiLCJlbWFpbCI6InNhazIyMkBnbWFpbC5jb20iLCJpYXQiOjE2MzMwODIyODYsImV4cCI6MTYzNDgxMDI4Nn0.iyXY_jDalRsIlZJwZ1oIXpXI_dU6-lzDjmjZy9d5s2Xw7v_vkminJb3QMY8uwuxX",
        "Device-Id": "AE005D1C-1C37-49EE-B0FD-21029DAD1F1F",
        "Device-Details": "iPhone12,8 - 13.7",
        "App-Version": "1.4.23.1",
        "Api-Version": "14"
    ]
    
    static let POST_HEADER = [
        "User-Agent": "Mobile - iOS",
        "Accept-Encoding": "br;q=1.0, gzip;q=0.9, deflate;q=0.8",
        "Accept-Language": "en-IN;q=1.0",
        "Content-Type": "application/json",
        "x-access-token": "eyJhbGciOiJIUzM4NCIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwib3JnSWQiOjEsInR5cGUiOjMsIm1vYmlsZSI6IjkxOTg3MTI1MTgwNSIsIm5hbWUiOiJzdHJpbmciLCJlbWFpbCI6InVzZXJAZXhhbXBsZS5jb20iLCJpYXQiOjE2MzMwNjcwNzgsImV4cCI6MTYzNDc5NTA3OH0.HCW5apL_h1UX5P2ZGK2A0ObnSkOgfOiUtQ__xCAnJo0hf-L7Upu_wJ1UvAEecPu0",
        "Device-Id": "90829757-5960-43CB-8147-19409E282194",
        "Device-Details": "iPhone12,8 - 13.7",
        "App-Version": "1.4.23.1",
        "Api-Version": "14"
    ]
    
    static let PATCH_HEADER = [
        "User-Agent": "Mobile - iOS",
        "Accept-Encoding": "br;q=1.0, gzip;q=0.9, deflate;q=0.8",
        "Accept-Language": "en-IN;q=1.0",
        "Content-Type": "application/json",
        "x-access-token": "eyJhbGciOiJIUzM4NCIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwib3JnSWQiOjEsInR5cGUiOjMsIm1vYmlsZSI6IjkxOTg3MTI1MTgwNSIsIm5hbWUiOiJNYXN0ZXIgVHV0b3IiLCJlbWFpbCI6InNhazIyMkBnbWFpbC5jb20iLCJpYXQiOjE2MzMwODIyODYsImV4cCI6MTYzNDgxMDI4Nn0.iyXY_jDalRsIlZJwZ1oIXpXI_dU6-lzDjmjZy9d5s2Xw7v_vkminJb3QMY8uwuxX",
        "Device-Id": "AE005D1C-1C37-49EE-B0FD-21029DAD1F1F",
        "Device-Details": "iPhone12,8 - 13.7",
        "App-Version": "1.4.23.1",
        "Api-Version": "15"
    ]
    
    static let DELETE_HEADER = [
        "User-Agent": "Mobile - iOS",
        "Accept-Encoding": "br;q=1.0, gzip;q=0.9, deflate;q=0.8",
        "Accept-Language": "en-IN;q=1.0",
        "Content-Type": "application/json",
        "x-access-token": "eyJhbGciOiJIUzM4NCIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwib3JnSWQiOjEsInR5cGUiOjMsIm1vYmlsZSI6IjkxOTg3MTI1MTgwNSIsIm5hbWUiOiJNYXN0ZXIgVHV0b3IiLCJlbWFpbCI6InNhazIyMkBnbWFpbC5jb20iLCJpYXQiOjE2MzMwODIyODYsImV4cCI6MTYzNDgxMDI4Nn0.iyXY_jDalRsIlZJwZ1oIXpXI_dU6-lzDjmjZy9d5s2Xw7v_vkminJb3QMY8uwuxX",
        "Device-Id": "AE005D1C-1C37-49EE-B0FD-21029DAD1F1F",
        "Device-Details": "iPhone12,8 - 13.7",
        "App-Version": "1.4.23.1",
        "Api-Version": "15"
    ]
}

struct MockedData {
    static let GET_LOGIN_RESPONSE = OutputResponseGet(status: "success", data: [InsideResponseData(totalBatches: [ "batchCode": "hjbfyudbhv","name": "test test"], batchesCount: 1)], message:  "Successfully fetched all details")
    
    static let POST_RESPONSE = OutputResponseGet(status: "success", data: [InsideResponseData(totalBatches: [ "batchCode": "hjbfyudbhv","name": "test test"], batchesCount: 1)], message:  "Successfully Post all details")
    
    static let DELETE_RESPONSE = TestingModel(status: "success", message: "Deleted")
}
