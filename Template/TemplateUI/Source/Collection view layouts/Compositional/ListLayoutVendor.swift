//
//  ListLayoutVendor.swift
//  GixonUI
//
//  Created by Domagoj Kulundzic on 09.11.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit

public struct ListLayoutVendor {
  public let estimatedItemHeight: CGFloat
  public let estimatedSectionHeaderHeight: CGFloat?
  public let estimatedSectionFooterHeight: CGFloat?
  public let sectionInsets: NSDirectionalEdgeInsets?
  public let interItemSpacing: NSCollectionLayoutSpacing?
  public let interGroupSpacing: CGFloat?
  public let pinsHeaderToBoundary: Bool

  public init(
    estimatedItemHeight: CGFloat,
    estimatedSectionHeaderHeight: CGFloat? = nil,
    estimatedSectionFooterHeight: CGFloat? = nil,
    sectionInsets: NSDirectionalEdgeInsets? = nil,
    interItemSpacing: NSCollectionLayoutSpacing? = nil,
    interGroupSpacing: CGFloat? = nil,
    pinsHeaderToBoundary: Bool = false) {
    self.estimatedItemHeight = estimatedItemHeight
    self.estimatedSectionHeaderHeight = estimatedSectionHeaderHeight
    self.estimatedSectionFooterHeight = estimatedSectionFooterHeight
    self.sectionInsets = sectionInsets
    self.interItemSpacing = interItemSpacing
    self.interGroupSpacing = interGroupSpacing
    self.pinsHeaderToBoundary = pinsHeaderToBoundary
  }
}

extension ListLayoutVendor: CompositionalLayoutVendor {
  public func vendLayout() -> UICollectionViewCompositionalLayout {
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(estimatedItemHeight))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)

    let group = NSCollectionLayoutGroup.horizontal(layoutSize: itemSize, subitems: [item])
    group.interItemSpacing = interItemSpacing ?? group.interItemSpacing

    let header: NSCollectionLayoutBoundarySupplementaryItem? = {
      guard let estimatedSectionHeaderHeight = estimatedSectionHeaderHeight else { return nil }
      let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(estimatedSectionHeaderHeight))
      let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
      header.pinToVisibleBounds = pinsHeaderToBoundary
      return header
    }()

    let footer: NSCollectionLayoutBoundarySupplementaryItem? = {
      guard let estimatedSectionFooterHeight = estimatedSectionFooterHeight else { return nil }
      let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(estimatedSectionFooterHeight))
      return NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize, elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
    }()

    let section = NSCollectionLayoutSection(group: group)
    section.boundarySupplementaryItems = [header, footer].compactMap { $0 }
    section.contentInsets = sectionInsets ?? section.contentInsets
    section.interGroupSpacing = interGroupSpacing ?? section.interGroupSpacing

    return UICollectionViewCompositionalLayout(section: section)
  }
}
