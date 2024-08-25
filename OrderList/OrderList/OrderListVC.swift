//
//  OrderListVC.swift
//  OrderList
//
//  Created by YongMo Yang on 2024/08/25.
//

import Foundation
import UIKit

class OrderListVC: UIViewController {
    override func viewDidLoad() {
        self.makeTitleView()
        self.view.backgroundColor = .white
    }
    
    // 상단뷰 만들기
    func makeTitleView(){
        let titleView = UIView()
        self.view.addSubview(titleView)
        titleView.backgroundColor = .blue
        titleView.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(50)
            make.width.equalTo(self.view)
            make.top.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        let title = UILabel()
        title.text = "주문목록"
        title.font = title.font.withSize(20)
        titleView.addSubview(title)
        title.snp.makeConstraints { make in
            make.center.equalTo(titleView)
        }
    }
}
