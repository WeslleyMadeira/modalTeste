//
//  RepositoryCollectionViewCell.swift
//  modalTeste
//
//  Created by Weslley Madeira on 25/01/20.
//  Copyright © 2020 Weslley Madeira. All rights reserved.
//

import UIKit
import RxSwift

class RepositoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelNameRepository: UILabel!
    @IBOutlet weak var labelTitleAllStar: UILabel!
    @IBOutlet weak var labelCountStar: UILabel!
    
    @IBOutlet weak var labelWatchers: UILabel!
    @IBOutlet weak var labelWatchersFirst: UILabel!
    @IBOutlet weak var labelQTDDays: UILabel!
    
    @IBOutlet weak var imageRepository: UIImageView!
    
    @IBOutlet weak var viewBackgroundCell: UIView!
    @IBOutlet weak var viewBar: UIView!
    
    var disposeBag = DisposeBag()
    
    override func prepareForReuse() {
        self.imageRepository.image = UIImage()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bindData(repository: Repository, index: Int) {
        labelWatchersFirst.text = repository.watchersCount.formatnumber()
        labelNameRepository.text = repository.fullName.uppercased()
        labelCountStar.text = repository.stargazersCount.formatnumber()
        labelWatchers.text = repository.watchersCount.formatnumber()
        labelQTDDays.text = "\(Date.dateToNumberDays(date: repository.creatAt).formatnumber()) dias"
        
        if let urlString = repository.owner.avatarImage , let _ = URL(string: urlString) {
            NetworkService().showImageForUrl(url: urlString).bind(to: imageRepository.rx.image).disposed(by: disposeBag)
        }
        
        self.setColorByIndex(at: index)
    }
    
    private func setColorByIndex(at index: Int) {
        if index % 2 == 0 {
            setBlackColor()
        } else {
            setWhiteColor()
        }
    }
    
    private func setWhiteColor() {
        self.viewBackgroundCell.backgroundColor = .whiteColor
        self.viewBar.backgroundColor = .barGrayColor
        self.labelTitleAllStar.textColor = .blackColorNavigation
        self.labelCountStar.textColor = .blackColorNavigation
        self.labelNameRepository.textColor = .blackColorNavigation
    }
    
    private func setBlackColor() {
        self.viewBackgroundCell.backgroundColor = .barGrayBoldColor
        self.viewBar.backgroundColor = .blackColorNavigation
        self.labelTitleAllStar.textColor = .whiteColor
        self.labelCountStar.textColor = .whiteColor
        self.labelNameRepository.textColor = .whiteColor
    }
}
