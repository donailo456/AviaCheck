//
//  AviaViewController.swift
//  Aviaseils
//
//  Created by Danil Komarov on 02.08.2023.
//

import UIKit

class AviaViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: AviaViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CustomTableCell.self, forCellReuseIdentifier: CustomTableCell.identifaire)
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
    }
    @objc func loadList(notification: NSNotification){
        //load data here
        self.tableView.reloadData()
    }
    
}

extension AviaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableCell.identifaire, for: indexPath) as? CustomTableCell else { fatalError()
        }
        let comment = presenter.comments?[indexPath.row]
        cell.configure(with: comment!)
        
        return cell
    }
    
    
}
extension AviaViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}

extension AviaViewController: AviaViewProtocol {
    func success() {
        print("ok")
        tableView.reloadData()
    }
    
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
}
