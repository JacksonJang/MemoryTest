//
//  BaseVC.swift
//  MemoryTest
//
//  Created by 장효원 on 2022/11/01.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Then
import RxGesture

class BaseVC: UIViewController {
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
    }
}

extension BaseVC {
    func push(_ vc:UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func pop() {
        self.navigationController?.popViewController(animated: true)
    }
}
