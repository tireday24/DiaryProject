//
//  BaseViewController.swift
//  SeSACWeek7Diary
//
//  Created by 권민서 on 2022/08/19.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configure()
        
        
    }
    
    func configure() {
        
    }
    
    //모든 뷰에서 주의 구문을 쓴다 가정하면 특정 상황 정해주어야한다
    func showAlertMessage(title: String, button: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: button, style: .cancel)
        alert.addAction(ok)
        present(alert, animated: true)
    }
    
    
}
