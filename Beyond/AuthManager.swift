//
//  AuthManager.swift
//  Beyond
//
//  Created by Raj Abishek on 20/03/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthManager {
    
    static let defaults = NSUserDefaults.standardUserDefaults()
    
    class func getToken() -> String? {
        return defaults.objectForKey("token") as? String
    }
    
    class func setToken(token: String) {
        defaults.setObject(token, forKey: "token")
    }
    
    let baseUrl = "http://begin.dev/api/v1"
    
    func loginWithEmail(email: String, password: String, callback: (errorMessage: String?, token: String?) -> Void) {
        Alamofire.request(.POST, "\(baseUrl)/login", parameters: ["email": email, "password": password]).responseJSON { response in
                switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        if let success = json["success"].bool {
                            if success {
                                if let token = json["data"]["token"].string {
                                    callback(errorMessage: nil, token: token)
                                }
                            } else {
                                for (_, errorMessage):(String, JSON) in json["errors"] {
                                    if let message = errorMessage.string {
                                        return callback(errorMessage: message, token: nil)
                                    } else {
                                        callback(errorMessage: "Please try after some time", token: nil)
                                    }
                                }
                            }
                        } else {
                            callback(errorMessage: "Please try after some time", token: nil)
                        }
                    }
                case .Failure:
                    callback(errorMessage: "Please try after some time", token: nil)
                }
        }
    }
    
    func signupWithName(name: String, email: String, password: String, confirm: String, callback: (errorMessage: String?, token: String?) -> Void) {
        
        Alamofire.request(.POST, "\(baseUrl)/register", parameters: ["name": name, "email": email, "password": password, "password_confirmation": confirm])
            .responseJSON { response in
                switch response.result {
                    case .Success:
                        if let value = response.result.value {
                            let json = JSON(value)
                            if let success = json["success"].bool {
                                if success {
                                    if let token = json["data"]["token"].string {
                                        callback(errorMessage: nil, token: token)
                                    }
                                } else {
                                    for (_, errorMessage):(String, JSON) in json["errors"] {
                                        if let message = errorMessage.string {
                                            return callback(errorMessage: message, token: nil)
                                        } else {
                                            callback(errorMessage: "Please try after some time", token: nil)
                                        }
                                    }
                                }
                            } else {
                                callback(errorMessage: "Please try after some time", token: nil)
                            }
                        }
                    case .Failure:
                        callback(errorMessage: "Please try after some time", token: nil)
                }
        }
    }
}
