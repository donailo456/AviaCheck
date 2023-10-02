//
//  CustomTableCell.swift
//  Aviaseils
//
//  Created by Danil Komarov on 30.07.2023.
//

import UIKit

class CustomTableCell: UITableViewCell {
    
    static let identifaire = "Cell"

    private let originLable: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    private let destinationLable: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    private let returnLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15, weight: .ultraLight)
        return label
    }()
    private let subtitleLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13, weight: .light)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(originLable)
        contentView.addSubview(destinationLable)
        contentView.addSubview(returnLabel)
        contentView.addSubview(subtitleLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        originLable.frame = CGRect(x: contentView.bounds.minX + 10, y: contentView.bounds.minY, width: contentView.frame.size.width - 170, height: 70)
        destinationLable.frame = CGRect(x: contentView.bounds.maxX - 50, y: contentView.bounds.minY, width: contentView.frame.size.width - 170, height: 70)
        returnLabel.frame = CGRect(x: contentView.frame.midX - 45, y: contentView.bounds.minY, width: 95, height: 70)
        subtitleLabel.frame = CGRect(x: contentView.frame.midX - 45 , y: 50, width: 95, height: contentView.frame.size.height/2)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        originLable.text = "0"
        destinationLable.text = "0"
        returnLabel.text = "0"
        subtitleLabel.text = "0"
    }
    
    func configure(with viewModel: Datum ){
        originLable.text = viewModel.origin
        destinationLable.text = viewModel.destination
        if(viewModel.return_transfers == 0 ){
            returnLabel.text = "Прямой"
        }
        else if(viewModel.return_transfers > 0){
            returnLabel.text = "Пересадок: \(viewModel.return_transfers)"
        }
        subtitleLabel.text = "\(viewModel.price) РУБ"
    }

}
