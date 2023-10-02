//
//  ViewController.swift
//  Aviaseils
//
//  Created by Danil Komarov on 20.07.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainViewPresenterProtocol!
    var networkSerivceProtocol: NetworkServiceProtocol!
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var datePickerDepart: UIDatePicker!
    @IBOutlet weak var datePickerReturn: UIDatePicker!
    @IBOutlet weak var labelDepart: UILabel!
    @IBOutlet weak var labelReturn: UILabel!
    @IBOutlet weak var noReturnTicket: UIButton!
    
    @IBOutlet weak var originTextField: UITextField!
    @IBOutlet weak var distanationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePickerDepart.minimumDate = Date()
        datePickerReturn.minimumDate = Date()
        datePickerReturn.alpha = 0.3
        datePickerReturn.isEnabled = false
        print("datePickerDepart \(datePickerDepart.date)")
        print("datePickerReturn \(datePickerReturn.date)")
    }
    
    func setLabel(label: UILabel) {
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 13)
    }
    
    
  
    @IBAction func distanationTextFieldAction(_ sender: UITextField) {
        Info.shared.destanation = sender.text
    }
    
    
    @IBAction func originTextFieldAction(_ sender: UITextField) {
        Info.shared.origin = sender.text
    }
    
    
    @IBAction func departDate(_ sender: Any) {
        Info.shared.departAt = presenter.dateFormatter(picker: datePickerDepart)
        datePickerReturn.isEnabled = true
        datePickerReturn.alpha = 1
    }
    
    @IBAction func returnDate(_ sender: Any) {
        Info.shared.returnAt = presenter.dateFormatter(picker: datePickerReturn)
    }
    
    @IBAction func presentAvia(_ sender: Any) {
        if presenter.dateFormatter(picker: datePickerReturn) == presenter.dateFormatter(picker: datePickerDepart) || Info.shared.origin == "" || Info.shared.destanation == ""  {
            let alert = UIAlertController(title: "Ошибка", message: "Проверьте правильность данных", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(alert, animated: true)
        }
        else {
            presenter.tapOnTheComment()
        }
    
    }
    
}

extension MainViewController: MainViewProtocol {
    func success() {
        print("ok")
    }
    
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
}

