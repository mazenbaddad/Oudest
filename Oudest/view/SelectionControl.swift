//
//  SelectionControl.swift
//  Oudest
//
//  Created by mazen baddad on 9/15/23.
//

import UIKit

class SelectionView : UIControl {
    
    var selectionTitleLabel: UILabel = UILabel()
    
    private var titleTexts: Dictionary<Bool,String> = [:]
    private var titleColors: Dictionary<Bool,UIColor> = [true: .label, false: .label]
    private var backgroundColors: Dictionary<Bool,UIColor> = [true: .systemBlue, false: .secondarySystemBackground]
    private var _selected: Bool = false {
        didSet {
            updateSelection()
        }
    }
    
    override var isSelected: Bool {
        get {
            return _selected
        } set {
            _selected = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    private func setupView() {
        self.addTarget(self, action: #selector(self.changeState), for: .touchUpInside)
        setupSelectionTitleLabel()
        updateSelection()
    }
    
    private func setupSelectionTitleLabel() {
        selectionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(selectionTitleLabel)
        selectionTitleLabel.anchor(axisAnchors: .leading(self.leadingAnchor, constant: 8)
                                   , .bottom(self.bottomAnchor, constant: -8)
                                   , .trailing(self.trailingAnchor , constant: -8)
                                   , .top(self.topAnchor,constant: 8))
    }
    
    private func updateSelection() {
        self.selectionTitleLabel.textColor = titleColors[isSelected]
        self.backgroundColor = backgroundColors[isSelected]
        self.selectionTitleLabel.text = titleTexts[isSelected] ?? titleTexts[!isSelected]
    }
    
    @objc private func changeState() {
        _selected.toggle()
        sendActions(for: .valueChanged)
    }
    
    func setTitle(color: UIColor, for selected: Bool) {
        self.titleColors[selected] = color
        updateSelection()
    }
    
    func setBackground(color: UIColor, for selected: Bool) {
        self.backgroundColors[selected] = color
        updateSelection()
    }
    
    func setTitle(_ title: String, for selected: Bool) {
        self.titleTexts[isSelected] = title
        updateSelection()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

