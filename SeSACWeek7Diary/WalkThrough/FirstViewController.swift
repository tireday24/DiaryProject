//
//  FirstViewController.swift
//  SeSACWeek7Diary
//
//  Created by 권민서 on 2022/08/16.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var tutorialLabel: UILabel!
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var blackViewWidth: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tutorialLabel.numberOfLines = 0
        tutorialLabel.alpha = 0
        tutorialLabel.font = .boldSystemFont(ofSize: 25)
        tutorialLabel.text = """
        일기 씁시다!!
        잘 써봅니다!!!
        """
        
        blackView.backgroundColor = .black
        blackView.alpha = 0
        UIView.animate(withDuration: 3) {
            self.tutorialLabel.alpha = 1
        } completion: { _ in
            self.blackViewAnimation() //또 에니메이션 넣기
        }


        
    }
    
    func blackViewAnimation() {
//        UIView.animate(withDuration: 2, delay: 3, options: <#T##UIView.AnimationOptions#>) {
//            self.blackViewWidth.constant += 200
//            self.blackView.alpha = 1
//
//        } completion: { _ in
//
//        }
//
    }
    

 

}
