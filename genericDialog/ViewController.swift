import UIKit

class ViewController: UIViewController {
  @IBAction func buttonAction(_ sender: Any) {
    let dialog = Dialog()
    self.view.addSubview(dialog)
    dialog.create(image: #imageLiteral(resourceName: "iconHeader"), title: "Lorem ipsum dolor sit amet consectetur adipiscing", description: "Lorem ipsum dolor sit consectetur adipiscing posuere felis at fringilla vehicula. Morbi feugiat at neque.", buttonTitle: "Nec sapien lobortis")
    dialog.addButton(title: "vivamus quis")
  }

  func butao1() {
    print("target button 1")
  }

  func butao2() {

  }
}


