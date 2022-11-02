//
//  MainViewCell.swift
//  MemoryTest
//
//  Created by 장효원 on 2022/11/01.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Then

class MainViewCell: BaseTableViewCell {
    static let identifier = "MainViewCell"
    
    let titleLabel = UILabel().then{
        $0.numberOfLines = 0
        $0.lineBreakMode = .byCharWrapping
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    public func configuration(text: String) {
        titleLabel.text = text
    }
    
    private func setupUI() {
        [
            titleLabel
        ].forEach{
            contentView.addSubview($0)
        }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.bottom.equalToSuperview().offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
