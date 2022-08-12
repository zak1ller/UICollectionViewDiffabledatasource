//
//  ViewControllerViewModel.swift
//  UICollectionViewDiffabledatasource
//
//  Created by Min-Su Kim on 2022/08/12.
//

import Foundation
import Combine

final class ViewControllerViewModel {
  typealias Item = Data
  
  @Published var sections: [Section]
  @Published var selectedIndexPath: IndexPath?
  
  init(sections: [Section]) {
    self.sections = sections
  }
  
  func didSelect(at indexPath: IndexPath) {
    sections[indexPath.section].datas.remove(at: indexPath.item)
  }
}
