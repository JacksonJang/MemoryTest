//
//  CommonCollectionViewCell.swift
//  MemoryTest
//
//  Created by 장효원 on 2022/11/03.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Then

class CommonCollectionViewCell: BaseCollectionViewCell {
    static let identifier = "CommonCollectionViewCell"
    
    let thumbImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(thumbImageView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        thumbImageView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
