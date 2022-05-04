
import UIKit

class PlayViewController: UIViewController {
    
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var timerProgressView: UIProgressView!
    @IBOutlet weak var gameOverAlertView: UIView!
    @IBOutlet weak var alertScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setQuestion()
        setTimer()
        setAlert()
        setup(button: trueButton)
        setup(button: falseButton)
      
        
    }
    
    private func setAlert() {
        gameOverAlertView.isHidden = true
    }
    
    private func showAlert() {
        gameOverAlertView.isHidden = false
        alertScoreLabel.text = String(score)
    }
    func setup (button: UIButton){
        trueButton.layer.cornerRadius = 10
        trueButton.layer.masksToBounds = true
        falseButton.layer.cornerRadius = 10
        falseButton.layer.masksToBounds = true
        gameOverAlertView.layer.cornerRadius = 10
        gameOverAlertView.layer.masksToBounds = true
    }
    //Variabal
    var timer = Timer()
    var seconds:Float = 0.0
    var timeIntervals:Double = 0.0
    var score: Int = 0
    var rendomeOprator: Int = 0
    var arrNumbers: [Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    var randomeIndex: Int = 0
    var randomNo: Int = 0
    var answer: Int = 0
    var randomeTrueFalse: Int = 0
    var realAnswer: Int = 0
   //timer
    private func setTimer() {
        seconds = 10
        timeIntervals =  Double(Double(seconds)/Double(100))
        timer = Timer.scheduledTimer(timeInterval: timeIntervals, target: self, selector: (#selector(upDateTimer)), userInfo: nil, repeats: true)
    }
    @objc func upDateTimer() {
        if seconds > 0 {
            seconds = seconds - Float(timeIntervals)
            timerProgressView.progress = (seconds)/Float((timeIntervals*100))
        } else {
            timer.invalidate()
            showAlert()
        }
    }
    
    func setQuestion() {
        randomeIndex = Int(arc4random_uniform(UInt32(arrNumbers.count)))
        randomNo =  Int(arc4random_uniform(25))
        rendomeOprator = Int(arc4random_uniform(4))
        randomeTrueFalse = Int(arc4random_uniform(2))
        
        if randomeTrueFalse == 0 {
            if rendomeOprator == 1 {
                questionLabel.text = "\(arrNumbers[randomeIndex]) + \(randomNo) = \(arrNumbers[randomeIndex] + randomNo)"
                answer = arrNumbers[randomeIndex] + randomNo
                print(questionLabel.text!)
                print("false")
                rendomeOprator = Int(arc4random_uniform(4))
                realAnswer = answer
            } else if rendomeOprator == 2 {
                questionLabel.text = "\(arrNumbers[randomeIndex]) - \(randomNo) = \(arrNumbers[randomeIndex] - randomNo)"
                answer = arrNumbers[randomeIndex] - randomNo
                print(questionLabel.text!)
                print("false")
                rendomeOprator = Int(arc4random_uniform(4))
                realAnswer = answer
            } else if rendomeOprator == 3 {
                questionLabel.text = "\(arrNumbers[randomeIndex]) * \(randomNo) = \(arrNumbers[randomeIndex] * randomNo)"
                answer = arrNumbers[randomeIndex] * randomNo
                print(questionLabel.text!)
                print("false")
                rendomeOprator = Int(arc4random_uniform(4))
                realAnswer = answer
            } else {
                questionLabel.text = "\(arrNumbers[randomeIndex]) / \(randomNo) = \(arrNumbers[randomeIndex] /  randomNo)"
                answer = arrNumbers[randomeIndex] / randomNo
                print(questionLabel.text!)
                print("false")
                rendomeOprator = Int(arc4random_uniform(4))
                realAnswer = answer
            }
        } else {
            if rendomeOprator == 1 {
                questionLabel.text = "\(arrNumbers[randomeIndex]) + \(randomNo) = \(arrNumbers[randomeIndex] * randomNo)"
                answer = arrNumbers[randomeIndex] * randomNo
                print(questionLabel.text!)
                print("true")
                rendomeOprator = Int(arc4random_uniform(4))
                realAnswer = arrNumbers[randomeIndex] + randomNo
            } else if rendomeOprator == 2 {
                questionLabel.text = "\(arrNumbers[randomeIndex]) - \(randomNo) = \(arrNumbers[randomeIndex] + randomNo)"
                answer = arrNumbers[randomeIndex] + randomNo
                print(questionLabel.text!)
                print("true")
                rendomeOprator = Int(arc4random_uniform(4))
                realAnswer = arrNumbers[randomeIndex] - randomNo
            } else if rendomeOprator == 3 {
                questionLabel.text = "\(arrNumbers[randomeIndex]) * \(randomNo) = \(arrNumbers[randomeIndex] - randomNo)"
                answer = arrNumbers[randomeIndex] - randomNo
                print(questionLabel.text!)
                print("true")
                rendomeOprator = Int(arc4random_uniform(4))
                realAnswer = arrNumbers[randomeIndex] * randomNo
            } else {
                questionLabel.text = "\(arrNumbers[randomeIndex]) / \(randomNo) = \(arrNumbers[randomeIndex] + randomNo)"
                answer = arrNumbers[randomeIndex] + randomNo
                print(questionLabel.text!)
                print("true")
                rendomeOprator = Int(arc4random_uniform(4))
                realAnswer = arrNumbers[randomeIndex] / randomNo
            }
        }
    }
        @IBAction func trueButtonClick(_ sender: UIButton) {
        if realAnswer == answer {
            print("Wrong Answer")
            score = 0
            showAlert()
        } else {
            setQuestion()
            score = score + 1
            scoreLabel.text = String(score)
            alertScoreLabel.text = String(score)
            setTimer()
        }
        setTimer()
    }
    
    @IBAction func falseButtonClick(_ sender: Any) {
        if realAnswer == answer {
            setQuestion()
            score = score + 1
            scoreLabel.text = String(score)
            alertScoreLabel.text = String(score)
            setTimer()
        } else {
            print("Wrong Answer")
            score = 0
            showAlert()
        }
    }
    
    @IBAction func homeButtonClick(_ sender: UIButton) {
        let home = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        navigationController?.pushViewController(home, animated: true)
        setAlert()
    }
    @IBAction func returnButtonClick(_ sender: UIButton) {
        let returnButton = self.storyboard?.instantiateViewController(withIdentifier: "SelectModeViewController") as! SelectModeViewController
        navigationController?.pushViewController(returnButton, animated: true)
        setAlert()
    }
    @IBAction func shareButtonClick(_ sender: UIButton) {
        let shareButton = self.storyboard?.instantiateViewController(withIdentifier: "PlayViewController")as! PlayViewController
        navigationController?.pushViewController(shareButton, animated: true)
        setAlert()
    }
}
