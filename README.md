# GPA Grade Calculator App

An iOS course grade planner built with **UIKit and Storyboard**. Each course gets its own tab, each grading category gets its own slider, and your estimated grade updates live as you drag. There is no Calculate button.

Built for **COSC 3326: Mobile Programming** (Fall 2026, Assignment #1) at St. Edward's University.

## Features

- **Tab Bar navigation:** one tab per course, plus a GPA tab.
- **Slider per grading category:** set the score you earned (or expect to earn) in each category.
- **Live recalculation:** the numerical grade and A-F letter grade update every time a slider moves.
- **Weights shown next to every category**, so it's clear how much each one counts.

### Exceeds expectations

1. **GPA Calculator tab:** collects the live grade from every course tab and combines them into one overall GPA on a 4.0 scale. It refreshes each time the tab is opened.
2. **Haptic feedback:** a short success haptic fires whenever a slider move changes a course's letter grade (for example, B to A). It does not fire on every small drag.

## Courses

| Course | Number | Instructor | Categories (weight) |
|---|---|---|---|
| Data Analysis | COSC-2327 | Dr. Paul Savala | Homeworks (10%), Skills Challenge (25%), Projects (30%), Final Project (35%) |
| Computer Vision | COSC-4358 | Dr. Gentry Atkinson | Attendance (10%), Class Coding Assignments (25%), Exams (30%), Semester Project (35%) |
| Data Mining & Analysis | COSC-3358 | Dr. Isabel Cachola | Homeworks (10%), Projects (25%), Midterm (30%), Final Project (35%) |

## Grading scale

| Letter | Range | GPA points |
|---|---|---|
| A | 90 and above | 4.0 |
| B | 80 to 89.99 | 3.0 |
| C | 70 to 79.99 | 2.0 |
| D | 60 to 69.99 | 1.0 |
| F | below 60 | 0.0 |

The overall GPA is the unweighted average of the GPA points across the three courses.

## Screenshots

Add your screenshots to a `Screenshots/` folder in the repo and update the paths below.

| Data Analysis | Computer Vision | Data Mining & Analysis | GPA Calculator |
|---|---|---|---|
| ![Data Analysis](Screenshots/data-analysis.png) | ![Computer Vision](Screenshots/computer-vision.png) | ![Data Mining](Screenshots/data-mining.png) | ![GPA](Screenshots/gpa.png) |

## Project structure

| File | Purpose |
|---|---|
| `ViewController.swift` | Data Analysis tab: slider handling, grade calculation, letter grade, haptics |
| `ComputerVisionViewController.swift` | Computer Vision tab (same logic) |
| `DataMiningViewController.swift` | Data Mining & Analysis tab (same logic) |
| `GradeManager.swift` | Shared singleton that stores each course's current grade and computes letter grades and GPA |
| `GPAViewController.swift` | GPA tab: reads from `GradeManager` and displays per-course grades and overall GPA |
| `Main.storyboard` | UI layout, Tab Bar Controller, and all four screens |

## How it works

Each course screen recalculates its final grade whenever a slider's value changes. After updating its own display, it reports its grade to `GradeManager.shared`. When the GPA tab appears, it reads every reported grade from `GradeManager`, converts each to a letter and GPA points, and shows the average.

## Requirements

- Xcode 26.6
- Swift 6.3.3
- iOS 26.5
- Tested on the iPhone 17 Pro simulator

## Getting started

1. Clone the repo:
   ```bash
   git clone https://github.com/YOUR-USERNAME/YOUR-REPO-NAME.git
   ```
2. Open the `.xcodeproj` file in Xcode.
3. Select the **iPhone 17 Pro** simulator.
4. Press **Cmd + R** to build and run.

The GPA tab only shows a course's grade after that course's tab has been opened at least once, since each tab reports its grade when it loads.

Haptic feedback is only felt on a physical iPhone. The simulator does not produce haptics.

## Author
Khadeja Mohsin

**YOUR NAME**
St. Edward's University, Computer Science
