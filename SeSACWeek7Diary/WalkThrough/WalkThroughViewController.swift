//
//  WalkThroughViewController.swift
//  SeSACWeek7Diary
//
//  Created by 권민서 on 2022/08/16.
//

import UIKit

//뷰컨 여러개 묶음
class WalkThroughViewController: UIPageViewController {
    
    //뷰컨틀로러 배열
    var pageViewControllerList: [UIViewController] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .magenta
        //순서 중요
        createPageViewController()
        configurePageViewController()

        
    }
    
    //배열에 뷰컨트롤러 추가
    func createPageViewController() {
        let sb = UIStoryboard(name: "WalkThrough", bundle: nil)
        let vc1 = sb.instantiateViewController(withIdentifier: FirstViewController.reuseIdentifier) as! FirstViewController
        let vc2 = sb.instantiateViewController(withIdentifier: SecondViewController.reuseIdentifier) as! SecondViewController
        let vc3 = sb.instantiateViewController(withIdentifier: ThirdViewController.reuseIdentifier) as! ThirdViewController
        pageViewControllerList = [vc1, vc2, vc3]
    }
    
    func configurePageViewController() {
        delegate = self
        dataSource = self
        
        //display 시작점 만들기
        guard let first = pageViewControllerList.first else { return }
        setViewControllers([first], direction: .forward, animated: true)
    }

    

}

extension WalkThroughViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        //현재 페이지뷰컨트롤러에 보이는 뷰컨(viewController)의 인덱스 가져오기 fir 인덱스 정보 알려줌
        guard let viewControllerIndex = pageViewControllerList.firstIndex(of: viewController) else { return nil}
        let previousIndex = viewControllerIndex - 1 // first의 경우 -1됨
        
        return previousIndex < 0 ? nil : pageViewControllerList[previousIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        //현재 페이지뷰컨트롤러에 보이는 뷰컨(viewController)의 인덱스 가져오기 fir 인덱스 정보 알려줌
        guard let viewControllerIndex = pageViewControllerList.firstIndex(of: viewController) else { return nil}
        let nextIndex = viewControllerIndex + 1 // first의 경우 -1됨
        
        return nextIndex >= pageViewControllerList.count ? nil : pageViewControllerList[nextIndex]
        
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pageViewControllerList.count
        
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let first = viewControllers?.first, let index = pageViewControllerList.firstIndex(of: first) else { return 0 }
        
        return index
    }
    
    
    
    
}
