//
//  Network.swift
//  NetworkDemo
//
//  Created by healmax on 2019/4/22.
//  Copyright © 2019 healmax. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import Alamofire

fileprivate class ProviderWrapper {
    let provider: MoyaProvider<MultiTarget>
    
    init(endpointClosure: @escaping MoyaProvider<MultiTarget>.EndpointClosure = MoyaProvider<MultiTarget>.defaultEndpointMapping,
         requestClosure: @escaping MoyaProvider<MultiTarget>.RequestClosure = MoyaProvider<MultiTarget>.defaultRequestMapping,
         stubClosure: @escaping MoyaProvider<MultiTarget>.StubClosure = MoyaProvider.neverStub,
         manager: Manager = MoyaProvider<MultiTarget>.defaultAlamofireManager(),
         plugins: [PluginType] = [],
         trackInflights: Bool = false) {
        
        self.provider = MoyaProvider<MultiTarget>(endpointClosure: endpointClosure, requestClosure: requestClosure, stubClosure: stubClosure, manager: manager, plugins: plugins, trackInflights: trackInflights)
    }
    
    func request(target: MultiTarget) -> Observable<Response> {
        return provider.rx.request(target).asObservable()
    }
}

class Networking {
    
    static let shared: Networking = Networking()
    fileprivate var provider: ProviderWrapper = ProviderWrapper()
    
    func fetchToken() -> Observable<String> {
        return Observable.just("false")
    }
    
    func fetchTokenIfNeeded() -> Observable<String> {
        //check token if not expiry
        //return toke
        if (true) {
            return Observable.just("")
        }
        
        return fetchToken()
    }
    
    func request(multiTarget: MultiTarget) -> Observable<Any> {
        
        let request = provider.request(target: multiTarget).mapJSON()
        return fetchTokenIfNeeded()
            .flatMap({ (token) -> Observable<Any> in
                return request
            })
    }
    
    func request<Model: Codable>(multiTarget: MultiTarget, atKeyPath keyPath: String? = nil) -> Observable<Model> {
        
        let request = provider.request(target: multiTarget).map(Model.self, atKeyPath: keyPath)
        return fetchTokenIfNeeded()
            .flatMap({ (token) -> Observable<Model> in
                return request
            })
    }
}


