//
//  ViewController.swift
//  StretchMyHeader
//
//  Created by Kit Clark-O'Neil on 2018-09-11.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var dateLabe: UILabel!
    var newsItem = NewsItem.init()
    var storiesArray:[(String, String)] = []
    let kTableHeaderHeight:CGFloat = 212
    
    
    
    override var prefersStatusBarHidden: Bool {
        
return true
    }

    
  override func viewDidLoad() {
        super.viewDidLoad()

    myTableView.delegate = self
    myTableView.dataSource = self
    myTableView.rowHeight = UITableViewAutomaticDimension
    storiesArray = newsItem.categoryAndHeadline
    let dateToday = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
    dateLabe.text = dateFormatter.string(from: dateToday)
    
    
    
//    myTableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
    myTableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
    myTableView.tableHeaderView = nil
    myTableView.addSubview(headerView)
    
   
    
    
    }
//    myTableView.estimatedRowHeight = 90
        // Do any additional setup after loading the view, typically from a nib.

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        updateHeaderView()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: HeadlineTableViewCell
        
        if let reusedCell = tableView.dequeueReusableCell(withIdentifier: "headlineCell", for: indexPath) as? HeadlineTableViewCell {
            cell = reusedCell
        }
        else {
            cell = HeadlineTableViewCell()
            print ("failed to dequeue reusable cell")
        }
        let story = storiesArray[indexPath.row]
        let headlineColour = newsItem.categoryAndColour["\(story.0)"]
        
        cell.headlineLabel.text = story.0
        cell.headlineLabel.textColor = headlineColour
        cell.descriptionLabel.text = story.1
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return storiesArray.count
       
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -kTableHeaderHeight , width: myTableView.bounds.width, height: kTableHeaderHeight)
        if myTableView.contentOffset.y < -kTableHeaderHeight {
            headerRect.origin.y = myTableView.contentOffset.y
            headerRect.size.height = -myTableView.contentOffset.y
        }
        headerView.frame = headerRect
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }


}

