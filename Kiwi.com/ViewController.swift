//
//  ViewController.swift
//  Kiwi.com
//
//  Created by Martin Kurbel on 07/05/2020.
//  Copyright © 2020 Martin Kurbel. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    private let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let activityIndicator = UIActivityIndicatorView()
    private let actionButton = UIButton()
    private let pageControl = UIPageControl()
    
    private var locationManager: CLLocationManager?
    private var flightsModel: FlightsModel? = nil {
        didSet {
            collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor  = .white
        self.title = "Flight offers"
        
        setupViews()
        setupLocation()
        getData()
    }
    
    private func setupViews() {
        
        // collectionView Setup
        collectionView.delegate = self
        collectionView.dataSource = self
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        collectionView.backgroundColor = .white
        
        collectionView.register(FlightOfferCell.self, forCellWithReuseIdentifier: FlightOfferCell.className)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        
        self.view.addSubview(collectionView)
        self.view.addSubview(actionButton)
        self.view.addSubview(pageControl)
        
        collectionView.notAutoresizingMask()
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: actionButton.topAnchor)
        ])
        
        // activityIndicator Setup
        
        collectionView.addSubview(activityIndicator)
        activityIndicator.notAutoresizingMask()
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor)
        ])
        
        // actionButton Setup
        actionButton.backgroundColor = Color.kiwiGreen
        actionButton.layer.masksToBounds = false
        actionButton.layer.cornerRadius = 8
        
        actionButton.setTitleColor(.white, for: .normal)
        actionButton.setTitle("Let's explore", for: .normal)
        
        actionButton.notAutoresizingMask()
        NSLayoutConstraint.activate([
            actionButton.heightAnchor.constraint(equalToConstant: 44),
            actionButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
            actionButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            actionButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16)
        ])
        
        // pageControl Setup
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.numberOfPages = 5
        pageControl.currentPage = 0
        pageControl.notAutoresizingMask()
        
        pageControl.notAutoresizingMask()
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo: actionButton.bottomAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupLocation() {
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
    }
    
    private func getData() {
        
        activityIndicator.startAnimating()
        
        let today = Date()
        let dateFrom = today.dateForApi
        let dateTo = today.nextDayDate?.dateForApi ?? dateFrom
        
        weak var welf = self
        AppContext.shared.api.getFlights(flyFrom: "48.26-17.75-500km", dateFrom: dateFrom, dateTo: dateTo, limit: AppContext.shared.offerLimit) { (result) in
            switch result {
            case .success(let flights):
                welf?.flightsModel = flights
            case .failure(let error):
                print(error)
            }
            
            welf?.activityIndicator.stopAnimating()
        }
    }
    
    private func showNeedLocationAlert() {
        
        let alert = UIAlertController(title: "Location", message: "Please allow location so we can find best flight for your location", preferredStyle: .alert)
        
        weak var welf = self
        alert.addAction(UIAlertAction(title: "Settings", style: .default, handler: { action in
            welf?.openSettings()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        self.present(alert, animated: true)
    }
    
    private func openSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url)
        }
    }
}

// MARK: UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return flightsModel?.flights.count ?? 0
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlightOfferCell.className, for: indexPath)
        if let cell = cell as? FlightOfferCell {
            cell.flight = flightsModel?.flights[indexPath.row]
        }
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = view.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom - pageControl.height - actionButton.height
        return CGSize(width: view.width, height: height)
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
}

// MARK: UIScrollViewDelegate
extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.stoppedScrolling(scrollView)
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            self.stoppedScrolling(scrollView)
        }
    }

    func stoppedScrolling(_ scrollView: UIScrollView) {
        let scrollPosition = scrollView.contentOffset.x / view.width
        pageControl.currentPage = Int(scrollPosition)
    }
}

// MARK: CLLocationManagerDelegate
extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
            break
        case .authorizedWhenInUse:
            manager.startUpdatingLocation()
            break
        case .restricted:
            break
        case .denied:
            showNeedLocationAlert()
            break
        default:
            break
        }
    }
}
