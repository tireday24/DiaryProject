//
//  UIViewController + Extension.swift
//  SeSACWeek7Diary
//
//  Created by 권민서 on 2022/08/18.
//

import UIKit

extension UIViewController {
    
    //TMDB
    func transitionViewController<T: UIViewController>(storyboard: String, viewController vc: T) {
        
        let sb = UIStoryboard(name: storyboard, bundle: nil)
        guard let controller = sb.instantiateViewController(withIdentifier: String(describing: vc)) as? T else { return }
        self.present(controller, animated: true)
        
    }
    
    
    
}
