//
//  CharacterImageTableViewCell.swift
//  RickAndMorty
//
//  Created by Sharon Varghese on 23/04/2022.
//

import UIKit

class CharacterImageTableViewCell: UITableViewCell {
    
    //MARK: Properties
    static let reuseIdentifier = "CharacterImageTableViewCell"
    
    //MARK: IBOutlet
    @IBOutlet var characterImageView: UIImageView!
    
    var data: CharacterDetailImageCellModel? {
        didSet {
            loadData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func loadData() {
        let imageURL = URL(string: data?.imageURL ?? "")
        characterImageView.sd_setImage(with: imageURL)
    }
    
}
