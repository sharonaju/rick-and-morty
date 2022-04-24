//
//  CharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Sharon Varghese on 23/04/2022.
//

import UIKit

class CharacterDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
// MARK: IBOutlets
    @IBOutlet var tableView: UITableView!
    
    //MARK: Properties
    var viewModel = CharacterDetailViewModel()
    var viewData = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        prepareTableView()
        loadData()
    }
    
    //MARK: CustomMethods
    func setupUI() {
        self.title = viewModel.character?.name
        self.view.backgroundColor = AppColor.primaryBackgroundColor.value
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    func prepareTableView() {
        tableView.register(UINib(nibName: CharacterImageTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: CharacterImageTableViewCell.reuseIdentifier)
        tableView.register(UINib(nibName: CharacterInfoTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: CharacterInfoTableViewCell.reuseIdentifier)
        tableView.estimatedRowHeight = 150
    }
    
    func loadData() {
        viewData = viewModel.createViewData()
    }
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = viewData[indexPath.row]
        switch data {
        case is CharacterDetailImageCellModel:
            if let cellData = data as? CharacterDetailImageCellModel {
                let cell = tableView.dequeueReusableCell(withIdentifier: CharacterImageTableViewCell.reuseIdentifier, for: indexPath) as! CharacterImageTableViewCell
                cell.data = cellData
                return cell
            }
        case is CharacterDetailInfoCellModel:
            if let cellData = data as? CharacterDetailInfoCellModel {
                let cell = tableView.dequeueReusableCell(withIdentifier: CharacterInfoTableViewCell.reuseIdentifier, for: indexPath) as! CharacterInfoTableViewCell
                cell.data = cellData
                return cell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
 
}
