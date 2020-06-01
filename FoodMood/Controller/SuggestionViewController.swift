//
//  SuggestionViewController.swift
//  FoodMood
//
//  Created by Jason Mo on 5/26/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit

class SuggestionViewController: UIViewController {

    let suggestionView = SuggestionView()
    var yelpPropertiesCells: [YelpProperties] {
        return suggestionView.suggestionTableView.yelpProperties
        //pull properties
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        suggestionView.suggestionTableView.dataSource = self
        suggestionView.suggestionTableView.delegate = self
        suggestionView.suggestionTableView.rowHeight = 100
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        view = suggestionView
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SuggestionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yelpPropertiesCells.count // replace with count later
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SuggestionTableViewCell
        cell.restaurantName.text = yelpPropertiesCells[indexPath.row].restaurantName
        cell.ratingLabel.text = yelpPropertiesCells[indexPath.row].rating
        cell.location.text = yelpPropertiesCells[indexPath.row].location
        cell.location.text = yelpPropertiesCells[indexPath.row].priceRange
        cell.hoursOfOp.text = yelpPropertiesCells[indexPath.row].hoursOfOp
        
        return cell
    }
    
    
        
}

extension SuggestionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = profileCells[indexPath.row]
    }
    
}

extension SuggestionViewController:  UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self as? UIViewControllerAnimatedTransitioning
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self as? UIViewControllerAnimatedTransitioning
    }
}

