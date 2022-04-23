//
//  CharacterListViewController.swift
//  RickAndMorty
//
//  Created by Sharon Varghese on 22/04/2022.
//

import UIKit

class CharacterListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    // MARK: IBOutlets
    @IBOutlet var tableView: UITableView!
    
    // MARK: Properties
    var viewModel = CharacterListViewModel()
    var listItems: [CharacterListModel]?
    
    //MARK: UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.\
        prepareUI()
        prepareTableView()
        setupSearchBar()
        fetchData()
    }

    //MARK: Custom Methods
    func prepareUI() {
        self.view.backgroundColor = AppColor.primaryBackgroundColor.value
    }
    
    func prepareTableView()  {
        tableView.register(UINib(nibName: CharacterListTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: CharacterListTableViewCell.reuseIdentifier)
        tableView.estimatedRowHeight = 150
    }
    
    func setupSearchBar()  {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        self.navigationItem.titleView = searchBar
    }
    
    func fetchData() {
        viewModel.fetchCharacters { result in
            switch result {
            case .success(let data):
                self.listItems = data
                self.tableView.reloadData()
            case .failure(let error):
                print(error.body ?? "")
            }
        }
    }
    
    func openCharacterDetail(character: Character?) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "CharacterDetailViewController") as? CharacterDetailViewController {
            vc.viewModel.character = character
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterListTableViewCell.reuseIdentifier, for: indexPath) as! CharacterListTableViewCell
        cell.data = listItems?[indexPath.row]
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = listItems?[indexPath.row]
        if let characterID = selectedItem?.id {
            let selectedCharacter = viewModel.getTheSelectedCharacterDetail(id: characterID)
            openCharacterDetail(character: selectedCharacter)
        }
    }
    
    // MARK: UISearchBarDelegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listItems = viewModel.filterCharactersBasedOnName(filterText: searchText)
        tableView.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

}
