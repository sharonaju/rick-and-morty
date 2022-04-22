//
//  ListViewController.swift
//  RickAndMorty
//
//  Created by Sharon Varghese on 22/04/2022.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // MARK: IBOutlets
    @IBOutlet var tableView: UITableView!
    
    // MARK: Properties
    
    //MARK: UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        logAllAvailableFonts()
        prepareTableView()
    }
    /// Logs all available fonts from iOS SDK and installed custom font
   func logAllAvailableFonts() {
       for family in UIFont.familyNames {
       print("\(family)")
       for name in UIFont.fontNames(forFamilyName: family) {
           print("   \(name)")
       }
        }
    }
    //MARK: Custom Methods
    func prepareTableView()  {
        
    }
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
