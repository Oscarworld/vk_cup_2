import UIKit

enum MainPageAssembly {
    static func makeModule() -> UIViewController {
        let view = MainPageViewController()
        let presenter = MainPagePresenter()
        let router = MainPageRouter()

        view.output = presenter

        presenter.view = view
        presenter.router = router

        router.transitionHandler = view

        return view
    }
}
