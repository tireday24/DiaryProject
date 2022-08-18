//
//  ProfileViewController.swift
//  SeSACWeek7Diary
//
//  Created by 권민서 on 2022/08/18.
//

import UIKit
import SnapKit

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
    var saveButtonActionHandler: (() -> ())? //함수 자체
    
    
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
    }
    
    @objc func saveButtonClicked() {
        
        //값 전달 기능 실행 => 클로저 구문 활용
        //saveButtonActionHandler 자체가 옵셔널이라 ?
        saveButtonActionHandler?() //원하는 시점에 함수를 실행시킴
        
        //화면 Dismiss
        dismiss(animated: true)
    }
    
    
   

}
