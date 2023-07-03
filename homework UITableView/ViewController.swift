//
//  ViewController.swift
//  homework UITableView
//
//  Created by Ilya Pogozhev on 03.07.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    var list = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScene()
        makeConstraints()
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.contentView.backgroundColor = .systemGray3
        cell.contentView.layer.borderColor = UIColor.black.cgColor
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            list.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    }
    
}
private extension ViewController {
    func setupScene() {
        view.addSubview(tableView)
        tableView.backgroundColor = .systemGray2
        let barButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCell))
        navigationItem.rightBarButtonItem = barButton
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Task")
        tableView.delegate = self
        tableView.dataSource = self
        title = "Список задач"
    }
    func makeConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    @objc func addCell() {
        print("add tap")
        let alert = UIAlertController(title: "Планировщик", message: "Введите новую задачу", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Задача ..."
        }
        let okAction = UIAlertAction(title: "Добавить", style: .default) { [weak self] (_) in
            if let newTask = alert.textFields?.first?.text {
                self?.list.append(newTask)
                self?.tableView.reloadData()
            }
        }
        let cancelAction = UIAlertAction(title: "Назад", style: .cancel)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
}



