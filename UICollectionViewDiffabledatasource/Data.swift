//
//  Data.swift
//  UICollectionViewDiffabledatasource
//
//  Created by Min-Su Kim on 2022/08/10.
//

import Foundation

struct Data: Hashable {
  let text: String
}

extension Data {
  static let sampleValues: [Data] = [Data(text: "안녕하세요"),
                                     Data(text: "안녕하세요 조금 더 긴 문장입니다."),
                                     Data(text:"안녕하세요 더욱 더 긴 문장입니다. 안녕하세요 더욱 더 긴 문장입니다."),
                                     Data(text: "안녕하세요 더더더더더덛더욱 긴 문장입니다. 안녕하세요 더더더더더덛더욱 긴 문장입니다. 안녕하세요 더더더더더덛더욱 긴 문장입니다.")]
}
