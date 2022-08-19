//
//  ProfileViewController.swift
//  SeSACWeek7Diary
//
//  Created by 권민서 on 2022/08/18.
//

import UIKit
import SnapKit

extension NSNotification.Name {
    static let saveButton = NSNotification.Name("saveButtonNotification")
}

class ProfileViewController: UIViewController {
    
    let saveButton: UIButton =  {
        let view = UIButton()
        view.setTitle("저장", for: .normal)
        view.backgroundColor = .black
        view.tintColor = .black
        return view
    }()
    
    let nameTextField: UITextField =  {
        let view = UITextField()
        view.placeholder = "이름을 입력하세요."
        view.backgroundColor = .brown
        view.textColor = .white
        return view
    }()
    
    //왜 옵셔널? 초기화가 잘못됐을 경우 앱이 꺼질 수 있어서
    //함수 호출 속도를 늦춤
    //매개변수 사용 가능
    var saveButtonActionHandler: ((String) -> ())? //함수 자체
    
    
    func configure() {
        [saveButton, nameTextField].forEach { view.addSubview($0) }
        
        nameTextField.snp.makeConstraints {
            $0.leading.trailing.equalTo(view).inset(50)
            $0.top.equalTo(50)
            $0.height.equalTo(50)
        }
        
        saveButton.snp.makeConstraints {
            $0.width.height.equalTo(100)
            $0.center.equalTo(view)
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        view.backgroundColor = .white
        
        saveButton.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(saveButtonNotificationObserver(notification:)), name: NSNotification.Name("TEST"), object: nil)
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("TEST"), object: nil)
    }
    
    @objc func saveButtonNotificationObserver(notification: NSNotification) {
        
        //정보 받아서 사용, 타입캐스팅 필수 nil 일수도 있어서 옵셔널 name value는 Key
        // UserInfo any type이어서 String 값이 필요하니까 다운캐스팅
        if let text = notification.userInfo?["name"] as? String {
            print(#function)
            self.nameTextField.text = text
            
        } else {
            
        }
    }
    
    @objc func saveButtonClicked() {
        
        //1. 클로저
        //값 전달 기능 실행 => 클로저 구문 활용
        //saveButtonActionHandler 자체가 옵셔널이라 ?
        //saveButtonActionHandler?(nameTextField.text!) //원하는 시점에 함수를 실행시킴
        
        //화면 Dismiss
        
        //2. Notification 쓸때만 사용됨
        NotificationCenter.default.post(name: .saveButton, object: nil, userInfo: ["name": nameTextField.text!, "value": 123456])
        
        
        //화면 dismiss
        dismiss(animated: true)
    }
    
    
   

}
