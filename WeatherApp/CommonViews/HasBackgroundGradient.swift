import Foundation
import UIKit
import SnapKit

protocol HasBackgroundGradient {
    func setupBackground()
}
extension HasBackgroundGradient where Self: UIViewController {
    func setupBackground() {
        let backgroundView = BackgroundGradientView()
        view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
