//
//  ActivityViewController.swift
//  Notebook
//
//  Created by Egor Slobodskoy on 12.01.2022.
//

import UIKit

final class ActivityViewController: UIViewController {
    
    private var activityViewModel = ActivityViewModelImpl()
    
    let tableView = UITableView(frame: .zero, style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLayout(with: self.view.frame.size)
        setupUI()
        setupTableView()
    }
    
    private func setupUI() {
        self.view.backgroundColor = .white
        navigationItem.title = "Birthday"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.addSubview(self.tableView)
    }
    
    private func setupTableView() {
        self.tableView.register(ActivityTableViewCell.self, forCellReuseIdentifier: "ActivityTableViewCell")
//        tableView.separatorStyle = .none
        tableView.clipsToBounds = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = ActivityConstants.cellHeight
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { (contex) in
            self.updateLayout(with: size)
        }, completion: nil)
    }
    

    private func updateLayout(with size: CGSize) {
        self.tableView.frame = CGRect(origin: .zero, size: size)
    }
    
}

extension ActivityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
            case self.tableView:
                return self.activityViewModel.data.count
            default:
                return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ActivityTableViewCell", for: indexPath) as! ActivityTableViewCell
        cell.nameLabel.text = activityViewModel.data[indexPath.row]
        return cell
    }
}

extension ActivityViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Yay!", message: "You selected row number \(indexPath.row)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

