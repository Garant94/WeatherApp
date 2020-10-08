import Foundation
import UIKit

class BackgroundGradientView: UIView {
    
    private let gradientLayer = CAGradientLayer()
    
    init() {
        super.init(frame: .zero)
        setupGradient()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds

    }
    
    private func setupGradient() {
        let firstColor: UIColor = UIColor(named: "color_gradient_1") ?? .white
        let secondColor: UIColor = UIColor(named: "color_gradient_2") ?? .white
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        gradientLayer.locations = [0.5, 1]
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
