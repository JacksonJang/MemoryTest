//
//  ThirdViewModel.swift
//  MemoryTest
//
//  Created by 장효원 on 2022/11/02.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Then

class ThirdViewModel {
    var items = BehaviorRelay<[String]?>.init(value: nil)
}

extension ThirdViewModel {
    func createImageDatas() {
        items.accept(ImageData().items)
    }
}
