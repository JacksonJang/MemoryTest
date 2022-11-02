//
//  MemoryViewListView.swift
//  MemoryTest
//
//  Created by 장효원 on 2022/11/01.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Then
import Kingfisher
import SDWebImage

class MemoryViewListView: BaseView {
    var observer:NSKeyValueObservation?
    var items:[String] = []
    
    let layout = UICollectionViewFlowLayout()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then{
        $0.register(MemoryViewListViewCell.self, forCellWithReuseIdentifier: MemoryViewListViewCell.identifier)
        $0.delegate = self
        $0.dataSource = self
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        if newSuperview == nil {
            print("💙 MemoryViewListView deinit")
            self.items = []
            self.collectionView.reloadData()
            removeObserver()
            collectionView.delegate = nil
            collectionView.dataSource = nil
            let cache = ImageCache.default
            cache.clearCache()
            cache.cleanExpiredCache()
            SDImageCache.shared.clearMemory()
            SDImageCache.shared.clearDisk()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        addObserver()
    }
    
    public func configuration(items:[String]) {
        self.items = items
        
        collectionView.reloadData()
    }
    
    /**
     뷰에 대한 높이를 설정하는 옵버저 추가
     */
    private func addObserver() {
        let handler = {[weak self] (collectionView: UICollectionView, change: NSKeyValueObservedChange<CGSize>) in
            guard let strongSelf = self else { return }
            if let contentSize = change.newValue {
                
                strongSelf.snp.updateConstraints{
                    $0.height.equalTo(contentSize.height)
                }
            }
        }
        
        observer = collectionView.observe(\UICollectionView.contentSize, options: [NSKeyValueObservingOptions.new], changeHandler: handler)
    }
    
    /**
     뷰에 대한 높이를 설정하는 옵버저 제거
     */
    private func removeObserver() {
        observer?.invalidate()
        observer = nil
    }
    
    private func setupUI() {
        self.addSubview(collectionView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        self.snp.makeConstraints{
            $0.height.equalTo(1)
        }
        
        collectionView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MemoryViewListView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MemoryViewListViewCell.identifier, for: indexPath) as! MemoryViewListViewCell
        let index = indexPath.item
        let item = items[index]
        
//        cell.thumbImageView.kf.setImage(with: item.toURL)
        cell.thumbImageView.sd_setImage(with: item.toURL)
        
        return cell
    }
}
