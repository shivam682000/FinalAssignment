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
}
