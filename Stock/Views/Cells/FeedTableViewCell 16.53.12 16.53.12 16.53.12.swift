//
//  FeedTableViewCell.swift
//  Mobiroller
//
//  Created by Amber ÇATALBAŞ on 29.05.2021.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
  
  static let identifier = "CustomTableViewCell"
  
  private let nameLabel: UILabel = {
    
    let label = UILabel()
    label.textColor = .white
    label.font = .systemFont(ofSize: 18, weight: .bold)
    
    return label
  }()
  
  private let priceLabel: UILabel = {
    
    let label = UILabel()
    label.textColor = .white
    label.font = .systemFont(ofSize: 20, weight: .bold)
    
    return label
  }()
  
  
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.backgroundColor = .orange
    contentView.addSubview(nameLabel)
    contentView.addSubview(priceLabel)
    
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public func configure(nameText: String, priceText: String) {
    nameLabel.text = nameText
    priceLabel.text = "\(Double(priceText) ?? 0) ₺"
    
    
    
  }
  
  override func prepareForReuse() {
    nameLabel.text = nil
    priceLabel.text = nil
    
    
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    
    
    
    nameLabel.frame = CGRect(
      x:20,
      y: 0,
      width: contentView.frame.size.width-40,
      height: contentView.frame.size.height/2-5)
    priceLabel.frame = CGRect(
      x: 20,
      y: nameLabel.bottom + 5,
      width: contentView.frame.size.width-40,
      height: contentView.frame.size.height/2-5)
    
    
  }
}


