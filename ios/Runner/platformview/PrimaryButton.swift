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
        backgroundColor = UIColor(named: "AppPrimary")
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 8
        contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
    }
}