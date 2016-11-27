//
//  CutsomTableViewCell.swift
//  SwiftTips
//
//  Created by 陈晓龙 on 16/11/27.
//  Copyright © 2016年 陈晓龙. All rights reserved.
//

import UIKit

class CutsomTableViewCell: UITableViewCell {

     var lable:UILabel? = nil
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        lable = UILabel()
        //lable?.frame = CGRect(x: 15, y: 0, width: 300, height: 0)
        lable?.numberOfLines = 0
        lable?.font = UIFont.systemFont(ofSize: 17)
        lable?.textColor = UIColor.black
        lable?.numberOfLines = 1
        lable?.tag = 100
        //lable?.text = "送到房间爱啦啦放假啦是附近垃圾说的是分散附近垃圾说的是分散附近垃圾说的是分散附近垃圾说的是分散附近垃圾说的是分散"
        contentView.addSubview(lable!)
        lable?.snp.makeConstraints({ (make) in
            //make.left.right.equalTo(self.contentView)
            make.left.equalTo(15)
            make.right.equalTo(self.contentView).offset(-10)
            make.top.equalTo(self.contentView).offset(4)
            make.bottom.equalTo(self.contentView).offset(-4)
            
        })
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
