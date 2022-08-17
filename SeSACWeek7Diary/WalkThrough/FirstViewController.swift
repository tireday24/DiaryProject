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
    @IBOutlet weak var animationImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationImage.image = UIImage(systemName: "star.fill")
        
        tutorialLabel.numberOfLines = 0
        tutorialLabel.alpha = 0
        tutorialLabel.font = .boldSystemFont(ofSize: 25)
        //tutorialLabel.backgroundColor = .yellow
        tutorialLabel.text = """
        일기 씁시다!!
        잘 써봅니다!!!
        """
        
        blackView.backgroundColor = .black
        blackView.alpha = 0
        UIView.animate(withDuration: 3) {
            self.tutorialLabel.alpha = 1
            //self.tutorialLabel.backgroundColor = .white
        } completion: { _ in
            self.blackViewAnimation() //또 에니메이션 넣기
        }

        animateImageView()
        
    }
    
    func blackViewAnimation() {
        
        UIView.animate(withDuration: 2) {
            //크기를 키우는 애니메이션 줄이고 싶으면 소수점으로 설정
            //rotationAngle -> 위치 변경
            //translationX 위치 변경
            //abcdtxty -> 행렬에 기반
            self.blackView.transform = CGAffineTransform(scaleX: 2, y: 1)
            //self.blackViewWidth.constant += 200
            self.blackView.alpha = 1

        } completion: { _ in

        }

    }
    
    func animateImageView() {
        
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse]) {
            self.animationImage.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }

        
    }
    

 

}
