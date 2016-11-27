//
//  ViewController.swift
//  SwiftTips
//
//  Created by 陈晓龙 on 16/11/27.
//  Copyright © 2016年 陈晓龙. All rights reserved.
//

import UIKit
let SCREEN_WITH = UIScreen.main.bounds.size.width

let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

 var textValue = "送到房间爱啦啦放假啦\n是附近垃圾说的圾说的是\n是附近垃圾说的圾说的是\n是附近垃圾说的圾说的是\n是附近垃圾说的圾说的是\n是附近垃圾说的圾说的是\n是附近垃圾说的圾说的是\n是附近垃圾说的圾说的是\n是附近垃圾说的圾说的是\n是附近垃圾说的圾说的是\n是附近垃圾说的圾说的是\n是附近垃圾说的圾说的是\n是附近垃圾说的圾说的是\n是附近垃圾说的圾说的是\n是附近垃圾说的圾说的是\n是附近垃圾说的圾说的是\n是附近垃圾说的圾说的是\n是附近垃圾说的圾说的是\n是附近垃圾说的圾说的是\n是附近垃圾说的圾说的是\n是附近垃圾说的圾说的是\n是附近垃圾说的圾说的是\n是附近垃圾说的圾说的是"
var dict:[String:String] = [:]



class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createView()
 
    }
    func createView() {
       
        view.addSubview(tableView)
     
        
    }
//MARK: -- 懒加载
    lazy var tableView :UITableView = {
     let tabView = UITableView(frame: CGRect(x: 0, y: 0, width:SCREEN_WITH , height: SCREEN_HEIGHT), style: UITableViewStyle.plain)
        tabView.register(CutsomTableViewCell.self, forCellReuseIdentifier: "identifier")
        tabView.delegate = self
        tabView.dataSource = self
        tabView.rowHeight = UITableViewAutomaticDimension
        tabView.estimatedRowHeight = 60
        //tabView.tableFooterView = UIView()
        tabView.separatorColor = UIColor.red
        return tabView
    }()
    
    
  
    
    
    
    //MARK: -- tableviewDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return 100
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        let cellId = "identifier"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CutsomTableViewCell
        cell.backgroundColor = UIColor.white
        
        let lb = cell.contentView.viewWithTag(100) as! UILabel
        lb.text = textValue 
        
        if dict[String(indexPath.row)] == "0" {
            lb.numberOfLines = 0
        }else{
            lb.numberOfLines = 1
        }
        
        
        
        return cell
    }
    //MARK: -- 方法一
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//        let attribute = [NSFontAttributeName:UIFont.systemFont(ofSize: 17)]
//
//        return textValue.boundingRect(with: CGSize.init(width: 300, height: 0), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attribute, context: nil).size.height
//    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let lb = cell?.contentView.viewWithTag(100) as! UILabel
        tableView.beginUpdates()
        if lb.numberOfLines == 0 {
            lb.numberOfLines = 1
            dict[String(indexPath.row)] = "1"
        }else{
            dict[String(indexPath.row)] = "0"
            lb.numberOfLines = 0
        }
        tableView.endUpdates()
       // tableView.reloadData()
    }
    
    //MARK: -- 线 顶头
    override func viewDidLayoutSubviews() {// 设置内边距 和外边距
        self.tableView.separatorInset = UIEdgeInsets.zero
        self.tableView.layoutMargins = UIEdgeInsets.zero
        
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
    }
    
//end

}


