import Flutter
import UIKit

class NativeViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return NativeView(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args,
            binaryMessenger: messenger
        )
    }

    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
}

class NativeView: NSObject, FlutterPlatformView {
    private var _view: UIView

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        _view = UIView()
        super.init()

        let params = args as? [String: Any]
        let padding = params?["padding"] as? CGFloat ?? 16
        let itemSpacing = params?["itemSpacing"] as? CGFloat ?? 12

        createNativeView(view: _view, padding: padding, itemSpacing: itemSpacing)
    }

    func view() -> UIView {
        return _view
    }

    private func createNativeView(view: UIView, padding: CGFloat, itemSpacing: CGFloat) {
        view.backgroundColor = .white

        let label = UILabel()
        label.text = "iOS Native Label"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false

        let button = PrimaryButton(type: .system)
        button.setTitle("iOS Native Button", for: .normal)
        button.addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        let stack = UIStackView(arrangedSubviews: [label, button])
        stack.axis = .vertical
        stack.spacing = itemSpacing
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
        ])
    }

    @objc private func onButtonTapped() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootVC = windowScene.windows.first?.rootViewController else { return }

        let alert = UIAlertController(
            title: nil,
            message: "Native button clicked!",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        rootVC.present(alert, animated: true)
    }
}
