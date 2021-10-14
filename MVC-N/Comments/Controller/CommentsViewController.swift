//
//  ViewController.swift
//  MVC-N
//
//  Created by Sergey Lobanov on 13.10.2021.
//

import UIKit

class CommentsViewController: UIViewController {

    var comments = [Comment]()
    @IBOutlet weak private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        CommentNetworkService.getComment { response in
            self.comments = response.comments
            self.tableView.reloadData()
        }
    }

    @objc func buttonAction() {
        print("action")
    }
}

// MARK: - UITableViewDelegate
extension CommentsViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource
extension CommentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CommentCell
        cell.configure(with: comments[indexPath.row])
        return cell
    }
}
