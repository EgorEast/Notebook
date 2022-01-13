//
//  AddEventViewController.swift
//  Notebook
//
//  Created by Egor Slobodskoy on 13.01.2022.
//

import UIKit
// на протокол UIGestureRecognizerDelegate подписан из-за использования строчки ниже, применения которой не знаю
final class AddEventViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    let avatarAttributeView = AvatarAttributeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLayout(with: self.view.frame.size)
        setupUI()
        setupTableView()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { (contex) in
            self.updateLayout(with: size)
        }, completion: nil)
    }
    
    private func setupUI() {
        self.view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Добавить", style: .plain, target: nil, action: nil)
        let backBTN = UIBarButtonItem(
            image: nil,
            style: .plain,
            target: navigationController,
            action: #selector(UINavigationController.popViewController(animated:))
        )
        backBTN.title = "Отмена"
        navigationItem.leftBarButtonItem = backBTN
        
        // Не знаю для чего используется, но в ответе на вопрос изменения кнопки назад нужно было вставить
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        self.view.addSubview(self.tableView)
    }
    
    
    private func setupTableView() {
        self.tableView.register(AvatarAttributeTableViewCell.self, forCellReuseIdentifier: "AvatarAttributeTableViewCell")
//        tableView.separatorStyle = .none
        tableView.clipsToBounds = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = EventsConstants.cellHeight
        tableView.isScrollEnabled = false
    }
    

    private func updateLayout(with size: CGSize) {
        self.tableView.frame = CGRect(origin: .zero, size: size)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return avatarAttributeView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return AvatarAttributeConstantss.height
    }
    
}

extension AddEventViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
            case self.tableView:
                return 1
            default:
                return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "AvatarAttributeTableViewCell", for: indexPath) as! AvatarAttributeTableViewCell
        return cell
    }
    
}

extension AddEventViewController: UITableViewDelegate {
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Yay!", message: "You selected row number \(indexPath.row)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
