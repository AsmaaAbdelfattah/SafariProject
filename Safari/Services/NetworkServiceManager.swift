//
//  NetworkServiceManager.swift
//  Safari
//
//  Created by Asmaa_Abdelfattah on 08/07/1402 AP.
//

import Foundation
class NetworkServiceManager{
    private static var networkService : NetworkServiceManager?
    public static func getInstance()->NetworkServiceManager{
        if networkService == nil {
            networkService = NetworkServiceManager()
        }
        return networkService!
    }
    func getMainCategory(url:String, complitionHandler : @escaping (Categories? , Error?) -> Void){
        guard let apiUrl = URL(string: url) else { return}
        var request = URLRequest(url:  apiUrl)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data , error == nil else{
                complitionHandler(nil , error)
                return
            }
            do{
                let response = try? JSONDecoder().decode(Categories.self, from: data)
                complitionHandler(response!, nil)
            }
        }
        task.resume()
    }
    
    func postRegister(url:String , user: UserDataBody){
        guard let apiUrl = URL(string: url) else { return}
        var request = URLRequest(url:  apiUrl)
        request.httpMethod = "POST"
         request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: AnyHashable] = ["FullName": user.FullName,
                                           "PhoneNumber": user.PhoneNumber,
                                           "Email": user.Email,
                                           "Password": user.Password,
                                           "ConfirmPassword": user.ConfirmPassword,
                                           ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data , error == nil else{
                return
            }
            do{
                let response = try? JSONSerialization.jsonObject(with: data,options: .allowFragments)
                print("post\(response)")
            }
        }
        task.resume()
    }
}
