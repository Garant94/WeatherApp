import Foundation
import UIKit

class CityCell: UITableViewCell {
    
    let cityNameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        setupCityNameLabel()
    }
    
    private func setupCityNameLabel() {
        contentView.addSubview(cityNameLabel)
        cityNameLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
