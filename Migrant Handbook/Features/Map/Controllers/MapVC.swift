//
//  MapVC.swift
//  Migrant Handbook
//
//  Created by Mairambek on 8/25/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import UIKit
import MapKit
import RxSwift
import FittedSheets

class MapVC: UIViewController {

    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var contactsView: UIView!

    private var countryPickerView = UIPickerView()
    private var cityPickerView = UIPickerView()
    let locationManager = CLLocationManager()

    private var disposeBag = DisposeBag()
    
    private var viewModel = MapViewModel()
    private var countries: [CountryResultModel] = []
    private var cities: [CityResultModel] = []

    private var selectedCountry: CountryResultModel? {
        didSet {
            if let country = selectedCountry {
                selectedCity = nil
                viewModel.getPolingPlaces(country: country.id)
                viewModel.getCities(id: country.id)
                countryTextField.text = country.title
            }
        }
    }
    
    private var selectedCity: CityResultModel? {
        didSet {
            if let city = selectedCity {
                viewModel.getPolingPlaces(city: city.id)
                cityTextField.text = city.title
            } else {
                cityTextField.text = LocalizationManager.sharedInstance.localizedStringForKey(key: "select_city", comment: "")
            }
        }
    }

    var polingPlaces: [PolingPlaceResultModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        subscribeBR()
        setupPickerView()
        viewModel.getCountries()
        viewModel.getCommonData()
        viewModel.getPolingPlaces()
    }
    
    @IBAction func openFacebookTapped(_ sender: UIButton) {
        openUrl(path: viewModel.commonDataBR.value.fbBot)
    }
    
    @IBAction func openTelegramTapped(_ sender: UIButton) {
        openUrl(path: viewModel.commonDataBR.value.tgBot)
    }
    
    @IBAction func openWhatsappTapped(_ sender: UIButton) {
        openUrl(path: viewModel.commonDataBR.value.whatsappBot)
    }
    
    private func openUrl(path: String) {
        if let url = URL(string: path), UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url)
        }
    }
    
    private func setupView() {
        mapView.delegate = self
        navigationItem.title = LocalizationManager.sharedInstance.localizedStringForKey(key: "maptext", comment: "")
        contactsView.dropShadow(with: UIColor(red: 0.251, green: 0.4,
                                              blue: 0.722, alpha: 0.15),
                                shadowOpacity: 1,
                                shadowRadius: 15,
                                shadowOffset: CGSize(width: 0, height: 11),
                                cornerRadius: 4)
    }
    
    private func setupPickerView() {
        countryPickerView.dataSource = self
        countryPickerView.delegate = self
        countryTextField.inputView = countryPickerView
        cityPickerView.delegate = self
        cityPickerView.dataSource = self
        cityTextField.inputView = cityPickerView
    }
    
    private
    func creatAnnotations(places: [PolingPlaceResultModel]){
        var annotations: [MKPointAnnotation] = []
        for place in places {
            let annotation = MKPointAnnotation()
            annotation.title = place.title
            annotation.coordinate = CLLocationCoordinate2D(latitude: place.latitude,
                                                           longitude: place.longitude)
            annotations.append(annotation)
        }

        mapView.addAnnotations(annotations)
        mapView.showAnnotations(annotations, animated: true)
        mapView.layoutMargins = UIEdgeInsets(top: 0, left: 100, bottom: 0, right: 60)
    }

    private func subscribeBR() {
        viewModel.polingPlacesBR.skip(1).subscribe(onNext: { (result) in
            self.polingPlaces.append(contentsOf: result)
            self.creatAnnotations(places: result)
        }).disposed(by: disposeBag)
        
        viewModel.countriesBR.skip(1).subscribe(onNext: { (result) in
            self.countries = result
            self.countryPickerView.reloadAllComponents()
        }).disposed(by: disposeBag)
        
        viewModel.errorBR.skip(1).subscribe(onNext: { (error) in
            Alert.showMessage(title: LocalizationManager.sharedInstance.localizedStringForKey(key: "error", comment: ""), message: error.localizedDescription)
        }).disposed(by: disposeBag)
                
        viewModel.citiesBR.skip(1).subscribe(onNext: { (result) in
            self.cities = result
            self.cityPickerView.reloadAllComponents()
        }).disposed(by: disposeBag)
    }
}

extension MapVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == countryPickerView {
            return countries.count + 1
        } else {
            return cities.count + 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == countryPickerView {
            if row == 0 {
                return LocalizationManager.sharedInstance.localizedStringForKey(key: "DTR_hq_i9T", comment: "")
            }
            return countries[row - 1].title
        } else {
            if row == 0 {
                return LocalizationManager.sharedInstance.localizedStringForKey(key: "LVW_dI_9xz", comment: "")
            }
            return cities[row - 1].title
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard row != 0 else { return }
        if pickerView == countryPickerView {
            guard !countries.isEmpty else { return }
            self.selectedCountry = countries[row - 1]
        } else {
            guard !cities.isEmpty else { return }
            self.selectedCity = cities[row - 1]
        }
    }
}


extension MapVC: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let place = polingPlaces.filter({ $0.title == view.annotation?.title }).first {
            let detailVC = UIStoryboard.createVC(controllerType: PolingPlaceDetailVC.self, storyboard: .main)
            detailVC.polingPlace = place
            let sheetController = SheetViewController(controller: detailVC,
                                                      sizes: [.fixed(400),.fullScreen])
            sheetController.setupSheetView()
            self.present(sheetController, animated: false)

        }
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if !(annotation is MKPointAnnotation) {
            return nil
        }
        
        let annotationIdentifier = "AnnotationIdentifier"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView!.canShowCallout = true
        }
        else {
            annotationView!.annotation = annotation
        }
        
        let pinImage = #imageLiteral(resourceName: "ic_round-add-location")
        annotationView!.image = pinImage
        
        return annotationView
    }

}
