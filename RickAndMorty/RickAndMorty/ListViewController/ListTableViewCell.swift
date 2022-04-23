//
//  ListTableViewCell.swift
//  RickAndMorty
//
//  Created by Sharon Varghese on 22/04/2022.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    static let reuseIdentifier = "ListTableViewCell"
    
    @IBOutlet var bgView: UIView!
    @IBOutlet var nameLabel: BaseLabel!
    @IBOutlet var episodesLabel: BaseLabel!
    @IBOutlet var thumbnailimageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
        loadData()
    }

    func setupUI() {
        bgView.backgroundColor = AppColor.secondaryBackgroundColor.value
        bgView.layer.cornerRadius = 5
        
    }
    
    func loadData() {
        nameLabel.text = "Agency Director"
        episodesLabel.text = "40 Episodes"
    }
}
