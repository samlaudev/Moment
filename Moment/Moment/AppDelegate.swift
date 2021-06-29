//
//  AppDelegate.swift
//  Moment
//
//  Created by Sam Lau on 2021/4/15.
//

import UIKit
import Firebase

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        onLaunch()
        return true
    }

    // MARK: Handle Universal Links
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        guard userActivity.activityType == NSUserActivityTypeBrowsingWeb,
              let webPageURL = userActivity.webpageURL else {
            return false
        }

        AppRouter.share.route(to: webPageURL, from: nil, using: .present)
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

private extension AppDelegate {
    func onLaunch() {
        FirebaseApp.configure()

        // Register routing here
        AppRouter.share.register(path: UniversalLinks.internalMenu.rawValue, navigator: InternalMenuNavigator())
        AppRouter.share.register(path: UniversalLinks.designKitDemo.rawValue, navigator: DesignKitDemoNavigator())
    }
}

extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        let togglesDataStoreType: TogglesDataStoreType = BuildTargetDataStore.shared
        if togglesDataStoreType.isToggleOn(BuildTargetToggle.debug) ||
            togglesDataStoreType.isToggleOn(BuildTargetToggle.internal) ||
            motion == .motionShake {
            AppRouter.share.route(to: UniversalLinks.internalMenu.url, from: rootViewController, using: .present)
        }
    }
}
