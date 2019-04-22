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
//    let serverIp = "https://master.handsup.dev/"
let serverIp = "https://dev"
#else
let serverIp = "https://pro"
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
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
