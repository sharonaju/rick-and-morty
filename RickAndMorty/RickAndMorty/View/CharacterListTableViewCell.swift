//
//  ListTableViewCell.swift
//  RickAndMorty
//
//  Created by Sharon Varghese on 22/04/2022.
//

import UIKit
import SDWebImage

class CharacterListTableViewCell: UITableViewCell {
    
    // MARK:  IBOutlets
    @IBOutlet var bgView: UIView!
    @IBOutlet var nameLabel: BaseLabel!
    @IBOutlet var episodesLabel: BaseLabel!
    @IBOutlet var thumbnailimageView: UIImageView!
    
    // MARK: Properties
    static let reuseIdentifier = "CharacterListTableViewCell"
    var data: CharacterListModel? {
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
        bgView.backgroundColor = AppColor.secondaryBackgroundColor.value
        bgView.layer.cornerRadius = 5
    }
    
    func loadData() {
        nameLabel.text = data?.name
        episodesLabel.text = data?.episodes
        let imageURL = URL(string: data?.imageURL ?? "")
        thumbnailimageView.sd_setImage(with: imageURL)
    }
}
