//
//  CollectionViewCell.swift
//  EcommerceApp
//
//  Created by 정수현 on 2020/09/22.
//  Copyright © 2020 정수현. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userratingLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var movie: Movie! {
        didSet {
            let url = URL(string: String(self.movie.thumb))
            let data = try! Data(contentsOf: url!)
            self.imgView.image = UIImage(data: data)
            self.titleLabel.text = movie.title
            self.userratingLabel.text = "\(movie.reservation_grade)위 ( \(movie.user_rating)) / \(movie.reservation_rate)%"
            self.dateLabel.text = movie.date
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    static func nib() -> UINib {
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }
}
