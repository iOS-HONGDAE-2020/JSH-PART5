//
//  TableViewCell.swift
//  EcommerceApp
//
//  Created by 정수현 on 2020/09/22.
//  Copyright © 2020 정수현. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    static let identifier = "TableViewCell"
    
    @IBOutlet weak var gradeImageView: UIImageView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userratingLabel: UILabel!
    @IBOutlet weak var reservationgradeLabel: UILabel!
    @IBOutlet weak var reservationrateLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    var movie: Movie! {
        didSet {
            let url = URL(string: String(self.movie.thumb))
            let data = try! Data(contentsOf: url!)
            self.imgView.image = UIImage(data: data)
            
            self.titleLabel.text = self.movie.title
            self.userratingLabel.text = "평점 : \(self.movie.user_rating)"
            self.reservationgradeLabel.text = "예매순위 : \(self.movie.reservation_grade)"
            self.reservationrateLabel.text = "예매율 : \(self.movie.reservation_rate)"
            self.dateLabel.text = "개봉일 : \(self.movie.date)"
            
            self.gradeImageView.tintColor = .black
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "TableViewCell", bundle: nil)
    }
    
}
