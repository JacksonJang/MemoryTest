//
//  UITableViewVC.swift
//  MemoryTest
//
//  Created by 장효원 on 2022/11/02.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Then
import Kingfisher

class UITableViewVC: BaseVC {
    var items:[String] = []
    lazy var tableView = UITableView().then{
        $0.register(UITableViewCustomCell.self, forCellReuseIdentifier: UITableViewCustomCell.identifier)
        $0.delegate = self
        $0.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configuration()
    }
    
    private func configuration() {
        self.items = ImageData().items
        tableView.reloadData()
    }
    
    private func setupUI() {
        self.view.addSubview(tableView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension UITableViewVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCustomCell.identifier, for: indexPath) as! UITableViewCustomCell
        let index = indexPath.row
        
        let item = items[index]
        cell.thumbImageView.kf.setImage(with: item.toURL)
        
        return cell
    }
}

class UITableViewCustomCell: UITableViewCell {
    static let identifier = "UITableViewCustomCell"
    
    let thumbImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
        
    private func setupUI() {
        contentView.addSubview(thumbImageView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        thumbImageView.snp.makeConstraints{
            $0.top.leading.bottom.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(100)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
