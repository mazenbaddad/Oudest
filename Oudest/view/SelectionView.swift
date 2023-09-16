//
//  SelectionView.swift
//  Oudest
//
//  Created by mazen baddad on 9/15/23.
//

import UIKit

class SelectionView : UIControl {
    
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
        updateSelection()
    }
    
    /// update selection view status
    func updateSelection() {
        self.backgroundColor = backgroundColors[isSelected]
    }
    
    @objc private func changeState() {
        _selected.toggle()
        sendActions(for: .valueChanged)
    }
    
    func setBackground(color: UIColor, for selected: Bool) {
        self.backgroundColors[selected] = color
        updateSelection()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
