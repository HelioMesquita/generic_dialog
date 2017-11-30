import UIKit

class ViewController: UIViewController {
  @IBAction func buttonAction(_ sender: Any) {
    let dialog = Dialog()
    self.view.addSubview(dialog)
    dialog.create(image: #imageLiteral(resourceName: "iconHeader"), title: "Valide os Documentos!", description: "Para continuar usando o GetNinjas, você precisa validar seus documentos. Isso garante a segurança dos clientes e dos profissionais.", buttonTitle: "Tentar Enviar Novamente")
    dialog.addButton(title: "vivamus quis")
//    let button = dialog.getFirstButton() as! UIButton
//    button.addTarget(self, action: #selector(butao1), for: .touchUpInside)

  }

  func butao1() {
    print("target button 1")
  }

  func butao2() {

  }
}


