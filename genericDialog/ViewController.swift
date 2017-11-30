import UIKit

class ViewController: UIViewController {
  @IBAction func buttonAction(_ sender: Any) {
    self.view.addSubview(Dialog(frame: .zero))
  }
}

class Dialog: UIView {

  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    configureBackground()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func updateConstraints() {
    super.updateConstraints()
    var constraints = [NSLayoutConstraint]()
    constraints.append(self.topAnchor.constraint(equalTo: superview!.topAnchor))
    constraints.append(self.trailingAnchor.constraint(equalTo: superview!.trailingAnchor))
    constraints.append(self.leadingAnchor.constraint(equalTo: superview!.leadingAnchor))
    constraints.append(self.bottomAnchor.constraint(equalTo: superview!.bottomAnchor))
    NSLayoutConstraint.activate(constraints)
  }

  func configureBackground() {
    backgroundColor = UIColor.black
    alpha = 0.5
    let dismissGesture = UITapGestureRecognizer(target: self, action:  #selector(dismissAction))
    self.addGestureRecognizer(dismissGesture)
  }

  func dismissAction(sender: UITapGestureRecognizer) {
    UIView.animate(withDuration: 0.3, animations: {
      self.alpha = 0
    }) { (hasFinished) in
      if hasFinished {
        self.removeFromSuperview()
      }
    }
  }

}
