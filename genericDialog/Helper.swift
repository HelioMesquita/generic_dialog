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

  func trailingAnchor(equal anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat) {
    self.trailingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
  }

  func leadingAnchor(equal anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>) {
    self.leadingAnchor.constraint(equalTo: anchor).isActive = true
  }

  func leadingAnchor(equal anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat) {
    self.leadingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
  }

  func horizontalCenter(equal anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>) {
    self.centerXAnchor.constraint(equalTo: anchor).isActive = true
  }

  func verticalCenter(equal anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>) {
    self.centerYAnchor.constraint(equalTo: anchor).isActive = true
  }

  func heightAnchor(greater height: CGFloat) {
    self.heightAnchor.constraint(greaterThanOrEqualToConstant: height)
  }

}
