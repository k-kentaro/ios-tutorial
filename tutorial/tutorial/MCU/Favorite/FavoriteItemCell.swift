//
//  FavoriteItemCell.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/25.
//

import UIKit

final class FavoriteItemCell: UITableViewCell {
    
    @IBOutlet private weak var coverImage: UIImageView!
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var releaseDate: UILabel!
    @IBOutlet private weak var phase: UILabel!
    @IBOutlet private weak var saga: UILabel!
    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    private let viewModel = MCUViewModel()
    var catchDataDelegate: CatchDataProtocol?
    var catchFavoriteDelegate: CatchFavoriteProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        favoriteButton.backgroundColor = .systemBlue
        favoriteButton.tintColor = .white
        favoriteButton.setTitle("", for: .normal)
        detailButton.addTarget(nil, action: #selector(tappedDetailButton), for: .touchUpInside)
        favoriteButton.addTarget(nil, action: #selector(tappedFavoriteButton), for: .touchUpInside)
    }
    
    func configure(model: MCUData) {
        guard let image = model.coverUrl else {
            return
        }
        let url = URL(string: image)
        coverImage.kf.setImage(with: url)
        title.text = model.title
        releaseDate.text = model.releaseDate
        
        if model.phase == nil {
            phase.text = "coming soon"
        } else {
            phase.text = "フェーズ\(model.phase ?? 0 )"
        }
        if model.saga == nil {
            saga.text = "coming soon"
        } else {
            saga.text = model.saga
        }
    }
    
    @objc func tappedDetailButton(_ sender: UIButton) {
        let row = sender.tag
        self.catchDataDelegate?.catchData(row: row)
    }
    
    @objc func tappedFavoriteButton(_ sender: UIButton) {
        let row = sender.tag
        self.catchFavoriteDelegate?.catchFavorite(row: row)
    }

}
