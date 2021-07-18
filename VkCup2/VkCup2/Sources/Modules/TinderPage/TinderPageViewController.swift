import UIKit

final class TinderPageViewController: UIViewController {
    
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

    // MARK: - Managing the View

    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.Styles.white
        setupView()
        setupConstraints()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Новости"
    }

    // MARK: - Setup

    private func setup() {
        
    }

    private func setupView() {
//        [
//            tinderFeedButton,
//        ].forEach {
//            $0.translatesAutoresizingMaskIntoConstraints = false
//            view.addSubview($0)
//        }
    }

    private func setupConstraints() {
//        let viewTopAnchor: NSLayoutYAxisAnchor
//        let viewBottomAnchor: NSLayoutYAxisAnchor
//        if #available(iOS 11, *) {
//            viewTopAnchor = view.safeAreaLayoutGuide.topAnchor
//            viewBottomAnchor = view.safeAreaLayoutGuide.bottomAnchor
//        } else {
//            viewTopAnchor = topLayoutGuide.bottomAnchor
//            viewBottomAnchor = bottomLayoutGuide.topAnchor
//        }
//        let constraints = [
//            tinderFeedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
//            tinderFeedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
//            tinderFeedButton.bottomAnchor.constraint(equalTo: viewBottomAnchor, constant: -32),
//            tinderFeedButton.heightAnchor.constraint(equalToConstant: 44),
//        ]
//        NSLayoutConstraint.activate(constraints)
    }
}
