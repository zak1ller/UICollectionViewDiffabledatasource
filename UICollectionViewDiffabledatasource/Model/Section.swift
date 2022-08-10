//
//  Section.swift
//  UICollectionViewDiffabledatasource
//
//  Created by Min-Su Kim on 2022/08/10.
//

import Foundation

struct Section: Hashable {
  let id = UUID()
  var title: String
  var datas: [Data]
}

extension Section {
  static var sections: [Section] = [
    Section(title: "Header 1", datas: [
      Data(text: "sdmklamdslk dlkamaslkdmlkw klmdlkamdklwmlkdw dwlkdmlk")
    ]),
    Section(title: "Header 2", datas: [
      Data(text: "d alkdmslakmdlka dklsamdlsa dklmdlka dklmdslakmdklamdkmaslkd slkadmlkamdlkmlk dlaksmdslkamdk"),
      Data(text: "dmalskdmaslkdm lsdkmsalkdmalksd laksmdlkas dkladmsklmdlak lkdmkl"),
      Data(text: "da,skldmklasd slakdmklsa dlkasmdlksamdklas dklamsdlkmlkad lkmdlskamdlk")
    ]),
    Section(title: "Header 3", datas: [
      Data(text: "d alkdmslakmdlka dklsamdlsa dklmdlka dklmdslakmdklamdkmaslkd slkadmlkamdlkmlk dlaksmdslkamdk"),
      Data(text: "dmalskdmaslkdm lsdkmsalkdmalksd laksmdlkas dkladmsklmdlak lkdmkl"),
      Data(text: "da,skldmklasd slakdmklsa dlkasmdlksamdklas dklamsdlkmlkad lkmdlskamdlk"),
      Data(text: "d alkdmslakmdlka dklsamdlsa dklmdlka dklmdslakmdklamdkmaslkd slkadmlkamdlkmlk dlaksmdslkamdk"),
      Data(text: "dmalskdmaslkdm lsdkmsalkdmalksd laksmdlkas dkladmsklmdlak lkdmkl"),
      Data(text: "da,skldmklasd slakdmklsa dlkasmdlksamdklas dklamsdlkmlkad lkmdlskamdlk")
    ])
  ]
}
