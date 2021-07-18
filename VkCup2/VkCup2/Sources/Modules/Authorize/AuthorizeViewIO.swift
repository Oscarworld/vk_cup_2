import UIKit

/// Authorize view input
protocol AuthorizeViewInput: AnyObject {
    func showActivity()
    
    func hideActivity()
}

/// Authorize view output
protocol AuthorizeViewOutput: AnyObject {
    func setupView()
    
    func viewDidAppear()
    
    func didPressAuthorize()
    
    func showCaptchaEnter(
        _ captchaError: VKError!,
        in viewController: UIViewController
    )
}
