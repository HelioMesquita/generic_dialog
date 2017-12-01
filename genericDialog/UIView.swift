import UIKit

extension UIView {

  func topAnchor(equal anchorView: UIView, constant: CGFloat = 0) {
    self.topAnchor.constraint(equalTo: anchorView.topAnchor, constant: constant).isActive = true
  }

  func bottomAnchor(equal anchorView: UIView, constant: CGFloat = 0) {
    self.bottomAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: constant).isActive = true
  }

  func leadingAnchor(equal anchorView: UIView, constant: CGFloat = 0) {
    self.leadingAnchor.constraint(equalTo: anchorView.leadingAnchor, constant: constant).isActive = true
  }

  func trailingAnchor(equal anchorView: UIView, constant: CGFloat = 0) {
    self.trailingAnchor.constraint(equalTo: anchorView.trailingAnchor, constant: constant).isActive = true
  }

  func centerXAnchor(equal anchorView: UIView, constant: CGFloat = 0) {
    self.centerXAnchor.constraint(equalTo: anchorView.centerXAnchor, constant: constant).isActive = true
  }

  func centerYAnchor(equal anchorView: UIView, constant: CGFloat = 0) {
    self.centerYAnchor.constraint(equalTo: anchorView.centerYAnchor, constant: constant).isActive = true
  }

  func heightAnchor(greater height: CGFloat) {
    self.heightAnchor.constraint(greaterThanOrEqualToConstant: height)
  }
}
