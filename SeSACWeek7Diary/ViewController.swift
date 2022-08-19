//
//  ViewController.swift
//  SeSACWeek7Diary
//
//  Created by 권민서 on 2022/08/16.
//

import UIKit
import SeSAC2UIFramework
import SnapKit

class ViewController: UIViewController {
    
    let nameButton: UIButton =  {
        let view = UIButton()
        view.setTitle("닉네임", for: .normal)
        view.backgroundColor = .black
        view.tintColor = .black
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
        nameButton.addTarget(self, action: #selector(nameButtonClicked), for: .touchUpInside)
        
        //어디서 처리할건가?, selector 처리, noti에서 지정한 Name, object
        NotificationCenter.default.addObserver(self, selector: #selector(saveButtonNotificationObserver(notification:)), name: NSNotification.Name("saveButtonNotification"), object: nil)
        
        
    }
    
    //전달 받을 이름 받아야해서 notification 매개변수 만듬
    @objc func saveButtonNotificationObserver(notification: NSNotification) {
        
        //정보 받아서 사용, 타입캐스팅 필수 nil 일수도 있어서 옵셔널 name value는 Key
        // UserInfo any type이어서 String 값이 필요하니까 다운캐스팅
        if let text = notification.userInfo?["name"] as? String {
            print(text)
            self.nameButton.setTitle(text, for: .normal)
        } else {
            
        }
    }
    
    @objc func nameButtonClicked() {
        
        NotificationCenter.default.post(name: NSNotification.Name("TEST"), object: nil, userInfo: ["name": "\(Int.random(in: 1...100))", "value": 123456])
        
        
        let vc = ProfileViewController()
        
        //바로 중괄호? 클로져는 이름없는 함수기 때문에 프로퍼티에 넣을 수 있고 호출하려면 함수호출연산자 붙여줘야함
        //실행은 안돼지만 함수 기능은 넣을 수 있다 실행은 안된다 실행은 함수호출될때 한다
        //함수 기능은 여기서 실행
        //값을 여기서 넘김
        vc.saveButtonActionHandler = { text in
            self.nameButton.setTitle(text, for: .normal)
        }
        
        present(vc, animated: true)
    }

    func configure() {
        view.addSubview(nameButton)
        
        nameButton.snp.makeConstraints { make in
            make.width.height.equalTo(200)
            make.center.equalTo(view)
        }
    }

    


}

