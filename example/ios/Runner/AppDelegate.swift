import UIKit
import Flutter
import AdBrixRM

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        // AdBrixRM 인스턴스 생성
        let adBrix = AdBrixRM.getInstance

        // 딥링크 오픈 트래킹 코드 호출
        adBrix.deepLinkOpen(url: url)

        return false
    }
}
