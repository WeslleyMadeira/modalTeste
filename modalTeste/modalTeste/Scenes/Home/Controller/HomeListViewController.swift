//
//  HomeListViewController.swift
//  modalTeste
//
//  Created by Weslley Madeira on 24/01/20.
//  Copyright © 2020 Weslley Madeira. All rights reserved.
//

import UIKit
import RxSwift

class HomeListViewController: UIViewController {
    
    @IBOutlet weak var collectionViewRepositorys: UICollectionView!
    @IBOutlet weak var indicatorLoading: UIActivityIndicatorView!
    
    var viewModel: HomeListViewModel?
    
    private var disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        self.bindToViewModel()
    }
    
    func setupUI() {
        self.navigationController?.applyBarStyle()
        self.navigationController?.configTitleTextWhite()
        self.view.backgroundColor = UIColor.backgroundColor
        self.collectionViewRepositorys.backgroundColor = UIColor.backgroundColor
        navigationItem.title = "Git Hub"
        
        let nib = UINib(nibName: "RepositoryCollectionViewCell", bundle: nil)
        self.collectionViewRepositorys.register(nib, forCellWithReuseIdentifier: "repositoryCollectionViewCell")
        collectionViewRepositorys.rx.setDelegate(self).disposed(by: disposeBag)
    }
    
    func bindToViewModel() {
        viewModel?.repositorysDriver
            .drive(collectionViewRepositorys.rx.items(cellIdentifier: "repositoryCollectionViewCell", cellType: RepositoryCollectionViewCell.self)) { collection , row , cell in
        }.disposed(by: disposeBag)
        
        collectionViewRepositorys.rx.contentOffset.subscribe {
            if HomeListViewController.isNearTheBottomEdge(contentOffset: $0.element!, self.collectionViewRepositorys) {
                self.viewModel?.checkBootomView.onNext(())
            }
        }.disposed(by: disposeBag)
        
        viewModel?.isLoading
            .observeOn(MainScheduler.instance)
            .bind(to: indicatorLoading.rx.isAnimating)
            .disposed(by: disposeBag)

        viewModel?.isLoading
            .observeOn(MainScheduler.asyncInstance)
            .subscribe(onNext: { [weak self] in
                self?.collectionViewRepositorys.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: $0 ? 50 : 0, right: 0)
            })
            .disposed(by: disposeBag)
    }
    
    static let startLoadingOffset: CGFloat = 20.0
    
    static func isNearTheBottomEdge(contentOffset: CGPoint, _ collectionView: UICollectionView) -> Bool {
          return contentOffset.y + collectionView.frame.size.height + startLoadingOffset > collectionView.contentSize.height
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}

extension HomeListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 32, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    }
}
