import UIKit

class PrimaryButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        applyStyle()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        applyStyle()
    }

    private func applyStyle() {
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = UIColor(named: "AppPrimary")
        config.baseForegroundColor = .white
        config.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16)
        config.background.cornerRadius = 8
        configuration = config
    }
}