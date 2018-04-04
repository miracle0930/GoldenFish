//
//  LocationTableViewCell.swift
//  GoldenFish
//
//  Created by 管 皓 on 2018/4/4.
//  Copyright © 2018年 Hao Guan. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var locationAddress: UILabel!
    @IBOutlet weak var locationDistance: UILabel!
    @IBOutlet weak var locationImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        locationName.backgroundColor = .clear
        locationAddress.backgroundColor = .clear
        locationDistance.backgroundColor = .clear
        self.backgroundColor = .clear
    }
    
    @IBAction func editButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
