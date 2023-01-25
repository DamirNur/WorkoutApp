//
//  YAxisView.swift
//  WorkoutApp
//
//  Created by Damir Nuriev on 22.01.2023.
//

import UIKit

final class YAxisView: WABaseView {
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalSpacing
        return view
    }()
    
    func configure(with data: [WAChartsView.Data]) {
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        
        (0...9).reversed().forEach {
            let label = UILabel()
            label.font = R.Fonts.helvelticaRegular(with: 9)
            label.textColor = R.Colors.inactive
            label.textAlignment = .right
            label.text = "\($0 * 10)"  //TODO: - Remake to calculated interval
            
            stackView.addArrangedSubview(label)
        }
    }
}

extension YAxisView {
    override func setupViews() {
        super.setupViews()
        
        setupView(stackView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .clear
    }
}
