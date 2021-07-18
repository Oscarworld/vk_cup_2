import UIKit

/// Authorize router input
protocol AuthorizeRouterInput: AnyObject {
    func showAlert(
        title: String?,
        message: String?
    )
    
    func openMainPage()
    
    func openVKSDK(viewController: UIViewController)
    
    func operCaptchaEnter(_ captchaError: VKError!)
}
