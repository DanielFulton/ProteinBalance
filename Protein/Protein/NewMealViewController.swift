//
//  NewMealViewController.swift
//  Protein
//
//  Created by FultonDaniel on 2017/03/04.
//  Copyright © 2017 FultonDaniel. All rights reserved.
//

import UIKit

class NewMealViewController: UIViewController {
    @IBOutlet weak var tabelView: UITableView!
    var type:MealType = MealSource.sharedMealSoruce.nextRecommendedMealType()
    var protein:ProteinType = MealSource.sharedMealSoruce.nextRecommendedProteinType()
    var date:Date = Date.beginningOfCurrentDate() // Always zero out dates to simplify for hackathon
    var portion:Float = 1.0
    var eaters:[Eater] = []
    let cells:[String] = [NewMealEaterTableViewCell.identifier(),NewMealTypeCell.identifier(),NewMealProteinCell.identifier(),NewMealDateCell.identifier()]
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelView.reloadData()
        // Do any additional setup after loading the view.
    }

    @IBAction func doneButtonPressed(_ sender: Any) {
        MealSource.sharedMealSoruce.meals.insert(Meal(id: UUID().hashValue, type: type, protein: protein, date: date, portion: portion, eaters: eaters))
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NewMealViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cells[indexPath.row], for: indexPath)
        let cellIndex = NewMealCell(rawValue: indexPath.row)!
        switch cellIndex {
        case NewMealCell.EaterCell:
            cell.textLabel?.text = "👶"
        case NewMealCell.MealTypeCell:
            cell.textLabel?.text = type.string()
        case NewMealCell.Protein:
            cell.textLabel?.text = protein.string()
        case NewMealCell.Date:
            cell.textLabel?.text = date.description
        }
        return cell
    }
}

enum NewMealCell:Int {
    case EaterCell
    case MealTypeCell
    case Protein
    case Date
}

protocol TableIdentifiable : class {
    func identifier() -> String
}
