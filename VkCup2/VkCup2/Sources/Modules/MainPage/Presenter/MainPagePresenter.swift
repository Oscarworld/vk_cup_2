final class MainPagePresenter {

    // MARK: - VIPER

    var router: MainPageRouterInput!

    weak var view: MainPageViewInput?
}

// MARK: - MainPageViewOutput

extension MainPagePresenter: MainPageViewOutput {
    func setupView() {

    }
    
    func didPressTinderFeed() {
        router.openTinderFeed()
    }
}

// MARK: - Localized

private extension MainPagePresenter {
    enum Localized {}
}
