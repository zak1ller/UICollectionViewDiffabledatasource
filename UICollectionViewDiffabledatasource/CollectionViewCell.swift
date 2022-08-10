//
//  CollectionViewCell.swift
//  UICollectionViewDiffabledatasource
//
//  Created by Min-Su Kim on 2022/08/10.
//

import Foundation
import UIKit

class CollectionViewCell: UICollectionViewCell {
  lazy var valueLabel = UILabel().then {
    $0.textColor = .white
    $0.font = .systemFont(ofSize: 14, weight: .medium)
    $0.numberOfLines = 0
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setView()
    setConstraint()
  }
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    setView()
    setConstraint()
  }
  
  func configure(item: Data) {
    valueLabel.text = item.text
  }
  
  private func setView() {
    contentView.addSubview(valueLabel)
    contentView.backgroundColor = .darkGray
    contentView.layer.cornerRadius = 16
  }
  
  private func setConstraint() {
    valueLabel.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(16)
      make.trailing.equalToSuperview().offset(-16)
      make.top.equalToSuperview().offset(16)
      make.bottom.equalToSuperview().offset(-16)
    }
  }
}
