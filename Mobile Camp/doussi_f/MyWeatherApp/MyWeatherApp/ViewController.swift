//
//  ViewController.swift
//  MyWeatherApp
//
//  Created by Florian DOUSSIN on 09/05/2016.
//  Copyright © 2016 Florian DOUSSIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
    WeatherGetterDelegate,
    UITextFieldDelegate
{
    //Labels du front
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cloudCoverLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var rainLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var getCityWeatherButton: UIButton!
    
    
    var weather: WeatherGetter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //background de base
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Paris.jpg")!)

        weather = WeatherGetter(delegate: self)

        //Start des labels
        cityLabel.text = "MyWeatherApp"
        weatherLabel.text = ""
        temperatureLabel.text = ""
        cloudCoverLabel.text = ""
        windLabel.text = ""
        rainLabel.text = ""
        humidityLabel.text = ""
        cityTextField.text = ""
        pressureLabel.text = ""
        iconLabel.text = ""
        cityTextField.placeholder = "Entrez le nom de la ville"
        cityTextField.delegate = self
        cityTextField.enablesReturnKeyAutomatically = true
        getCityWeatherButton.enabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Action du bouton afficher la météo de la ville
    
    @IBAction func getWeatherForCityButtonTapped(sender: UIButton) {
        guard let text = cityTextField.text where !text.isEmpty else {
            return
        }
        weather.getWeather(cityTextField.text!.urlEncoded)
    }
    func didGetWeather(weather: Weather) {
        // Appel asynchrone
            dispatch_async(dispatch_get_main_queue()) {
            self.cityLabel.text = weather.city
            self.weatherLabel.text = weather.weatherDescription
            self.temperatureLabel.text = "\(Int(round(weather.tempCelsius)))°"
            self.cloudCoverLabel.text = "\(weather.cloudCover)%"
            self.windLabel.text = "\(weather.windSpeed) m/s"
            self.pressureLabel.text = "\(weather.pressure)"
            self.iconLabel.text = "\(weather.weatherIconID)"
            
                //Affiche dynamique SOLEIL N1
                if self.iconLabel.text == "01d" {
                    //background
                    self.view.backgroundColor = UIColor(patternImage: UIImage(named: "soleil.jpg")!)
                    //logo dynamique
                    if let url  = NSURL(string: "http://openweathermap.org/img/w/01d.png"),
                        data = NSData(contentsOfURL: url)
                    {
                        self.imageView.image = UIImage(data: data)
                    }
                }
                //Affiche dynamique ECLARCIE N2
                if self.iconLabel.text == "02d" {
                    //background
                    self.view.backgroundColor = UIColor(patternImage: UIImage(named: "semicloud.jpg")!)
                    //logo dynamique
                    if let url  = NSURL(string: "http://openweathermap.org/img/w/02d.png"),
                        data = NSData(contentsOfURL: url)
                    {
                        self.imageView.image = UIImage(data: data)
                    }
                }
                //Affichage dynamique NUAGES MODERES N3
                if self.iconLabel.text == "03d" {
                    //background
                    self.view.backgroundColor = UIColor(patternImage: UIImage(named: "nuages.jpg")!)
                    //logo dynamique
                    if let url  = NSURL(string: "http://openweathermap.org/img/w/03d.png"),
                        data = NSData(contentsOfURL: url)
                    {
                        self.imageView.image = UIImage(data: data)
                    }
                }
                //Affichage dynamique GROS NUAGES N4
                if self.iconLabel.text == "04d" {
                    //background
                    self.view.backgroundColor = UIColor(patternImage: UIImage(named: "grosnuage.jpg")!)
                    //logo dynamique
                    if let url  = NSURL(string: "http://openweathermap.org/img/w/04d.png"),
                        data = NSData(contentsOfURL: url)
                    {
                        self.imageView.image = UIImage(data: data)
                    }
                }
                //Affichage dynamique GROSSE PLUIE N5
                if self.iconLabel.text == "09d" {
                    //background
                    self.view.backgroundColor = UIColor(patternImage: UIImage(named: "pluie.jpg")!)
                    //logo dynamique
                    if let url  = NSURL(string: "http://openweathermap.org/img/w/09d.png"),
                        data = NSData(contentsOfURL: url)
                    {
                        self.imageView.image = UIImage(data: data)
                    }
                }
                //Affichage dynamique PLUIE + ECLAIRCIES N6
                if self.iconLabel.text == "10d" {
                    //background
                    self.view.backgroundColor = UIColor(patternImage: UIImage(named: "pluiefine.jpg")!)
                    //logo dynamique
                    if let url  = NSURL(string: "http://openweathermap.org/img/w/10d.png"),
                        data = NSData(contentsOfURL: url)
                    {
                        self.imageView.image = UIImage(data: data)
                    }
                }
                //Affichage dynamique ORAGES N7
                if self.iconLabel.text == "11d" {
                    //background
                    self.view.backgroundColor = UIColor(patternImage: UIImage(named: "storm.jpg")!)
                    //logo dynamique
                    if let url  = NSURL(string: "http://openweathermap.org/img/w/11d.png"),
                        data = NSData(contentsOfURL: url)
                    {
                        self.imageView.image = UIImage(data: data)
                    }
                }
                //Affichage dynamique NEIGE N8
                if self.iconLabel.text == "13d" {
                    //background
                    self.view.backgroundColor = UIColor(patternImage: UIImage(named: "snow.jpg")!)
                    //logo dynamique
                    if let url  = NSURL(string: "http://openweathermap.org/img/w/13d.png"),
                        data = NSData(contentsOfURL: url)
                    {
                        self.imageView.image = UIImage(data: data)
                    }
                }
                //Affichage dynamique BROUILLARD N9
                if self.iconLabel.text == "50d" {
                    //background
                    self.view.backgroundColor = UIColor(patternImage: UIImage(named: "mist.jpg")!)
                    //logo dynamique
                    if let url  = NSURL(string: "http://openweathermap.org/img/w/50d.png"),
                        data = NSData(contentsOfURL: url)
                    {
                        self.imageView.image = UIImage(data: data)
                    }
                }
                //Fin affichage
            if let rain = weather.rainfallInLast3Hours {
                self.rainLabel.text = "\(rain) mm"
            }
            else {
                self.rainLabel.text = "None"
            }
            
            self.humidityLabel.text = "\(weather.humidity)%"
        }
    }
    
    func didNotGetWeather(error: NSError) {
        // Gestion erreur
        dispatch_async(dispatch_get_main_queue()) {
            self.showSimpleAlert(title: "Impossible de recevoir les infos météo",
                                 message: "Le service météo ne répond pas.")
        }
        print("Ne peut pas recevoir le temps: \(error)")
    }
    
    // Regex
    func textField(textField: UITextField,
                   shouldChangeCharactersInRange range: NSRange,
                                                 replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        let prospectiveText = (currentText as NSString).stringByReplacingCharactersInRange(
            range,
            withString: string)
        getCityWeatherButton.enabled = prospectiveText.characters.count > 0
        print("Caractères: \(prospectiveText.characters.count)")
        return true
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        textField.text = ""
        
        getCityWeatherButton.enabled = false
        return true
    }
    //bouton retour = refresh
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        getWeatherForCityButtonTapped(getCityWeatherButton)
        return true
    }
    
    //Debug
    
    func showSimpleAlert(title title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .Alert
        )
        let okAction = UIAlertAction(
            title: "OK",
            style:  .Default,
            handler: nil
        )
        alert.addAction(okAction)
        presentViewController(
            alert,
            animated: true,
            completion: nil
        )
    }
    
}

extension String {
    
    // Encodage URL de l'API
    var urlEncoded: String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLUserAllowedCharacterSet())!
    }
    
}