//
//  TodoViewController.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/19.
//

import RealmSwift
import UIKit

final class TodoViewController: UIViewController {
    private let todoCell = R.nib.todoCell.name
    private var todoModel: Results<ToDoModel>!
    var toolBar: UIToolbar!
    var fixedDateTextField: UITextField?

    @IBOutlet private weak var floatingActionButton: UIButton!
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: todoCell, bundle: nil), forCellReuseIdentifier: todoCell)
            tableView.delegate = self
            tableView.dataSource = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        floatingActionButton.layer.cornerRadius = 35
        floatingActionButton.layer.shadowOpacity = 0.7
        floatingActionButton.layer.shadowRadius = 3
        floatingActionButton.layer.shadowColor = UIColor.black.cgColor
        floatingActionButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        floatingActionButton.addTarget(self, action: #selector(tappedFloatingButton), for: .touchUpInside)

        guard let realm = try? Realm() else { return }
        todoModel = realm.objects(ToDoModel.self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    @objc func tappedFloatingButton() {
        let alert = UIAlertController(title: "登録", message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        alert.addTextField { (textField) in
            textField.placeholder = "タイトルを入力してください"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "内容を入力してください"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "期限を設定してください"
            self.fixedDateTextField = textField
        }

        guard let titleTextField = alert.textFields?[0],
              let contentsTextField = alert.textFields?[1],
              let fixedDateTextField = alert.textFields?[2] else {
            return
        }

        setupToolbar(text: fixedDateTextField)
        setupfixedDatePicker(text: fixedDateTextField)

        alert.addAction(UIAlertAction(title: "保存", style: .default, handler: { [weak self] (ac) in
            let result = TodoValidator.shared.validateTodoInfo(title: titleTextField.text, contents: contentsTextField.text, fixedDate: fixedDateTextField.text)

            if result.isValid {
                guard let realm = try? Realm() else { return }
                let todo = ToDoModel()
                todo.title = titleTextField.text
                todo.contents = contentsTextField.text
                todo.createDay = self?.nowDateCreate()
                todo.fixedDate = fixedDateTextField.text
                try? realm.write {
                    realm.add(todo)
                }
                self?.tableView.reloadData()
            } else {
                let alert = UIAlertController(title: "保存できません",
                                              message: result.errorMessage,
                                              preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self?.present(alert, animated: true, completion: nil)
            }
        }))
        present(alert, animated: true, completion: nil)
    }
}

extension TodoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if todoModel.isEmpty {
            tableView.backgroundColor = .clear
        } else {
            tableView.backgroundColor = .white
        }
        return todoModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: todoCell, for: indexPath) as? TodoCell else {
            return UITableViewCell()
        }
        let model = todoModel[indexPath.row]
        cell.configure(model: model)
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            guard let realm = try? Realm() else { return }
            try? realm.write {
                realm.delete(todoModel[indexPath.row])
            }
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
        }
    }
}

extension TodoViewController {
    func setupToolbar(text: UITextField) {
        toolBar = UIToolbar()
        toolBar.sizeToFit()
        let toolBarButton = UIBarButtonItem(title: "DONE", style: .plain, target: self, action: #selector(doneButton))
        toolBar.items = [toolBarButton]
        text.inputAccessoryView = toolBar
    }

    func setupfixedDatePicker(text: UITextField) {
        let datePickerView: UIDatePicker = UIDatePicker()
        datePickerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.height, height: 100)
        datePickerView.datePickerMode = UIDatePicker.Mode.date
        datePickerView.preferredDatePickerStyle = .wheels
        text.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(didSelectDate(sender:)), for: UIControl.Event.valueChanged)
    }

    @objc func didSelectDate(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        fixedDateTextField?.text = dateFormatter.string(from: sender.date)
    }

    @objc func doneButton() {
        fixedDateTextField?.resignFirstResponder()
    }

    func nowDateCreate() -> String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy/MM/dd", options: 0, locale: Locale(identifier: "ja_JP"))
        return dateFormatter.string(from: now)
    }
}
