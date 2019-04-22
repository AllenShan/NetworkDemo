//
//  TestAPIswift.swift
//  NetworkDemo
//
//  Created by healmax on 2019/4/22.
//  Copyright © 2019 healmax. All rights reserved.
//

import Foundation
import Moya

#if DEBUG
let serverIp = "https://dev"
#else
let serverIp = "https://pro"
#endif

enum UserAPI {
    case fetchUsers
    case updateUser(name: String)
}

extension UserAPI: TargetType {
    var baseString: String {
        return serverIp
    }
    var baseURL: URL { return URL.init(string: baseString)! }
    
    var path: String {
        switch self {
        case .fetchUsers:
            return "/fetchUsers"
        case .updateUser:
            return "/updateUser"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchUsers:
            return .get
        case .updateUser:
            return .post
        }

    }
    
    var sampleData: Data {
        return Data.init()
    }
    var parameters : [String: Any]? {
        switch self {
        case .fetchUsers:
            return nil
        case .updateUser(let name):
            return ["name": name]
        }
    }
    var task: Task {
        switch self {
        case .fetchUsers:
            return .requestPlain
        case .updateUser:
            return .requestParameters(parameters: parameters!, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        
        return nil
    }
    
    
}
