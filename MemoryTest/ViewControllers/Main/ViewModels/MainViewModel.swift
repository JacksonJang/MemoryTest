//
//  MainViewModel.swift
//  MemoryTest
//
//  Created by 장효원 on 2022/11/01.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Then

class MainViewModel {
    var items = BehaviorRelay<[MainItem]?>.init(value: nil)
}

//MARK: - Set Data
extension MainViewModel {
    func getData() {
        let list = [MainItem(title: "UIView 안에 UICollectionView", value: "SecondVC"),
                    MainItem(title: "UICollectionView 설정", value: "ThirdVC")
                    ]
        items.accept(list)
    }
}
