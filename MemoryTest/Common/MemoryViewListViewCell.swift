//
//  MemoryViewListViewCell.swift
//  MemoryTest
//
//  Created by 장효원 on 2022/11/01.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Then

class MemoryViewListViewCell: BaseCollectionViewCell {
    static let identifier = "MemoryViewListViewCell"
    
    let thumbImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    public func configuration() {
        
    }
    
    private func setupUI() {
        [
            thumbImageView
        ].forEach{
            self.contentView.addSubview($0)
        }
        
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
