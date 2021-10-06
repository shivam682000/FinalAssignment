//
//  ViewModel.swift
//  FinalAssignmentWithCoreData
//
//  Created by shivam kumar on 02/10/21.
//

import Foundation
import UIKit

class ApiServices : DependencyInversion {
    
    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T)-> Void)
        {   print("hello")
            var urlRequest = URLRequest(url: requestUrl)
            
           print("xyz")
       
        urlRequest.allHTTPHeaderFields = [
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
            URLSession.shared.dataTask(with: urlRequest) { (responseData, httpUrlResponse, error) in
                print("hjhbj")
                if(error == nil && responseData != nil && responseData?.count != 0)
                {
                   
                    let decoder = JSONDecoder()
                    do {
                        let result = try decoder.decode(resultType, from: responseData!)
                        _=completionHandler(result)
                    }
                    catch let error{
                        debugPrint("error occured while decoding = \(error.localizedDescription)")
                    }
                }

            }.resume()
        }
    
    func postApiData<T:Decodable>(requestUrl: URL, requestBody: Data, resultType: T.Type, completionHandler:@escaping(_ result: T)-> Void)
        {
            var urlRequest = URLRequest(url: requestUrl)
             urlRequest.allHTTPHeaderFields = [
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
            urlRequest.httpMethod = "post"
            urlRequest.httpBody = requestBody
         

            URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in

                if(data != nil && data?.count != 0)
                {
                    print("heo1")
                    let decoder = JSONDecoder()
                    do {
                        print("heo2")
                        let response = try decoder.decode(resultType, from: data!)
                        print(response,"kjhjbujkj")
                        _=completionHandler(response)
                        
                    }
                    catch let decodingError {
                        print("heo3")
                        debugPrint(decodingError)
                    }
                }
            }.resume()
        }
    
    func patchApiData<T:Decodable>(requestUrl: URL, requestBody: Data, resultType: T.Type, completionHandler:@escaping(_ result: T)-> Void)
        {
            var urlRequest = URLRequest(url: requestUrl)
        
             urlRequest.allHTTPHeaderFields = [
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
            urlRequest.httpMethod = "PATCH"
            urlRequest.httpBody = requestBody
         

            URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in

                if(data != nil && data?.count != 0)
                {
                    
                    print("heo1")
                    let decoder = JSONDecoder()
                    do {
                        print("heo2")
                        let response = try decoder.decode(resultType, from: data!)
                        print(response,"kjhjbujkj")
                        _=completionHandler(response)
                        
                    }
                    catch let decodingError {
                        print("heo3")
                        debugPrint(decodingError)
                    }
                }
            }.resume()
        }
    
    func deleteApiData<T:Decodable>(requestUrl: URL,resultType: T.Type, completionHandler:@escaping(_ result: T)-> Void)
        {
            var urlRequest = URLRequest(url: requestUrl)
        
             urlRequest.allHTTPHeaderFields = [
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
            urlRequest.httpMethod = "delete"
            
         

            URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in

                if(data != nil && data?.count != 0)
                {
                    
                    print("heo1")
                    let decoder = JSONDecoder()
                    do {
                        print("heo2")
                        let response = try decoder.decode(resultType, from: data!)
                        print(response,"kjhjbujkj")
                        
                        _=completionHandler(response)
                        
                    }
                    catch let decodingError {
                        
                        print("heo3")
                        debugPrint(decodingError)
                    }
                }
            }.resume()
        }
}



