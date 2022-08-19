//
//  WriteViewController.swift
//  SeSACWeek7Diary
//
//  Created by 권민서 on 2022/08/19.
//

import UIKit
import SnapKit

class WriteViewController: BaseViewController {
    
    var mainView = WriteView()
    //프로퍼티 만드는 이유는 WriteView안에 기능 수정할 가능성 대비
    

    
    //viewDidLoad보다 먼저 호출
    override func loadView() { //super.loadView X
        //rootView를 mainView를 사용하겠다
        //custom한게 mainView가 등록되어 있기 때문에 실행하면 우리 눈에는 MainView가 보인다
        //위치는 인스턴스로 불렀지만 내부 접근은 x
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configure() {
        //기능 넣기
        //(_:) 함수 매개변수
        mainView.titleTextField.addTarget(self, action: #selector(titleTextFieldClicked(_:)), for: .editingDidEndOnExit)
    }
    
    @objc func titleTextFieldClicked(_ textField: UITextField) {
        guard let text = textField.text, text.count > 0 else {
            showAlertMessage(title: "제목을 입력해주세요", button: "확인")
            return
        }
    }
    
}
    

