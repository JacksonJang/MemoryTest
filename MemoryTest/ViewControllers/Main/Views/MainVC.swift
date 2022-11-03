import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Then
import RxGesture
import Kingfisher

class MainVC: BaseVC {
    var viewModel = MainViewModel()
    
    lazy var tableView = UITableView().then{
        $0.register(MainViewCell.self, forCellReuseIdentifier: MainViewCell.identifier)
        $0.delegate = self
        $0.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setBindings()
        viewModel.getData()
        ImageCache.default.clearMemoryCache()
    }
    
    private func setupUI() {
        [
            tableView
        ].forEach{
            self.view.addSubview($0)
        }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setBindings() {
        viewModel.items.observe(on: MainScheduler.instance)
            .bind{ [weak self] items in
                guard let strongSelf = self else { return }
                guard let items = items else { return }
                
                strongSelf.tableView.reloadData()
            }.disposed(by: disposeBag)
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = viewModel.items.value?.count {
            return count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainViewCell.identifier, for: indexPath) as! MainViewCell
        let index = indexPath.row
        guard let items = viewModel.items.value else { return cell }
        let item = items[index]
        
        cell.configuration(text: item.title)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        if let item = self.viewModel.items.value?[index] {
            switch item.value {
            case MainType.uivewInUICollectionView.rawValue:
                print("💙 UIView 안에 있는 UICollectionView 선택")
                let vc = SecondVC()
                self.push(vc)
            case MainType.onlyUIColelctionView.rawValue:
                print("💙 오직 UICollectionView 만 선택")
                let vc = ThirdVC()
                self.push(vc)
            case MainType.tableView.rawValue:
                print("💙 오직 tableView 만 선택")
                let vc = UITableViewVC()
                self.push(vc)
            case MainType.collectionViewHeader.rawValue:
                print("💙 collectionViewHeader 선택")
                let vc = CollectionHeaderVC()
                self.push(vc)
            default:
                print("💙 기타 선택")
            }
        }
    }
}
