//
//  TableViewController.swift
//  emoji
//
//  Created by Rizayev Nematzhon on 3/4/21.
//

import UIKit

class TableViewController: UIViewController {
    
    var objects = [
        Emoji(emoji: "🥰", title:"Love", text: "Lets love each other",isFavorite: false),
        Emoji(emoji: "⚽️", title:"Football", text: "Lets play football",isFavorite: false),
        Emoji(emoji: "🏀", title:"Basketball", text: "Lets play basketball",isFavorite: false)
    
    ]
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        setTableViewDelegates()// set delegates
        tableView.rowHeight = 70//set row height
        tableView.register(emojiTableViewCell.self, forCellReuseIdentifier: "emojiCell")//register cell
        tableView.pin(to: view)//set consraint
        let addButton = UIBarButtonItem(title: "Add", style: UIBarButtonItem.Style.plain, target: self, action: #selector(addVC))
        navigationItem.rightBarButtonItem = addButton
        self.title = "Emoji table"

    }

    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    @objc func addVC(){
        let navVC = UINavigationController(rootViewController: AddEmojiVC())
        present(navVC, animated: true)
        
    }

    
    

}


