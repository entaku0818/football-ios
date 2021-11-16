//
//  SearchViewController.swift
//  football-iOS
//
//  Created by endo on 2021/10/28.
//  Copyright © 2021 endo. All rights reserved.
//

import UIKit

protocol SearchView: AnyObject {
    func updateTeams(_ teams:[SearchResult] )
    func showErrorAlert()
    func showEmpty()
    func hiddenEmpty()
}

final class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    var presenter: SearchViewPresentation!

    private var results: [SearchResult] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    @IBOutlet weak var emptyMessage: UILabel!
    @IBOutlet weak var emptyView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(UINib.init(nibName: "TeamCell", bundle: nil), forCellWithReuseIdentifier: "TeamCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self
        presenter.viewDidLoad()

        let layout = UICollectionViewCompositionalLayout() {
          [weak self] sectionIndex, layoutEnvironment in
            guard let self = self else { return nil }

            // @todo: add custom layout sections for various sections

            let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
            let section = NSCollectionLayoutSection.list(using: configuration, layoutEnvironment: layoutEnvironment)
            return section
        }
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
}

extension SearchViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        searchBar.endEditing(true)
        presenter.searchButtonDidPush(searchText: searchBar.text ?? "")
    }

}

extension SearchViewController: SearchView {
    func updateTeams(_ teams:[SearchResult] ) {
        self.results = teams
        if results.isEmpty {
            showEmpty()
        }else{
            hiddenEmpty()
        }
    }

    func showErrorAlert() {

    }

    func showEmpty() {
        emptyView.isHidden = false
        emptyMessage.text = "検索結果はありません"
        emptyMessage.textColor = .black
    }
    func hiddenEmpty() {
        emptyView.isHidden = true
    }
}


extension SearchViewController: UICollectionViewDelegate {

}
extension SearchViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.results.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let team:SearchResultTeam = results[indexPath.row].team

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamCell", for: indexPath) as! TeamCell
        cell.team = team


        return cell
    }

    // セルをタップした時に呼ばれる
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("セルを押しました")
    }
}
