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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePickerDepart.minimumDate = Date()
        datePickerReturn.minimumDate = Date()
        print("datePickerDepart \(datePickerDepart.date)")
        print("datePickerReturn \(datePickerReturn.date)")
        
    }
    
    func getDateFromPicker(picker: UIDatePicker) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let data = formatter.string(from: picker.date)
        print(data)
        return data
    }
    
    func setLabel(label: UILabel) {
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 13)
    }
    @IBAction func departDate(_ sender: Any) {
        Session.shared.departAt = getDateFromPicker(picker: datePickerDepart)
        setLabel(label: labelDepart)
    }
    
    @IBAction func returnTicketNO(_ sender: Any) {
        if datePickerReturn.isHidden {
            datePickerReturn.isHidden = false
            labelReturn.isHidden = false
//            noReturnTicket.setTitle("Обратный билет не нужен", for: .normal)
        }
        else {
            datePickerReturn.isHidden = true
            labelReturn.isHidden = true
//            noReturnTicket.setTitle("Выбрать обратный билет", for: .normal)
//            noReturnTicket.titleLabel?.font = .systemFont(ofSize: 14)
        }
        
    }
    
    @IBAction func returnDate(_ sender: Any) {
        Session.shared.returnAt = getDateFromPicker(picker: datePickerReturn)
        setLabel(label: labelReturn)
    }
    
    @IBAction func presentAvia(_ sender: Any) {
        if getDateFromPicker(picker: datePickerReturn) == getDateFromPicker(picker: datePickerDepart) {
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

