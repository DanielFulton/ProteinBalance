//
//  MealListViewController.swift
//  Protein
//
//  Created by FultonDaniel on 2017/03/04.
//  Copyright © 2017 FultonDaniel. All rights reserved.
//

import UIKit

class MealListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if MealSource.sharedMealSoruce.meals.count == 0 {
            let addVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "add")
            print("add \(addVC)")
            self.present(addVC, animated: true, completion: nil)
        }
        tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MealSource.sharedMealSoruce.meals.count + 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if indexPath.row >= MealSource.sharedMealSoruce.meals.count {
            cell.textLabel?.text = "New"
            return cell
        }
        cell.textLabel?.text = MealSource.sharedMealSoruce.sortedMeals()[indexPath.row].protein.string()
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row < MealSource.sharedMealSoruce.meals.count {
            return
        }
        let addVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "add")
        print("add \(addVC)")
        self.present(addVC, animated: true, completion: nil)
    }
}
