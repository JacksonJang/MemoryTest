//
//  File.swift
//  MemoryTest
//
//  Created by 장효원 on 2022/11/01.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Then

class BaseTableViewCell: UITableViewCell {
    var disposeBag = DisposeBag()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
