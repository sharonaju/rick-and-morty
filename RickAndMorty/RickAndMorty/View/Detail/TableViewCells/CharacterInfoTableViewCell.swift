//
//  CharacterInfoTableViewCell.swift
//  RickAndMorty
//
//  Created by Sharon Varghese on 23/04/2022.
//

import UIKit

class CharacterInfoTableViewCell: UITableViewCell {

    //MARK: IBOutlet
    @IBOutlet var valueLabel: BaseLabel!
    @IBOutlet var titleLabel: BaseLabel!
    @IBOutlet var bgView: UIView!
    
    // MARK: Properties
    static let reuseIdentifier = "CharacterInfoTableViewCell"
    var data: CharacterDetailInfoCellModel? {
        didSet {
            loadData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    func setupUI() {
        bgView.layer.cornerRadius = 5
        bgView.backgroundColor = AppColor.secondaryBackgroundColor.value
    }
    
    func loadData () {
        titleLabel.text = data?.title
        valueLabel.text = data?.value
    }
   
    
}
