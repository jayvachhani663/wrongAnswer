import UIKit

class SelectModeViewController: UIViewController {

    @IBOutlet weak var hardButton: UIButton!
    @IBOutlet weak var mediumButton: UIButton!
    @IBOutlet weak var easyButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp(button: easyButton)
        setUp(button: mediumButton)
        setUp(button: hardButton)
        
    }
    
    @IBAction func easyButttonClick(_ sender: UIButton) {
        let lavel = self.storyboard?.instantiateViewController(withIdentifier: "PlayViewController") as! PlayViewController
        navigationController?.pushViewController(lavel, animated: true)
    }
    func setUp(button:UIButton) {
        easyButton.layer.cornerRadius = 10
        easyButton.layer.masksToBounds = true
        mediumButton.layer.cornerRadius = 10
        mediumButton.layer.masksToBounds = true
        hardButton.layer.cornerRadius = 10
        hardButton.layer.masksToBounds = true
    }
    
    
}
