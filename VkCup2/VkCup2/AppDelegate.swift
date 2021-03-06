import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        setupAppearance()
        setupWindow()
        return true
    }
    
    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        VKSdk.processOpen(
            url,
            fromApplication: UIApplication.OpenURLOptionsKey.sourceApplication.rawValue
        )
        return true
    }
    
    private func setupAppearance() {
        UITabBarItem.appearance().setTitleTextAttributes(
            [
                NSAttributedString.Key.font: UIFont.Styles.subtitle,
                NSAttributedString.Key.foregroundColor: UIColor.Styles.gray,
            ],
            for: .normal
        )
        UITabBarItem.appearance().setTitleTextAttributes(
            [
                NSAttributedString.Key.font: UIFont.Styles.subtitle,
                NSAttributedString.Key.foregroundColor: UIColor.Styles.primary,
            ],
            for: .selected
        )
        UITabBar.appearance().barTintColor = UIColor.Styles.white
        UITabBar.appearance().tintColor = UIColor.Styles.primary

        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.Styles.title2,
        ]
    }
    
    private func setupWindow() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = AuthorizeAssembly.makeModule()
        window.rootViewController = viewController
        self.window = window
        window.makeKeyAndVisible()
    }
}

