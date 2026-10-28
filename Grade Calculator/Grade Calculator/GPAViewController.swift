
import UIKit

// Exceeds-expectations feature #1 (continued): this is the 4th tab.
// It has no sliders of its own, it just displays what GradeManager has
// collected from the other three course tabs, refreshed every time this
// tab becomes visible.
class GPAViewController: UIViewController {

    @IBOutlet weak var lblCourse1Name: UILabel!
    @IBOutlet weak var lblCourse1Grade: UILabel!
    @IBOutlet weak var lblCourse2Name: UILabel!
    @IBOutlet weak var lblCourse2Grade: UILabel!
    @IBOutlet weak var lblCourse3Name: UILabel!
    @IBOutlet weak var lblCourse3Grade: UILabel!
    @IBOutlet weak var lblOverallGPA: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshGPA()
    }

    private func refreshGPA() {
        let records = GradeManager.shared.allRecords()
        let nameLabels = [lblCourse1Name, lblCourse2Name, lblCourse3Name]
        let gradeLabels = [lblCourse1Grade, lblCourse2Grade, lblCourse3Grade]

        for i in 0..<nameLabels.count {
            if i < records.count {
                let record = records[i]
                let letter = GradeManager.shared.letterGrade(for: record.grade)
                nameLabels[i]?.text = record.name
                gradeLabels[i]?.text = "\(String(format: "%.2f", record.grade))%  (\(letter))"
            } else {
                nameLabels[i]?.text = "—"
                gradeLabels[i]?.text = "Visit this course's tab first"
            }
        }

        let gpa = GradeManager.shared.overallGPA()
        lblOverallGPA.text = String(format: "%.2f", gpa)
    }
}
