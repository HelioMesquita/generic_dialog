import UIKit

class ViewController: UIViewController {
  @IBAction func buttonAction(_ sender: Any) {
    let dialog = Dialog()
    self.view.addSubview(dialog)
    dialog.setView(image: #imageLiteral(resourceName: "iconHeader"), title: "Titulo", description: "Descricao", firstButtonTitle: "botao titulo 1", secondButtonTitle: "botao titulo 2")

//    let button = dialog.getFirstButton() as! UIButton
//    button.addTarget(self, action: #selector(butao1), for: .touchUpInside)

  }

  func butao1() {
    print("target button 1")
  }

  func butao2() {

  }
}


