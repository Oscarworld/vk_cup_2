import UIKit

/// MainPage view input
protocol MainPageViewInput: AnyObject {

}

/// MainPage view output
protocol MainPageViewOutput: AnyObject {
    func setupView()
    func didPressTinderFeed()
}
