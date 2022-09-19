//
//  MainTableViewCell.swift
//  AdastraTestTask
//
//  Created by Aleksandr on 19.09.2022.
//

import UIKit

final class MainTableViewCell: UITableViewCell {
    // MARK: - Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var contentVerticalStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.alignment = .fill
        $0.spacing = 4
        $0.distribution = .fill
        $0.axis = .vertical
        return $0
    }(UIStackView(arrangedSubviews: [titleLabel, dateLabel]))
    
    private let constantContraint: CGFloat = 4
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(contentVerticalStackView)
        
        NSLayoutConstraint.activate([
            contentVerticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: constantContraint),
            contentVerticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -constantContraint),
            contentVerticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -constantContraint),
            contentVerticalStackView.topAnchor.constraint(equalTo: topAnchor, constant: constantContraint)
        ])
    }
    
    func configureCell(cat: Cat) {
        dateLabel.text = cat.createdAt
        titleLabel.text = cat.text
    }
}
