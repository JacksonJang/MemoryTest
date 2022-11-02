//
//  ThirdVC.swift
//  MemoryTest
//
//  Created by 장효원 on 2022/11/02.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Then

/*
 UIView 안에 UICollectionView를 넣고 이미지 로딩하는 컨트롤러
 */

class ThirdVC: BaseVC {
    var viewModel = ThirdViewModel()
    
    let layout = UICollectionViewFlowLayout()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then{
        $0.register(MemoryViewListViewCell.self, forCellWithReuseIdentifier: MemoryViewListViewCell.identifier)
        $0.delegate = self
        $0.dataSource = self
    }
    
    deinit {
        print("💙 SecondVC deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setBindings()
        
        self.viewModel.createImageDatas()
    }
    
    public func configuration() {
        collectionView.reloadData()
    }
    
    private func setupUI() {
        self.view.addSubview(collectionView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setBindings() {
        viewModel.items.observe(on: MainScheduler.instance)
            .bind{ [weak self] items in
                guard let strongSelf = self else { return }
                guard let items = items else { return }
                
                strongSelf.configuration()
            }.disposed(by: disposeBag)
    }
}

extension ThirdVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let items = self.viewModel.items.value {
            return items.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MemoryViewListViewCell.identifier, for: indexPath) as! MemoryViewListViewCell
        let index = indexPath.item
        guard let items = self.viewModel.items.value else {
            return cell
        }
        
        let item = items[index]
        
        cell.thumbImageView.kf.setImage(with: item.toURL)
        
        return cell
    }
}

