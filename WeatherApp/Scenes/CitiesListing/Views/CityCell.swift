import Foundation
import UIKit

class CityCell: UITableViewCell {
    
    let cityNameLabel = UILabel()
    static let identifier = "CityCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        setupLayer()
        setupCityNameLabel()
    }
    
    private func setupCityNameLabel() {
        contentView.addSubview(cityNameLabel)
        cityNameLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.top.leading.greaterThanOrEqualToSuperview()
            make.bottom.trailing.lessThanOrEqualToSuperview()
        }
        
        cityNameLabel.textColor = .white
        cityNameLabel.textAlignment = .center
    }
    
    private func setupLayer() {
        backgroundColor = UIColor.white.withAlphaComponent(0.2)
        layer.cornerRadius = 8
        selectionStyle = .none
    }
}
