//
//  addViewController.swift
//  emoji
//
//  Created by Rizayev Nematzhon on 3/5/21.
//

import UIKit

class addViewController: UIViewController{
    
    
    let tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.pin(to: view)
        title = "Add New Emoji"
        view.backgroundColor = .white
        setTableViewDelegates()
        buttons()

    }
    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func buttons(){
        let saveButton = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.plain, target: self, action: #selector(SaveEmoji))
        navigationItem.rightBarButtonItem = saveButton
        let CancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(CancelEmoji))
        navigationItem.leftBarButtonItem = CancelButton
    }
    @objc func SaveEmoji(){
        
    }
    
    @objc func CancelEmoji(){
        dismiss(animated: true, completion: nil)
    }
    
}

extension addViewController: UITableViewDelegate,UITableViewDataSource{
    
    
    // Return the number of sections
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    // Return the number of rows for each section in your static table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Return the row for the corresponding section and row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    // Customize the section headings for each section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "profile"
    }
    

    
    
}

