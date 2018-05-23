//
//  OldTimeTableViewCell.swift
//  Swift4Learn
//
//  Created by Tony on 2018/5/15.
//  Copyright © 2018年 tony. All rights reserved.
//

import UIKit

class OldTimeTableViewCell: UITableViewCell {
    var picImgVw:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // 自定义的方法
    override func parentViewAddAllChildViews(_ parentView: UIView?) {
        autoreleasepool {
            picImgVw = UIImageView
                           .init(frame: CGRect
                                        .init(x: 0,
                                              y: 0,
                                              width: self.contentView.bounds.width,
                                              height: self.contentView.bounds.height))
            self.contentView.addSubview(picImgVw)
            
        }
    }
    
    override func parentViewDidRefresh(_ parentView: UIView?, _ model: NSObject?) {
       
        
    }
    
    
    
    
}
