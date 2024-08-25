//
//  ViewController.swift
//  OrderList
//
//  Created by YongMo Yang on 2024/08/24.
//

import UIKit
import SnapKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.loadLoginView()        
        self.setupKeyboardObservers()
        self.setupTapGesture()
    }
    
    func loadLoginView(){
        let loginView = LoginView()
        self.view.addSubview(loginView)
        loginView.setupLayout()
        loginView.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(self.view.safeAreaLayoutGuide)
            make.center.equalTo(self.view)
        }
    }
    

}
