import UIKit

class Helper {

}

extension UIView {

  func topAnchor(equal anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>) {
    self.topAnchor.constraint(equalTo: anchor).isActive = true
  }

  func bottomAnchor(equal anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>) {
    self.bottomAnchor.constraint(equalTo: anchor).isActive = true
  }

  func trailingAnchor(equal anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>) {
    self.trailingAnchor.constraint(equalTo: anchor).isActive = true
  }

  func leadingAnchor(equal anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>) {
    self.leadingAnchor.constraint(equalTo: anchor).isActive = true
  }

}
