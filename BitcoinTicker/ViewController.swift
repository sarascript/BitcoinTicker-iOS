//
//  ViewController.swift
//  BitcoinTicker
//


import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    var finalURL = ""

    //Pre-setup IBOutlets
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.currencyPicker.delegate = self
        self.currencyPicker.dataSource = self
    }

    
    //TODO: Place your 3 UIPickerView delegate methods here
    
    //Number of columns of data
    func numberOfComponents(in pickView: UIPickerView) -> Int {
        return 2
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }

    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyArray[row]
    }
    
    
    
    
//    
//    //MARK: - Networking URLSesion
//    /***************************************************************/
//    
        func getCurrency() {
              guard let url = URL(string: "") else {
                  print ("No hay url")
                  return
              }
              let urlRequest = URLRequest(url: url)
              //set up the session
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
              //make the request
                    let task = session.dataTask(with: urlRequest) { (data, response, error) in
                        guard error == nil else {
                        print(error)
                        return
                    }
                        guard let responseData = data else {
                        return
                    }
                    // parse the result as JSON, since that's what the API provides
                    do {
                        guard let todo = try JSONSerialization.jsonObject(with: responseData, options: [])
                        as? [String: Any] else {
                            print("error trying to convert data to JSON")
                            return
                        }
                        // now we have the todo
                        // let's just print it to prove we can access it
                        print("The todo is: " + todo.description)
                        // the todo object is a dictionary
                        // so we just access the title using the "title" key
                        // so check for a title and print it if we have one
                        guard let todoTitle = todo["title"] as? String else {
                            print("Could not get todo title from JSON")
                            return
                        }
                            print("The title is: " + todoTitle)
                        } catch  {
                            print("error trying to convert data to JSON")
                            return
                        }
                    }
                task.resume()
    }


}

