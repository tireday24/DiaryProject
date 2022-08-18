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
        
        
    }
    
    @objc func nameButtonClicked() {
        let vc = ProfileViewController()
        
        //바로 중괄호? 클로져는 이름없는 함수기 때문에 프로퍼티에 넣을 수 있고 호출하려면 함수호출연산자 붙여줘야함
        //실행은 안돼지만 함수 기능은 넣을 수 있다 실행은 안된다 실행은 함수호출될때 한다
        //함수 기능은 여기서 실행
        //값을 여기서 넘김
        vc.saveButtonActionHandler = {
            self.nameButton.setTitle(vc.nameTextField.text, for: .normal)
        }
        
        present(vc, animated: true)
        
        //기능은 여기서
    }

    func configure() {
        view.addSubview(nameButton)
        
        nameButton.snp.makeConstraints { make in
            make.width.height.equalTo(200)
            make.center.equalTo(view)
        }
    }

    


}

