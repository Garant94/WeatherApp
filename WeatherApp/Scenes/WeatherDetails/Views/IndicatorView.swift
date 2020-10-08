import Foundation
import UIKit
import SnapKit

class IndicatorView: UIView {
    
    private let stackView = UIStackView()
    private let imageView = UIImageView()

    let textLabel = UILabel()
    
    init(image: UIImage?) {
        super.init(frame: .zero)
        imageView.image = image
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        setupImageView()
        setupTextLabel()
        setupStackView()
    }
    
    private func setupImageView() {
        imageView.snp.makeConstraints { make in
            make.height.width.equalTo(24)
        }
    }

    private func setupTextLabel() {
        textLabel.textColor = .white
    }
    
    private func setupStackView() {
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        stackView.axis = .horizontal
        stackView.spacing = 8
        [imageView, textLabel].forEach { stackView.addArrangedSubview($0) }
    }
}
