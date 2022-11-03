//
//  SecondVC.swift
//  MemoryTest
//
//  Created by 장효원 on 2022/11/01.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Then

/*
 UIView 안에 UICollectionView를 넣고 이미지 로딩하는 컨트롤러
 */

class SecondVC: BaseVC {
    var viewModel:SecondVCModel? = SecondVCModel()
    
    var listView:MemoryViewListView? = MemoryViewListView()
    
    deinit {
        print("💙 SecondVC deinit")
        listView = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setBindings()
        
        self.viewModel?.createImageDatas()
    }
    
    public func configuration(items:[String]) {
        listView!.configuration(items: items)
    }
    
    private func setupUI() {
        self.view.addSubview(listView!)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        listView!.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setBindings() {
        viewModel?.items.observe(on: MainScheduler.instance)
            .bind{ [weak self] items in
                guard let strongSelf = self else { return }
                guard let items = items else { return }
                
                strongSelf.configuration(items: items)
            }.disposed(by: disposeBag)
    }
}
