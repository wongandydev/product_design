import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)

        // TODO: Uncomment and use your initial view controller
        // Option 1: Use RecipeListViewController (UIKit)
        // let viewController = RecipeListViewController()
        // window.rootViewController = UINavigationController(rootViewController: viewController)

        // Option 2: Use SwiftUI
         let contentView = RecipeListView()
         window.rootViewController = UIHostingController(rootView: contentView)

        // Placeholder for now - replace with your view controller
//        let placeholderVC = UIViewController()
//        placeholderVC.view.backgroundColor = .systemBackground
//        window.rootViewController = placeholderVC

        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
    }
}
