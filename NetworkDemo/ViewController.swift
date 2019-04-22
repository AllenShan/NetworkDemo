//
//  ViewController.swift
//  NetworkDemo
//
//  Created by healmax on 2019/4/22.
//  Copyright © 2019 healmax. All rights reserved.
//

import UIKit
import RxSwift
import Moya

class ViewController: UIViewController {

    var disposed = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let target = MultiTarget(UserAPI.fetchUsers)
        let fetchUser: Observable<User> = Networking.shared.request(multiTarget: target)
        fetchUser
            .subscribe(onNext: { (user) in
                
            }).disposed(by: disposed)
        
    }


}

