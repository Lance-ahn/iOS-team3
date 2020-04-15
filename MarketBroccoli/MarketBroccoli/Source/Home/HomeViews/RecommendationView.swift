//
//  RecommendationView.swift
//  MarketBroccoli
//
//  Created by Hongdonghyun on 2020/03/20.
//  Copyright © 2020 Team3. All rights reserved.
//

import UIKit
import Then
import SnapKit

// MARK: - 컬리추천
class RecommendationView: UITableView {
  private var offsetArray: [Int: CGFloat] = [:]
  private var homeImageModel: HomeImages? {
    didSet {
      self.reloadSections(IndexSet(integer: 0), with: .none)
    }
  }
  private var recommendModel: HomeItems? {
    didSet {
      self.reloadSections(IndexSet(integer: 1), with: .none)
    }
  }
  private var discountModel: HomeItems? {
    didSet {
      self.reloadSections(IndexSet(integer: 3), with: .none)
    }
  }
  private var MDModel: MDItems? {
    didSet {
      self.reloadSections(IndexSet(integer: 4), with: .none)
    }
  }
  private var newModel: HomeItems? {
    didSet {
      self.reloadSections(IndexSet(integer: 5), with: .none)
    }
  }
  private var bestModel: HomeItems? {
    didSet {
      self.reloadSections(IndexSet(integer: 6), with: .none)
    }
  }
  
  override init(frame: CGRect, style: UITableView.Style) {
    super.init(frame: frame, style: style)
    setupAttr()
    dataRequest()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - ACTIONS
extension RecommendationView {
  private func dataRequest() {
    DispatchQueue.global().async { [weak self] in
      guard let self = self else { return }
      [RequestHome.recommendation, RequestHome.new, RequestHome.best, RequestHome.discount].forEach { endPoint in
        RequestManager.shared.homeRequest(url: endPoint, method: .get, count: 8) { res in
          switch res {
          case .success(let data):
            switch endPoint {
            case .recommendation: self.recommendModel = data
            case .new: self.newModel = data
            case .best: self.bestModel = data
            case .discount: self.discountModel = data
            default:
              print("Error")
            }
          
          case .failure(let error):
            print("error :", error.localizedDescription)
          }
        }
      }
    }
    RequestManager.shared.MDRequest {
      switch $0 {
      case .success(let data):
        self.MDModel = data
      case .failure(let error):
        print("error :", error.localizedDescription)
      }
    }
    RequestManager.shared.homeImageRequest {
      switch $0 {
      case .success(let data):
        self.homeImageModel = data
      case .failure(let error):
        print("error :", error.localizedDescription)
      }
    }
  }
}

// MARK: - UI
extension RecommendationView {
  private func setupAttr() {
    self.separatorStyle = .none
    self.dataSource = self
    self.delegate = self
    self.allowsSelection = false
    self.register(cell: HomeBannerTableCell.self)
    self.register(cell: HomeOfferTableCell.self)
    self.register(cell: HomeEventTableCell.self)
    self.register(cell: HomeMDTableCell.self)
  }
}

// MARK: - Delegate
extension RecommendationView: UITableViewDelegate {
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    guard let tableViewCell = cell as? HomeOfferTableCell else { return }
    tableViewCell.offset = offsetArray[indexPath.section] ?? 0
  }
  func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    guard let tableViewCell = cell as? HomeOfferTableCell else { return }
    offsetArray[indexPath.section] = tableViewCell.offset
  }
}

// MARK: - DataSource
extension RecommendationView: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int { 8 }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 1 }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.section {
    case 0:
      guard let model = homeImageModel else { return UITableViewCell() }
      let cell = tableView.dequeue(HomeBannerTableCell.self)
      cell.configure(items: model)
      return cell
    case 1:
      guard let model = recommendModel else { return UITableViewCell() }
      let cell = tableView.dequeue(HomeOfferTableCell.self)
      cell.configure(cellTitle: "이 상품 어때요?", items: model)
      return cell
    case 2:
      return tableView.dequeue(HomeEventTableCell.self)
    case 3:
      guard let model = discountModel else { return UITableViewCell() }
      let cell = tableView.dequeue(HomeOfferTableCell.self)
      cell.configure(cellTitle: "알뜰 상품 >", items: model)
      return cell
    case 4:
      guard let model = MDModel else { return UITableViewCell() }
      let cell = tableView.dequeue(HomeMDTableCell.self)
      cell.configure(items: model.flatMap { $0 })
      return cell
    case 5:
      guard let model = newModel else { return UITableViewCell() }
      let cell = tableView.dequeue(HomeOfferTableCell.self)
      cell.configure(cellTitle: "오늘의 신상품 >", subtitle: "매일 정오, 컬리의 새로운 상품을 만나보세요", items: model)
      return cell
    case 6:
      guard let model = bestModel else { return UITableViewCell() }
      let cell = tableView.dequeue(HomeOfferTableCell.self)
      cell.configure(cellTitle: "지금 가장 핫한 상품 >", items: model)
      cell.backgroundColor = .kurlyGray3
      return cell
    case 7:
      let cell = tableView.dequeue(HomeOfferTableCell.self)
      cell.configure(cellTitle: "컬리의 레시피 >", items: nil)
      return cell
    default:
      return UITableViewCell()
    }
  }
}
