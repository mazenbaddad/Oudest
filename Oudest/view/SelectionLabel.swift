//
//  SelectionLabel.swift
//  Oudest
//
//  Created by mazen baddad on 9/16/23.
//

import UIKit

class SelectionLabel: SelectionView {
    
    var selectionTitleLabel: UILabel = UILabel()
    
    private var titleTexts: Dictionary<Bool,String> = [:]
    private var titleColors: Dictionary<Bool,UIColor> = [true: .label, false: .label]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSelectionTitleLabel()
    }
    
    private func setupSelectionTitleLabel() {
        selectionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(selectionTitleLabel)
        selectionTitleLabel.anchor(axisAnchors: .leading(self.leadingAnchor, constant: 8)
                                   , .bottom(self.bottomAnchor, constant: -8)
                                   , .trailing(self.trailingAnchor , constant: -8)
                                   , .top(self.topAnchor,constant: 8))
    }
    
    override func updateSelection() {
        super.updateSelection()
        self.selectionTitleLabel.textColor = titleColors[isSelected]
        self.selectionTitleLabel.text = titleTexts[isSelected] ?? titleTexts[!isSelected]
    }
    
    func setTitle(_ title: String, for selected: Bool) {
        self.titleTexts[selected] = title
        updateSelection()
    }
    
    func setTitle(color: UIColor, for selected: Bool) {
        self.titleColors[selected] = color
        updateSelection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
