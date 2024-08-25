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
        loginView.mainVC = self
        self.view.addSubview(loginView)
        loginView.setupLayout()
        loginView.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(self.view.safeAreaLayoutGuide)
            make.center.equalTo(self.view)
        }
    }
    
    /// 키보드에 로그인 버튼이 가려지는걸 막는 기능
    func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    // 키보드 올라갈때 뷰 올리기
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardHeight = keyboardFrame.cgRectValue.height
            view.frame.origin.y = -keyboardHeight
        }
    }
    // 키보드 내려갈때 뷰 내리기
    @objc func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
    }
    // 텍스트 필드 이외 터치하면 키보드 숨기기
    func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}
