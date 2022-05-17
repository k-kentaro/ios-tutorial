//
//  UserDefaultsViewController.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/10.
//

import UIKit

final class UserDefaultsViewController: UIViewController {

    var birthdayTextField: UITextField?
    var toolBar: UIToolbar!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var ageLabel: UILabel!
    @IBOutlet private weak var birthdayLabel: UILabel!

    @IBOutlet private weak var floatingActionButton: UIButton! {
        didSet {
            floatingActionButton.layer.cornerRadius = 35
            floatingActionButton.layer.shadowOpacity = 0.7
            floatingActionButton.layer.shadowRadius = 3
            floatingActionButton.layer.shadowColor = UIColor.black.cgColor
            floatingActionButton.layer.shadowOffset = CGSize(width: 5, height: 5)
            floatingActionButton.addTarget(self, action: #selector(tappedFloatingButton), for: .touchUpInside)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = UserDefaults.standard.data(forKey: UserDefaults.standard.data),
              let dataModel = try? jsonDecoder.decode(DataModel.self, from: data) else {
            return
        }
        self.nameLabel.text = dataModel.name
        self.ageLabel.text = dataModel.age?.description
        self.birthdayLabel.text = dataModel.birthday
    }

    
    @objc func tappedFloatingButton(){
        let alert = UIAlertController(title: "登録",
                                      message: nil,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        alert.addTextField { (textField) in
            textField.placeholder = "名前"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "年齢"
        }
        alert.addTextField { (textField) in

            self.birthdayTextField = textField
            textField.placeholder = "誕生日"
        }

        
        guard let nameTextField = alert.textFields?[0],
              let ageTextField = alert.textFields?[1],
              let birthdayTextField = alert.textFields?[2] else {
            return
        }

        
        setupToolbar(text: birthdayTextField)
        setupBirthdayDatePicker(text: birthdayTextField)

        alert.addAction(UIAlertAction(title: "保存", style: .default, handler: { [weak self] (ac) in

            guard let age = ageTextField.text else {
                return
            }
            let result = Validator.shared.validateUserInfo(name: nameTextField.text, age: Int(age), birthday: birthdayTextField.text)
            

            if result.isValid {
                let dataModel = DataModel(name: nameTextField.text, age: Int(age), birthday: birthdayTextField.text)
                let jsonEncoder = JSONEncoder()
                jsonEncoder.keyEncodingStrategy = .convertToSnakeCase
                guard let data = try? jsonEncoder.encode(dataModel) else {
                    return
                }
                UserDefaults.standard.set(data, forKey: UserDefaults.standard.data)
                self?.viewDidLoad()
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

extension UserDefaultsViewController {

    func setupToolbar(text: UITextField) {
        toolBar = UIToolbar()
        toolBar.sizeToFit()
        let toolBarButton = UIBarButtonItem(title: "DONE", style: .plain, target: self, action: #selector(doneButton))
        toolBar.items = [toolBarButton]
        text.inputAccessoryView = toolBar
    }

    func setupBirthdayDatePicker(text: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.height, height: 100)
        datePickerView.datePickerMode = UIDatePicker.Mode.date
        datePickerView.preferredDatePickerStyle = .wheels
        text.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(didSelectDate(sender:)), for: UIControl.Event.valueChanged)
    }

    
    @objc func didSelectDate(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日"
        birthdayTextField?.text = dateFormatter.string(from: sender.date)
    }

    @objc func doneButton(){
        birthdayTextField?.resignFirstResponder()
    }
}
