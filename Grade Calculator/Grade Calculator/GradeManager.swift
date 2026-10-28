
import Foundation

// Exceeds-expectations feature #1: a GPA calculator that pulls the live
// final grade from every course tab and combines them into one overall GPA.
//
// Each course view controller calls GradeManager.shared.update(course:grade:)
// at the end of its ShowFinalGrade() function. The GPA tab then reads
// everything back in viewWillAppear() so it's always showing the latest
// slider values, no matter which course tab you touched last.
final class GradeManager {

    static let shared = GradeManager()
    private init() {}

    struct CourseRecord {
        let name: String
        let grade: Float
    }

    // The order courses should appear in on the GPA tab.
    // Must match the course names each ViewController passes to update(course:grade:).
    private let courseOrder = ["Data Analysis", "Computer Vision", "Data Mining & Analysis"]

    private var records: [String: Float] = [:]

    func update(course: String, grade: Float) {
        records[course] = grade
    }

    /// All courses that have reported a grade so far, in display order.
    func allRecords() -> [CourseRecord] {
        courseOrder.compactMap { name in
            guard let grade = records[name] else { return nil }
            return CourseRecord(name: name, grade: grade)
        }
    }

    func letterGrade(for grade: Float) -> String {
        switch grade {
        case 90...:    return "A"
        case 80..<90:  return "B"
        case 70..<80:  return "C"
        case 60..<70:  return "D"
        default:       return "F"
        }
    }

    private func gpaPoints(for letter: String) -> Double {
        switch letter {
        case "A": return 4.0
        case "B": return 3.0
        case "C": return 2.0
        case "D": return 1.0
        default:  return 0.0
        }
    }

    /// Simple unweighted GPA across every course that currently has a grade.
    func overallGPA() -> Double {
        let recs = allRecords()
        guard !recs.isEmpty else { return 0.0 }
        let total = recs.reduce(0.0) { $0 + gpaPoints(for: letterGrade(for: $1.grade)) }
        return total / Double(recs.count)
    }
}
