//
//  HeaderVIew.swift
//  UICollectionViewDiffabledatasource
//
//  Created by Min-Su Kim on 2022/08/10.
//

import Foundation
import UIKit

final class HeaderView: UICollectionReusableView {
  lazy var titleLabel = UILabel().then {
    $0.textColor = .white
  }
  
  static var identifier: String {
    return String(describing: HeaderView.self)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setView()
    setConstraint()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
  }
  
  func prepare(text: String?) {
    titleLabel.text = text
  }
  
  func setView() {
    self.addSubview(titleLabel)
  }
  
  func setConstraint() {
    titleLabel.snp.makeConstraints { make in
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
      make.top.equalToSuperview().offset(40)
      make.bottom.equalToSuperview()
    }
  }
}
