//
//  TableViewController2.swift
//  emoji
//
//  Created by Rizayev Nematzhon on 3/4/21.
//

import UIKit

class TableViewController2: UITableViewController {
    var objects = [
        Emoji(emoji: "🥰", title:"Love", text: "Lets love each other",isFavorite: false),
        Emoji(emoji: "⚽️", title:"Football", text: "Lets play football",isFavorite: false),
        Emoji(emoji: "🏀", title:"Basketball", text: "Lets play basketball",isFavorite: false)
    
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewDelegates()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }

}
    extension TableViewController2{
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return objects.count
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
            let cell = tableView.dequeueReusableCell(withIdentifier: "emojiCell", for:indexPath) as! emojiTableViewCell
            let object = objects[indexPath.row]
            cell.emojiView.text = object.emoji
            cell.titleView.text = object.title
            cell.textView.text = object.text
            
            return cell
        }
        
        override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
            return .delete
        }
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete{
                objects.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                
            }
        }
        
        override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
            return true
        }
        override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
            let moveEmoji = objects.remove(at: sourceIndexPath.row)
            objects.insert(moveEmoji, at: destinationIndexPath.row)
            tableView.reloadData()
        }
    }

        
    
