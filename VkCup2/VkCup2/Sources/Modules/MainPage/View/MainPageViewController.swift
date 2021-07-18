import UIKit

final class MainPageViewController: UIViewController {

    // MARK: - VIPER

    var output: MainPageViewOutput!

    // MARK: - Initializing

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: - UI properties
    
    private lazy var tinderFeedButton: UIButton = {
        let attributedString = NSAttributedString(
            string: Localized.tinderFeedTitle,
            attributes: [
                .font: UIFont.Styles.title,
                .foregroundColor: UIColor.Styles.primary
            ]
        )
        $0.setAttributedTitle(attributedString, for: .normal)
        $0.addTarget(self, action: #selector(didPressTinderFeed), for: .touchUpInside)
        return $0
    }(UIButton())

    // MARK: - Managing the View

    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.Styles.white
        setupView()
        setupConstraints()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Выберите приложение"
        output.setupView()
    }

    // MARK: - Setup

    private func setup() {
        
    }

    private func setupView() {
        [
            tinderFeedButton,
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
    }

    private func setupConstraints() {
        let viewTopAnchor: NSLayoutYAxisAnchor
        let viewBottomAnchor: NSLayoutYAxisAnchor
        if #available(iOS 11, *) {
            viewTopAnchor = view.safeAreaLayoutGuide.topAnchor
            viewBottomAnchor = view.safeAreaLayoutGuide.bottomAnchor
        } else {
            viewTopAnchor = topLayoutGuide.bottomAnchor
            viewBottomAnchor = bottomLayoutGuide.topAnchor
        }
        let constraints = [
            tinderFeedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            tinderFeedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            tinderFeedButton.bottomAnchor.constraint(equalTo: viewBottomAnchor, constant: -32),
            tinderFeedButton.heightAnchor.constraint(equalToConstant: 44),
        ]
        NSLayoutConstraint.activate(constraints)
    }

    // MARK: - Action
    
    @objc
    private func didPressTinderFeed() {
        output.didPressTinderFeed()
    }
}

// MARK: - MainPageViewInput

extension MainPageViewController: MainPageViewInput {}

// MARK: - MainPageTransitionHandler

extension MainPageViewController: MainPageTransitionHandler {}

// MARK: - Localization

private extension MainPageViewController {
    enum Localized {
        // swiftlint:disable line_length
        static let tinderFeedTitle = NSLocalizedString(
            "MainPageViewController.TinderFeedTitle",
            value: "Tinder Feed",
            comment: "Title кнопки игры Tinder Feed"
        )
        // swiftlint:enable line_length
    }
}
