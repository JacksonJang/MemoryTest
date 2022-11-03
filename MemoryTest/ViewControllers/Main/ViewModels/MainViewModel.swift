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
        let list = [MainItem(title: "UIView 안에 UICollectionView(Second)", value: "SecondVC"),
                    MainItem(title: "UICollectionView 설정(Third)", value: "ThirdVC"),
                    MainItem(title: "UITableView 테스트", value: "UITableViewVC"),
                    MainItem(title: "CollectionHeaderVC 테스트", value: "CollectionHeaderVC")
                    ]
        items.accept(list)
    }
}
