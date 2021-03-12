//
//  Extension+UI.swift
//  emoji
//
//  Created by Rizayev Nematzhon on 3/3/21.
//

import UIKit

extension UIView{
    func pin(to superView:UIView){
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}

extension TableViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "emojiCell", for:indexPath) as! emojiTableViewCell
        let object = objects[indexPath.row]
        cell.emojiView.text = object.emoji
        cell.titleView.text = object.title
        cell.textView.text = object.text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moveEmoji = objects.remove(at: sourceIndexPath.row)
        objects.insert(moveEmoji, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let done = doneAction(at: indexPath)
        let fav = isFavourite(at: indexPath)
        return UISwipeActionsConfiguration(actions: [done,fav])
    }
    
    func doneAction(at indexPath:IndexPath) -> UIContextualAction{
        let action = UIContextualAction(style: .destructive, title: "Done") {(action,view,completion) in
        self.objects.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
        completion(true)
        }
        action.backgroundColor = .systemGreen
        return action
    }
    
    func isFavourite(at indexPath:IndexPath) -> UIContextualAction{
        var object = objects[indexPath.row]
        let action = UIContextualAction(style: .normal, title: "Favourite"){(action,view,completion) in
            object.isFavorite = !object.isFavorite
            self.objects[indexPath.row] = object
            completion(true)
        }
        action.backgroundColor = object.isFavorite ? .systemPurple : .systemGray
        return action
    }
        
    }
    


