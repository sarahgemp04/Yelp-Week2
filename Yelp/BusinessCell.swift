//
//  BusinessCell.swift
//  Yelp
//
//  Created by Sarah Gemperle on 12/1/17.
//  Copyright © 2017 Timothy Lee. All rights reserved.
//

import UIKit
import AFNetworking

class BusinessCell: UITableViewCell {

    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var numReviewsLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    var business: Business! {
        didSet {
            if business.imageURL != nil {
                restaurantImageView.setImageWith(business.imageURL!)
            }
            nameLabel.text = business.name
            numReviewsLabel.text =  "\(String(describing: business.reviewCount!)) reviews"
            ratingImageView.setImageWith(business.ratingImageURL!)
            addressLabel.text = business.address
            typeLabel.text = business.categories
            distanceLabel.text = business.distance
            restaurantImageView.layer.cornerRadius = 5
            
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

}
