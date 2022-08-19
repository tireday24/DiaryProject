//
//  BaseView.swift
//  SeSACWeek7Diary
//
//  Created by 권민서 on 2022/08/19.
//

import UIKit

class BaseView: UIView {
    
    //uiview에서 왔구나
    //코드 베이스로 작업하는구나
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setConstraints()
    }
    
    //프로토콜에서 왔구나, 코드베이스 때는 안쓰면 안됨? -> 프로토콜 때문에 무조건 써야함 대신 ? 를 통해서 실패가능한 Init
    //코드베이스면 required init이 실행되지 않음 근데 실행되면 런타임 오류 xib로 만들면 requird init 실행됨
    //xib에서 만들때는 Required init에서 함수 호출을 해주어야 한다
    //xib, storyboard, Protocol 기반으로 해줌
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        //fatalError("init(coder:) has not been implemented")// 런타임 오류
    }
    
    func configureUI() {
        
    }
    
    func setConstraints() {
        
    }
    
}


//overrie init required init
//required initializer
//부모 프로토콜 채택 -> required 생성됨 -> 자식도 required init
//초기화 구문이 프로토콜 안에 있으면 구분을 해주기 위해서 required가 붙음
protocol example {
    init(name: String)
}

class Mobile: example {
    let name: String
    
    required init(name: String) {
        self.name = name
    }
}

class Apple: Mobile {
    let wwdc: String
    
    //부모의 멤버도 초기화 시켜주어야함
    //자식 초기화 -> 부모 초기화 순서
    init(wwdc: String) {
        self.wwdc = wwdc
        
        super.init(name: "모바일")
    }
    
    required init(name: String) {
        fatalError("init(name:) has not been implemented")
    }
    
    //유추: init 구문이 프로토콜 안에서 있고 init 구문은 상속 받았구나
    //required override init(name: String) {
        
    //}
    
    
}

let a = Apple(wwdc: "애플")
