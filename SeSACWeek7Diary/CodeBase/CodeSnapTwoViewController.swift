//
//  CodeSnapTwoViewController.swift
//  SeSACWeek7Diary
//
//  Created by 권민서 on 2022/08/17.
//

import UIKit
//이미 내부에 코드가 만들어져 있을 확률 높음
import SnapKit

class CodeSnapTwoViewController: UIViewController {
    
    let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()

    let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UIVC에 UIVIew객체(RootView) 지금은 view에 뷰를 add해줘서 동일 선상해 놓여 있는 중
        [redView, blackView].forEach {
            view.addSubview($0)
        }
        
        //redview 안에 yellowview
        //containerView, StackView는 addsubview가 아닌 다른 메서드를 사용해야 한다 -> 검색해보기
        redView.addSubview(yellowView)
        
        redView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(200)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalTo(view)
        }
        
        blackView.snp.makeConstraints { make in
            //offset 모든 엣지의 x축 y축 상관없이 50위 아래로 이동
            //addsubview의 추가 순서대로 나옴
            make.edges.equalTo(redView).inset(50)//offset(50)
            //left와 leading , right와 trailing 차이
            //글씨를 쓰는 방향이 차이에 따라 TextAlighment가 다름 left right는 무조건 왼쪽 오른쪽 Leading trailing은 국가에 맞게 알아서 처리해줌
        }
        

    }
    
    
    

   

}
