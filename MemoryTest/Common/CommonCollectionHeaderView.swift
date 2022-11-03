//
//  TableHeaderView.swift
//  MemoryTest
//
//  Created by 장효원 on 2022/11/03.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Then

class CommonCollectionHeaderView: UICollectionReusableView {
    static let identifier = "CommonCollectionHeaderView"
    
    let stackView = UIStackView().then{
        $0.axis = .vertical
    }
    
    let view = UIView().then{
        $0.backgroundColor = .blue
        
        $0.snp.makeConstraints{
            $0.height.equalTo(100)
        }
    }
    
    let view2 = UIView().then{
        $0.backgroundColor = .red
        
        $0.snp.makeConstraints{
            $0.height.equalTo(200)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    private func setupUI() {
        self.addSubview(stackView)
        
        stackView.addArrangedSubview(view)
        stackView.addArrangedSubview(view2)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
