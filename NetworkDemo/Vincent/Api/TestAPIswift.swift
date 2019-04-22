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
let serverIp = "https://pro"
#else
let serverIp = "https://dev"
#endif

enum UserAPI {
    case fetchUsers
    case updateUser
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
        case .fetchUsers,
             .updateUser:
            return .get
        }

    }
    
    var sampleData: Data {
        return Data.init()
    }
    
    var task: Task {
        
        let requestParameters = parameters ?? [:]
        let encoding: ParameterEncoding
        
        switch self {
        case .fetchUsers,
             .updateUser:
            encoding = URLEncoding.queryString
        }
        
        return .requestParameters(parameters: requestParameters, encoding: encoding)
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var parameters: [String: Any]? {
        
        return nil
    }
}
