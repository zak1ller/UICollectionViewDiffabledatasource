//
//  ViewController.swift
//  UICollectionViewDiffabledatasource
//
//  Created by Min-Su Kim on 2022/08/10.
//

import UIKit

final class ViewController: UIViewController {
  var collectionView: UICollectionView!
  
  typealias Item = Data
  var datasource: UICollectionViewDiffableDataSource<Section, Item>!
  let sections: [Section] = Section.sections
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setView()
    setConstraint()
  }
}

extension ViewController {
  func setView() {
    collectionView = UICollectionView(frame: .zero,
                                      collectionViewLayout: makeLayout())
    collectionView.register(CollectionViewCell.self,
                            forCellWithReuseIdentifier: "CollectionViewCell")
    collectionView.register(HeaderView.self,
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                            withReuseIdentifier: HeaderView.identifier)
    
    datasource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView,
                                                                   cellProvider: { collectionView, indexPath, item in
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else {
        return nil
      }
      
      cell.configure(item: item)
      return cell
    })
    datasource.supplementaryViewProvider = { collectionView, kind, indexPath in
      guard kind == UICollectionView.elementKindSectionHeader else {
        return nil
      }
      let view = collectionView.dequeueReusableSupplementaryView(
        ofKind: kind,
        withReuseIdentifier: HeaderView.identifier,
        for: indexPath) as? HeaderView
      let section = self.datasource.snapshot()
        .sectionIdentifiers[indexPath.section]
      view?.prepare(text: section.title)
      return view
    }
    
    var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
    snapshot.appendSections(sections)
    sections.forEach { section in
      snapshot.appendItems(section.datas, toSection: section)
    }
    datasource.apply(snapshot)
    
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
    section.contentInsets = NSDirectionalEdgeInsets(top: 16,
                                                    leading: 16,
                                                    bottom: 0,
                                                    trailing: 16)
    section.interGroupSpacing = 8
    let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .estimated(20))
    let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerFooterSize,
                                                                    elementKind: UICollectionView.elementKindSectionHeader,
                                                                    alignment: .top)
    section.boundarySupplementaryItems = [sectionHeader]
    
    let layout = UICollectionViewCompositionalLayout(section: section)
    return layout
  }
}
