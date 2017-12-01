import UIKit

class Dialog: UIView {

  var filledButton: UIButton!
  var borderedButton: UIButton!
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
    topAnchor(equal: superview!)
    bottomAnchor(equal: superview!)
    trailingAnchor(equal: superview!)
    leadingAnchor(equal: superview!)
  }

  private func insertBackgroundView() {
    backgroundView = UIView(frame: .zero)
    backgroundView.backgroundColor = UIColor(displayP3Red: 83/255, green: 110/255, blue: 123/255, alpha: 0.6)
    let dismissGesture = UITapGestureRecognizer(target: self, action:  #selector(dismissAction))
    backgroundView.addGestureRecognizer(dismissGesture)
    addSubview(backgroundView)
    backgroundView.translatesAutoresizingMaskIntoConstraints = false
    backgroundView.topAnchor(equal: self)
    backgroundView.bottomAnchor(equal: self)
    backgroundView.leadingAnchor(equal: self)
    backgroundView.trailingAnchor(equal: self)
  }

  private func insertContainer() {
    containerView = UIView(frame: .zero)
    containerView.backgroundColor = UIColor.white
    containerView.layer.cornerRadius = 6
    containerView.layer.shadowColor = UIColor.black.cgColor
    containerView.layer.shadowOffset = CGSize(width: 0, height: 24)
    containerView.layer.shadowOpacity = 0.36
    containerView.layer.shadowRadius = 24.0
    containerView.layer.masksToBounds =  false
    addSubview(containerView)
    containerView.translatesAutoresizingMaskIntoConstraints = false
    containerView.centerYAnchor(equal: self)
    containerView.centerXAnchor(equal: self)
    containerView.heightAnchor(greater: 150)
    containerView.trailingAnchor(equal: self, constant: -16)
    containerView.leadingAnchor(equal: self, constant: 16)
  }

  func insertImageView(_ image: UIImage) {
    imageView = UIImageView(frame: .zero)
    imageView.contentMode = .scaleAspectFit
    imageView.image = image
    containerView.addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.topAnchor(equal: containerView, constant: 36)
    imageView.centerXAnchor(equal: containerView)
    imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
  }

  func insertTitle(_ title: String) {
    titleLabel = UILabel(frame: .zero)
    titleLabel.text = title
    titleLabel.textColor = UIColor.black
    titleLabel.textAlignment = .center
    titleLabel.numberOfLines = 2
    containerView.addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.centerXAnchor(equal: imageView)
    titleLabel.leadingAnchor(equal: containerView, constant: 16)
    titleLabel.trailingAnchor(equal: containerView, constant: -16)
    titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24).isActive = true
  }

  func insertDescription(_ description: String) {
    descriptionLabel = UILabel(frame: .zero)
    descriptionLabel.text = description
    descriptionLabel.textColor = UIColor.black
    descriptionLabel.numberOfLines = 0
    descriptionLabel.textAlignment = .center
    containerView.addSubview(descriptionLabel)
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    descriptionLabel.centerXAnchor(equal: imageView)
    descriptionLabel.leadingAnchor(equal: containerView, constant: 16)
    descriptionLabel.trailingAnchor(equal: containerView, constant: -16)
    descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
  }

  func insertFilledButton(_ title: String) {
    filledButton = UIButton(frame: .zero)
    filledButton.setTitle(title, for: .normal)
    filledButton.setTitleColor(UIColor.white, for: .normal)
    filledButton.backgroundColor = UIColor.blue
    filledButton.layer.cornerRadius = 4
    containerView.addSubview(filledButton)
    filledButton.translatesAutoresizingMaskIntoConstraints = false
    containerView.bottomAnchor(equal: filledButton, constant: 20)
    filledButton.leadingAnchor(equal: containerView, constant: 16)
    filledButton.trailingAnchor(equal: containerView, constant: -16)
    containerView.bottomAnchor.constraint(equalTo: filledButton.bottomAnchor, constant: 20).isActive = true
    let buttonTopAnchor = filledButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24)
    buttonTopAnchor.identifier = "buttonTopAnchor"
    buttonTopAnchor.isActive = true
  }

  func insertBorderedButton(_ title: String) {
    borderedButton = UIButton(frame: .zero)
    borderedButton.setTitle(title, for: .normal)
    borderedButton.setTitleColor(UIColor.blue, for: .normal)
    borderedButton.layer.borderWidth = 1
    borderedButton.layer.borderColor = UIColor.blue.cgColor
    borderedButton.layer.cornerRadius = 4
    containerView.addSubview(borderedButton)
    borderedButton.translatesAutoresizingMaskIntoConstraints = false
    borderedButton.leadingAnchor(equal: containerView, constant: 16)
    borderedButton.trailingAnchor(equal: containerView, constant: -16)
    containerView.constraints.first(where: { (constraint) in
      return constraint.identifier == "buttonTopAnchor"
    })?.isActive = false
    filledButton.topAnchor.constraint(equalTo: borderedButton.bottomAnchor, constant: 8).isActive = true
    borderedButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24).isActive = true
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
