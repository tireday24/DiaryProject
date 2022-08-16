//
//  ViewController.swift
//  SeSACWeek7Diary
//
//  Created by 권민서 on 2022/08/16.
//

import UIKit
import SeSAC2UIFramework

class ViewController: UIViewController {
    
    var name = "고래밥"
    
    private var age = 22

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //자주 사용하는 반복해서 사용하는 것들을 접근제어에 넣어서 사용하자
        //framework를 통해서 접근제어 활용
        
        testOpen()
//        showSesacAlert(title: "테스트 얼럿", message: "테스트 메시지", buttonTitle: "변경") { _ in
//            self.view.backgroundColor = .lightGray
//        }
        
//        let image = UIImage(systemName: "star.fill")!
//        let shareURL = "https://www.apple.com"
//        let text = "WWDC What's New!!"
//        sesacShowActivityViewController(shareImage: image, shareURL: shareURL, shareText: text)
        
        OpenWebView.presentWebViewController(self, url: "https://www.naver.com", transitionStyle: .present)
        
    }


}
