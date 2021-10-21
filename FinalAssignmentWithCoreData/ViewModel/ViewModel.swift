//
//  ViewModel.swift
//  FinalAssignmentWithCoreData
//
//  Created by shivam kumar on 02/10/21.
//

import Foundation
import UIKit


class ApiServices : ApiServiceProtocol {
    
    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T)-> Void)
    {
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.allHTTPHeaderFields = ApiConstants.GET_HEADER
        URLSession.shared.dataTask(with: urlRequest) { (responseData, httpUrlResponse, error) in
            if (error == nil && responseData != nil && responseData?.count != Constants.DEFAULT_VALUE)
            {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(resultType, from: responseData!)
                    _=completionHandler(result)
                } catch let error {
                    debugPrint("error occured while decoding = \(error.localizedDescription)")
                }
            }
        }.resume()
    }
    
    func postApiData<T:Decodable>(requestUrl: URL, requestBody: Data, resultType: T.Type, completionHandler:@escaping(_ result: T)-> Void)
    {
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.allHTTPHeaderFields = ApiConstants.POST_HEADER
        urlRequest.httpMethod = Constants.POST_KEY
        urlRequest.httpBody = requestBody
        URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in
            if (data != nil && data?.count != Constants.DEFAULT_VALUE)
            {
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(resultType, from: data!)
                    _=completionHandler(response)
                } catch let decodingError {
                    debugPrint(decodingError)
                }
            }
        }.resume()
    }
    
    func patchApiData<T:Decodable>(requestUrl: URL, requestBody: Data, resultType: T.Type, completionHandler:@escaping(_ result: T)-> Void)
    {
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.allHTTPHeaderFields = ApiConstants.PATCH_HEADER
        urlRequest.httpMethod = Constants.PATCH_KEY
        urlRequest.httpBody = requestBody
        URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in
            if (data != nil && data?.count != Constants.DEFAULT_VALUE)
            {
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(resultType, from: data!)
                    _=completionHandler(response)
                } catch let decodingError {
                    debugPrint(decodingError)
                }
            }
        }.resume()
    }
    
    func deleteApiData<T:Decodable>(requestUrl: URL,resultType: T.Type, completionHandler:@escaping(_ result: T)-> Void)
    {
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.allHTTPHeaderFields = ApiConstants.DELETE_HEADER
        urlRequest.httpMethod = Constants.DELETE_KEY
        URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in
            if (data != nil && data?.count != Constants.DEFAULT_VALUE)
            {
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(resultType, from: data!)
                    _=completionHandler(response)
                } catch let decodingError {
                    debugPrint(decodingError)
                }
            }
        }.resume()
    }
}



