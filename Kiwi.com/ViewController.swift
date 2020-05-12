//
//  ViewController.swift
//  Kiwi.com
//
//  Created by Martin Kurbel on 07/05/2020.
//  Copyright © 2020 Martin Kurbel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let pageControl = UIPageControl()
    
    private var flightsModel: FlightsModel? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor  = .white
        
        collectionView.delegate = self
        collectionView.dataSource = self
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        setupViews()
        
        let api = FlightsApi()
        
        weak var welf = self
        api.getFlights(flyFrom: "SK", dateFrom: "01/01/2020", dateTo: "01/12/2020", limit: 5) { (result) in
            switch result {
            case .success(let flights):
                welf?.flightsModel = flights
                welf?.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollPosition = scrollView.contentOffset.x / view.width
        pageControl.currentPage = Int(scrollPosition)
    }
    
    private func setupViews() {
        
        collectionView.backgroundColor = .white
        
        collectionView.register(FlightOfferCell.self, forCellWithReuseIdentifier: FlightOfferCell.className)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.pinEdges(to: self.view)
        
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControl.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

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
        return CGSize(width: view.width, height: view.height)
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
}
