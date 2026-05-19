import Flutter
import SwiftUI
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    let controller = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(
      name: "com.js.movie_peek/native",
      binaryMessenger: controller.binaryMessenger
    )
    channel.setMethodCallHandler { [weak controller] call, result in
      guard call.method == "openNativeMovieScreen" else {
        result(FlutterMethodNotImplemented)
        return
      }
      let args = call.arguments as? [String: Any]
      let title = args?["title"] as? String ?? ""
      let posterUrl = args?["posterUrl"] as? String ?? ""
      let rating = args?["rating"] as? Double ?? 0.0

      let vc = NativeMovieViewController(title: title, posterUrl: posterUrl, rating: rating)
      controller?.present(vc, animated: true)
      result(nil)
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}