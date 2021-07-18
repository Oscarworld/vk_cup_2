import UIKit

protocol MainPageTransitionHandler: UIViewController {}

final class MainPageRouter {
    weak var transitionHandler: MainPageTransitionHandler?
}

// MARK: - MainPageRouterInput

extension MainPageRouter: MainPageRouterInput {
    func openTinderFeed() {
        let vc = TinderPageViewController()
        transitionHandler?.navigationController?.pushViewController(vc, animated: true)
    }
}
