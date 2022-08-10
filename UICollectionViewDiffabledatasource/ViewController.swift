//
//  ViewController.swift
//  UICollectionViewDiffabledatasource
//
//  Created by Min-Su Kim on 2022/08/10.
//

import UIKit

final class ViewController: UIViewController {
  var collectionView: UICollectionView!
  
  enum Section {
    case main
    case second
  }
  
  typealias Item = Data
  var datasource: UICollectionViewDiffableDataSource<Section, Item>!
  let items: [Data] = Data.sampleValues
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView = UICollectionView(frame: .zero,
                                      collectionViewLayout: makeLayout())
    collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
    
    datasource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView,
                                                                   cellProvider: { collectionView, indexPath, item in
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else {
        return nil
      }
      
      cell.configure(item: item)
      return cell
    })
    
    var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
    snapshot.appendSections([.main, .second])
    snapshot.appendItems(items, toSection: .main)
    datasource.apply(snapshot)
    
    setView()
    setConstraint()
  }
  
  func setView() {
    view.addSubview(collectionView)
  }
  
  func setConstraint() {
    collectionView.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(0)
      make.trailing.equalToSuperview().offset(0)
      make.top.equalTo(view.layoutMarginsGuide.snp.top)
      make.bottom.equalToSuperview()
    }
  }
  
  func makeLayout() -> UICollectionViewCompositionalLayout {
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                          heightDimension: .estimated(100))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                           heightDimension: .estimated(100))
    let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
    let section = NSCollectionLayoutSection(group: group)
    section.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                    leading: 16,
                                                    bottom: 0,
                                                    trailing: 16)
    section.interGroupSpacing = 16
    let layout = UICollectionViewCompositionalLayout(section: section)
    return layout
  }
}

