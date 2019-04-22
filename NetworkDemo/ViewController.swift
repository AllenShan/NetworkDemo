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
        
        
        let fetchTarget = MultiTarget(UserAPI.fetchUsers)

        Networking.shared.request(multiTarget: fetchTarget, type: User.self)
            .subscribe(onNext: { (user) in
                
            })
            .disposed(by: disposed)
        
        let updateTarget = MultiTarget(UserAPI.updateUser(name: "Allen"))

        Networking.shared.request(multiTarget: updateTarget, type: User.self)
            .subscribe(onNext: { (user) in
                
            })
            .disposed(by: disposed)
        
    }


}

