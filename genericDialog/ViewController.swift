import UIKit

class ViewController: UIViewController {
  @IBAction func buttonAction(_ sender: Any) {
    let dialog = Dialog()
    self.view.addSubview(dialog)
    dialog.create(image: #imageLiteral(resourceName: "iconHeader"), title: "Lorem ipsum dolor sit amet consectetur adipiscing", description: "Lorem ipsum dolor sit consectetur adipiscing posuere felis at fringilla vehicula. Morbi feugiat at neque.", buttonTitle: "Nec sapien lobortis")
    dialog.addButton(title: "vivamus quis")

    if let button = dialog.getBorderedButton() {
      button.addTarget(self, action: #selector(firstButtonAction), for: .touchUpInside)
    }

    if let button = dialog.getFilledButton() {
      button.addTarget(self, action: #selector(secondButtonAction), for: .touchUpInside)
    }
  }

  func firstButtonAction() {
    print("target button 1")
  }

  func secondButtonAction() {
    print("target button 2")
  }
}
