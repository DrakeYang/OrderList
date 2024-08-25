//
//  OrderListVC.swift
//  OrderList
//
//  Created by YongMo Yang on 2024/08/25.
//

import Foundation
import UIKit


class OrderListVC: UIViewController {
    //  MARK: IBOultet
    @IBOutlet var titleView : UIView!
    @IBOutlet var listView : UITableView!
    @IBOutlet var logoutButton : UIButton!
    var orderDataList : [OrderData] = []
    
    override func viewDidLoad() {
        self.makeTitleView()
        self.view.backgroundColor = .white
        self.makeOrderData()
        self.makeListView()
        self.makeLogoutButton()
    }
    
    // 상단뷰 만들기
    func makeTitleView(){
        let titleView = UIView()
        self.titleView = titleView
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
    
//    리스트 뷰 생성
    func makeListView(){
        let listView = UITableView()
        self.listView = listView
        self.view.addSubview(listView)
        listView.snp.makeConstraints { make in
            make.top.equalTo(self.titleView.snp.bottom)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.width.equalTo(self.titleView)
        }
        listView.register(OrderListCell.self, forCellReuseIdentifier: "OrderListCell")
        listView.delegate = self
        listView.dataSource = self
    }
    
    // 주문 데이터 추가
    func makeOrderData(){
        for i in 0...19{
            let newOrder = OrderData(date: i.description, title: i.description+"일차 주문")
            self.orderDataList.append(newOrder)
        }
    }
    // 로그아웃 기능추가
    func makeLogoutButton(){
        let logoutButton = UIButton()
        self.logoutButton = logoutButton
        self.titleView.addSubview(logoutButton)
        logoutButton.snp.makeConstraints { make in
            make.top.equalTo(self.titleView).offset(5)
            make.right.equalTo(self.titleView).offset(-5)
            make.height.equalTo(40)
            make.width.equalTo(80)
        }
        logoutButton.backgroundColor = .black
        logoutButton.setTitle("로그아웃", for: .normal)
        logoutButton.addTarget(nil, action: #selector(logout), for: .touchUpInside)
    }
    // 로그아웃 기능
    @objc func logout(){
        self.dismiss(animated: true)
        // 보통 여기서 로그인 정보 삭제
    }
    
    // end of VC
}


class OrderListCell: UITableViewCell {
    let dateLabel = UILabel()
    let titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.top.left.height.equalTo(self)
            make.width.equalTo(80)
        }
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.right.height.equalTo(self)
            make.left.equalTo(dateLabel.snp.right)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OrderListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
            tableView.dequeueReusableCell(withIdentifier: "OrderListCell", for: indexPath) as! OrderListCell
                
        let currentOrderData = self.orderDataList[indexPath.row]
        cell.dateLabel.text = currentOrderData.date
        cell.titleLabel.text = currentOrderData.title
        return cell
    }
}

struct OrderData {
    var date : String
    var title : String
}
