import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rulesView: UIView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad();        setUp(button:startButton)
        setUp(button:playButton)

    }

    @IBAction func startButton(_ sender: Any) {
        rulesView.isHidden = false
    }
    
    func setUp(button:UIButton) {
        rulesView.isHidden = true
        rulesView.layer.cornerRadius = 10
        rulesView.layer.masksToBounds = true
        playButton.layer.cornerRadius = 20
        playButton.layer.masksToBounds = true
        startButton.layer.cornerRadius = 15
        startButton.layer.masksToBounds = true
        
    }
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        rulesView.isHidden = true
        super.touchesBegan(touches, with: event)
    }
    
    @IBAction func playbutton(_ sender: Any) {
        let lavel = self.storyboard?.instantiateViewController(withIdentifier: "SelectModeViewController") as! SelectModeViewController
        navigationController?.pushViewController(lavel, animated: true)
    }
    
}

