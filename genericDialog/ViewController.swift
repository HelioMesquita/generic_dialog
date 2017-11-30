import UIKit

class ViewController: UIViewController {
  @IBAction func buttonAction(_ sender: Any) {
    let dialog = Dialog(frame: .zero)
    self.view.addSubview(dialog)
    dialog.setView()
  }
}

class Dialog: UIView {

  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
  }

  func setView() {
    insertBackgroundView()
    insertContainer()
    insertImageView()
    insertTitle()
    insertDescription()
    insertButton()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func updateConstraints() {
    super.updateConstraints()
    var constraints = [NSLayoutConstraint]()
    constraints.append(self.topAnchor.constraint(equalTo: superview!.topAnchor))
    constraints.append(self.leadingAnchor.constraint(equalTo: superview!.leadingAnchor))
    constraints.append(self.trailingAnchor.constraint(equalTo: superview!.trailingAnchor))
    constraints.append(self.bottomAnchor.constraint(equalTo: superview!.bottomAnchor))
    NSLayoutConstraint.activate(constraints)
  }

  private func insertBackgroundView() {
    let backgroundView = UIView(frame: .zero)
    backgroundView.backgroundColor = UIColor.black
    let dismissGesture = UITapGestureRecognizer(target: self, action:  #selector(dismissAction))
    backgroundView.addGestureRecognizer(dismissGesture)
    self.addSubview(backgroundView)
    backgroundView.translatesAutoresizingMaskIntoConstraints = false
    var constraints = [NSLayoutConstraint]()
    constraints.append(backgroundView.topAnchor.constraint(equalTo: self.topAnchor))
    constraints.append(backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor))
    constraints.append(backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor))
    constraints.append(backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor))
    NSLayoutConstraint.activate(constraints)
  }

  private func insertContainer() {
    let containerView = UIView(frame: .zero)
    containerView.backgroundColor = UIColor.white
    containerView.accessibilityIdentifier = "containerView"
    containerView.layer.cornerRadius = 6
    self.addSubview(containerView)
    containerView.translatesAutoresizingMaskIntoConstraints = false
    var constraints = [NSLayoutConstraint]()
    constraints.append(containerView.centerXAnchor.constraint(equalTo: self.centerXAnchor))
    constraints.append(containerView.centerYAnchor.constraint(equalTo: self.centerYAnchor))
    constraints.append(containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 150))
    constraints.append(containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16))
    constraints.append(containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16))
    NSLayoutConstraint.activate(constraints)
  }

  func insertImageView() {
    let imageView = UIImageView(frame: .zero)
    imageView.contentMode = .scaleAspectFit
    imageView.accessibilityIdentifier = "imageView"
    imageView.image = #imageLiteral(resourceName: "iconHeader")
    let containerView = getContainerView()
    containerView.addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    var constraints = [NSLayoutConstraint]()
    constraints.append(imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20))
    constraints.append(imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor))
    constraints.append(imageView.heightAnchor.constraint(equalToConstant: 100))
    NSLayoutConstraint.activate(constraints)
  }
  
  func insertTitle() {
    let label = UILabel(frame: .zero)
    label.text = "TESTANDO"
    label.textColor = UIColor.black
    label.textAlignment = .center
    label.accessibilityIdentifier = "titleLabel"
    label.numberOfLines = 2
    let containerView = getContainerView()
    containerView.addSubview(label)
    label.translatesAutoresizingMaskIntoConstraints = false
    var constraints = [NSLayoutConstraint]()
    if let image = getImage() {
      constraints.append(label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20))
    } else {
      constraints.append(label.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20))
    }
    constraints.append(label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor))
    constraints.append(label.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16))
    constraints.append(label.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16))
    NSLayoutConstraint.activate(constraints)
  }

  func insertDescription() {
    let description = UILabel(frame: .zero)
    description.text = "TESTANDO DESCRIPTIONTEST"
    description.textColor = UIColor.black
    description.numberOfLines = 0
    description.textAlignment = .center
    description.accessibilityIdentifier = "descriptionLabel"
    let containerView = getContainerView()
    containerView.addSubview(description)
    description.translatesAutoresizingMaskIntoConstraints = false
    var constraints = [NSLayoutConstraint]()
    if let title = getTitle() {
      constraints.append(description.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10))
    } else {
      constraints.append(description.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20))
    }
    constraints.append(description.centerXAnchor.constraint(equalTo: containerView.centerXAnchor))
    constraints.append(description.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16))
    constraints.append(description.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16))
    NSLayoutConstraint.activate(constraints)
  }

  func insertButton() {
    let button = UIButton(frame: .zero)
    button.setTitle("Butao", for: .normal)
    button.setTitleColor(UIColor.black, for: .normal)
    button.accessibilityIdentifier = "button"
    let containerView = getContainerView()
    containerView.addSubview(button)
    button.translatesAutoresizingMaskIntoConstraints = false
    var constraints = [NSLayoutConstraint]()
    if let description = getDescription() {
      constraints.append(button.topAnchor.constraint(equalTo: description.bottomAnchor, constant: 10))
    } else {
      constraints.append(button.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20))
    }
    constraints.append(containerView.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: 20))
    constraints.append(button.centerXAnchor.constraint(equalTo: containerView.centerXAnchor))
    constraints.append(button.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16))
    NSLayoutConstraint.activate(constraints)
    containerView.layoutIfNeeded()
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

  private func getContainerView() -> UIView {
    let containerView = self.subviews.first { (view) -> Bool in
      return view.accessibilityIdentifier == "containerView"
    }
    return containerView!
  }

  private func getImage() -> UIView? {
    let image = getContainerView().subviews.first { (view) -> Bool in
      return view.accessibilityIdentifier == "imageView"
    }
    return image
  }

  private func getTitle() -> UIView? {
    let title = getContainerView().subviews.first { (view) -> Bool in
      return view.accessibilityIdentifier == "titleLabel"
    }
    return title
  }

  private func getDescription() -> UIView? {
    let description = getContainerView().subviews.first { (view) -> Bool in
      return view.accessibilityIdentifier == "descriptionLabel"
    }
    return description
  }
}
