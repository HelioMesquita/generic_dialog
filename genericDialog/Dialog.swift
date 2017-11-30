import UIKit

class Dialog: UIView {

  var filledButton: UIButton!
  var containerView: UIView!
  var titleLabel: UILabel!
  var descriptionLabel: UILabel!
  var imageView: UIImageView!
  var backgroundView: UIView!

  init() {
    super.init(frame: .zero)
    translatesAutoresizingMaskIntoConstraints = false
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func create(image: UIImage, title: String, description: String, buttonTitle: String) {
    insertBackgroundView()
    insertContainer()
    insertImageView(image)
    insertTitle(title)
    insertDescription(description)
    insertFilledButton(buttonTitle)
  }

  func addButton(title: String) {
    insertBorderedButton(title)
  }

  override func updateConstraints() {
    super.updateConstraints()
    self.topAnchor(equal: superview!.topAnchor)
    self.bottomAnchor(equal: superview!.bottomAnchor)
    self.trailingAnchor(equal: superview!.trailingAnchor)
    self.leadingAnchor(equal: superview!.leadingAnchor)
  }

  private func insertBackgroundView() {
    backgroundView = UIView(frame: .zero)
    backgroundView.backgroundColor = UIColor.black
    let dismissGesture = UITapGestureRecognizer(target: self, action:  #selector(dismissAction))
    backgroundView.addGestureRecognizer(dismissGesture)
    self.addSubview(backgroundView)
    backgroundView.translatesAutoresizingMaskIntoConstraints = false
    backgroundView.topAnchor(equal: self.topAnchor)
    backgroundView.bottomAnchor(equal: self.bottomAnchor)
    backgroundView.trailingAnchor(equal: self.trailingAnchor)
    backgroundView.leadingAnchor(equal: self.leadingAnchor)
  }

  private func insertContainer() {
    containerView = UIView(frame: .zero)
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

  func insertImageView(_ image: UIImage) {
    imageView = UIImageView(frame: .zero)
    imageView.contentMode = .scaleAspectFit
    imageView.image = image
    containerView.addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    var constraints = [NSLayoutConstraint]()
    constraints.append(imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 36))
    constraints.append(imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor))
    constraints.append(imageView.heightAnchor.constraint(equalToConstant: 100))
    NSLayoutConstraint.activate(constraints)
  }

  func insertTitle(_ title: String) {
    titleLabel = UILabel(frame: .zero)
    titleLabel.text = title
    titleLabel.textColor = UIColor.black
    titleLabel.textAlignment = .center
    titleLabel.numberOfLines = 2
    containerView.addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    var constraints = [NSLayoutConstraint]()
    constraints.append(titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24))
    constraints.append(titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor))
    constraints.append(titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16))
    constraints.append(titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16))
    NSLayoutConstraint.activate(constraints)
  }

  func insertDescription(_ description: String) {
    descriptionLabel = UILabel(frame: .zero)
    descriptionLabel.text = description
    descriptionLabel.textColor = UIColor.black
    descriptionLabel.numberOfLines = 0
    descriptionLabel.textAlignment = .center
    containerView.addSubview(descriptionLabel)
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    var constraints = [NSLayoutConstraint]()
    constraints.append(descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16))
    constraints.append(descriptionLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor))
    constraints.append(descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16))
    constraints.append(descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16))
    NSLayoutConstraint.activate(constraints)
  }

  func insertFilledButton(_ title: String) {
    filledButton = UIButton(frame: .zero)
    filledButton.setTitle(title, for: .normal)
    filledButton.setTitleColor(UIColor.white, for: .normal)
    filledButton.backgroundColor = UIColor.blue
    filledButton.accessibilityIdentifier = "firstButton"
    filledButton.layer.cornerRadius = 4
    filledButton.translatesAutoresizingMaskIntoConstraints = false
    containerView.addSubview(filledButton)
    var constraints = [NSLayoutConstraint]()
    let buttonTop = filledButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24)
    buttonTop.identifier = "buttonTop"
    constraints.append(buttonTop)
    let containerBottom = containerView.bottomAnchor.constraint(equalTo: filledButton.bottomAnchor, constant: 20)
    constraints.append(containerBottom)
    constraints.append(filledButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16))
    constraints.append(filledButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16))
    NSLayoutConstraint.activate(constraints)
  }

  func insertBorderedButton(_ title: String) {
    let borderedButton = UIButton(frame: .zero)
    borderedButton.translatesAutoresizingMaskIntoConstraints = false
    borderedButton.setTitle(title, for: .normal)
    borderedButton.setTitleColor(UIColor.blue, for: .normal)
    borderedButton.accessibilityIdentifier = "secondButton"
    borderedButton.layer.borderWidth = 1
    borderedButton.layer.cornerRadius = 4
    containerView.addSubview(borderedButton)
    var constraints = [NSLayoutConstraint]()
    let buttonTop = containerView.constraints.first(where: { constraint in
      return constraint.identifier == "buttonTop"
    })
    NSLayoutConstraint.deactivate([buttonTop!])
    constraints.append(borderedButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24))
    constraints.append(borderedButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16))
    constraints.append(borderedButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16))
    constraints.append(filledButton.topAnchor.constraint(equalTo: borderedButton.bottomAnchor, constant: 24))
    NSLayoutConstraint.activate(constraints)
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
