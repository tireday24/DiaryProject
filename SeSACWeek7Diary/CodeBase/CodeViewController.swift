//
//  CodeViewController.swift
//  SeSACWeek7Diary
//
//  Created by 권민서 on 2022/08/17.
//

import UIKit

/*
 공통
 1. 뷰객체 프로퍼티 선언. 클래스의 인스턴스를 생성
 2/ 명시적으로 루트뷰에 추가
 3. 크기와 위치 및 속성 정의
    => Frame 기반 한계
    => AutoResizingMask, AutoLayout 등장!
    => NSLayoutConstraints
    
 */

class CodeViewController: UIViewController {

    //1. 뷰객체 프로퍼티 선언. 클래스의 인스턴스를 생성
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let signButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //storyboard에서 +버튼 눌러서 추가하는 과정
        //이 과정 없으면 시각적으로 드러나지 않는다
        //2. 명시적으로 루트뷰에 추가
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signButton)
        
        
        //1. Frame 기반
        //3. 크기와 위치 및 속성 정의
        //frame 기반 절대적인 수치는 safeArea 무시
        //절대적인 수치라 디바이스 마다 차이가 날 수 있음
        //왼쪽 오른쪽 50 빼라 대칭으로
        emailTextField.frame = CGRect(x: 50, y: 80, width: UIScreen.main.bounds.width - 100, height: 50)
        emailTextField.borderStyle = .line
        emailTextField.backgroundColor = .lightGray
        
        //2. NSLayoutConstraints
        //충돌 발생 금지
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false // storyboard에서는 true
        passwordTextField.backgroundColor = .lightGray
        
//        let top = NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 100)
//        top.isActive = true // 레이아웃 활성화 .add(추가 하는 과정 IsActive)
//        let leading = NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 50)
//        leading.isActive = true
//        NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: emailTextField, attribute: .trailing, multiplier: 1, constant: -50).isActive = true
//        NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60).isActive = true
        
        
        //3. NSLayoutConstraints addConstraints
        let top = NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 100)
        let leading = NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 50)
        let trailing = NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: emailTextField, attribute: .trailing, multiplier: 1, constant: -50)
        let height = NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60)
        
        view.addConstraints([top, leading, trailing, height])
        
        //4. NSLayoutAnchor
        signButton.translatesAutoresizingMaskIntoConstraints = false
        signButton.backgroundColor = .black
        
        NSLayoutConstraint.activate([
            signButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signButton.widthAnchor.constraint(equalToConstant: 300),
            signButton.heightAnchor.constraint(equalToConstant: 50),
            signButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        
    }
    

   
}
