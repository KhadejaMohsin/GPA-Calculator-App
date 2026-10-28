

import UIKit

class DataMiningViewController: UIViewController {
    var Grade1:Float = 0
    var Grade2:Float = 0
    var Grade3:Float = 0
    var Grade4:Float = 0
    var FinalGrade:Float = 0

    // This tab's name, exactly as it should appear on the GPA tab.
    private let courseName = "Data Mining & Analysis"

    // Exceeds-expectations feature #2: a short haptic tap whenever this
    // course's letter grade changes (not on every tiny slider tick).
    private var lastLetterGrade: String = ""
    private let feedbackGenerator = UINotificationFeedbackGenerator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateAverage()
        ShowFinalGrade()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var lblGrade1: UILabel!
    @IBOutlet weak var lblGrade2: UILabel!
    @IBOutlet weak var lblGrade3: UILabel!
    @IBOutlet weak var lblGrade4: UILabel!
    
    
    @IBAction func sldGrade1(_ sender: UISlider) {
        Grade1 = Float((sldGrade1Value.value * 100) / sldGrade1Value.maximumValue)
        lblGrade1.text = String(format: "%.2f", Grade1)
        calculateAverage()
        ShowFinalGrade()
    }
    @IBAction func sldGrade2(_ sender: UISlider) {
        Grade2 = Float((sldGrade2Value.value * 100) / sldGrade2Value.maximumValue)
        lblGrade2.text = String(format: "%.2f", Grade2)
        calculateAverage()
        ShowFinalGrade()
    }
    @IBAction func sldGrade3(_ sender: UISlider) {
        Grade3 = Float((sldGrade3Value.value * 100) / sldGrade3Value.maximumValue)
        lblGrade3.text = String(format: "%.2f", Grade3)
        calculateAverage()
        ShowFinalGrade()
    }
    @IBAction func sldGrade4(_ sender: UISlider) {
        Grade4 = Float((sldGrade4Value.value * 100) / sldGrade4Value.maximumValue)
        lblGrade4.text = String(format: "%.2f", Grade4)
        calculateAverage()
        ShowFinalGrade()
    }
    
    @IBOutlet weak var sldGrade1Value: UISlider!
   
    @IBOutlet weak var sldGrade2Value: UISlider!
    
    @IBOutlet weak var sldGrade3Value: UISlider!
    
    @IBOutlet weak var sldGrade4Value: UISlider!
    
    
    @IBOutlet weak var lblFinalGrade: UILabel!
    
    func calculateAverage() {
        return FinalGrade = ((Grade1 / 100) * (sldGrade1Value.maximumValue * 10) + (Grade2 / 100) * (sldGrade2Value.maximumValue * 10) + (Grade3 / 100) * (sldGrade3Value.maximumValue * 10) + (Grade4 / 100) * (sldGrade4Value.maximumValue * 10))
        
     }
     func ShowFinalGrade(){
         let letter = GradeManager.shared.letterGrade(for: FinalGrade)
         lblFinalGrade.text = "\(letter) (\(String(format: "%.2f", FinalGrade)))"

         // Feature #2: only buzz when the letter grade actually changes.
         if letter != lastLetterGrade {
             feedbackGenerator.notificationOccurred(.success)
             lastLetterGrade = letter
         }

         // Feature #1: report this course's current grade so the GPA tab can read it.
         GradeManager.shared.update(course: courseName, grade: FinalGrade)
     }
     
     
 }
