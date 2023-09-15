//
//  UIView-extension.swift
//  Oudest
//
//  Created by mazen baddad on 9/15/23.
//

import UIKit

extension UIView {
    
    enum AxisAnchor {
        case leading(_ axis: NSLayoutXAxisAnchor, constant: CGFloat = 0)
        case trailing(_ axis: NSLayoutXAxisAnchor, constant: CGFloat = 0)
        case top(_ axis: NSLayoutYAxisAnchor, constant: CGFloat = 0)
        case bottom(_ axis: NSLayoutYAxisAnchor, constant: CGFloat = 0)
        case centerX(_ axis: NSLayoutXAxisAnchor, constant: CGFloat = 0)
        case centerY(_ axis: NSLayoutYAxisAnchor, constant: CGFloat = 0)
        case height(_ constant: CGFloat)
        case width(_ constant: CGFloat)
    }
    
    func anchor(axisAnchors: AxisAnchor...) {
        self.translatesAutoresizingMaskIntoConstraints = false
        for axis in axisAnchors {
            switch axis {
            case .leading(let axis, let constant):
                self.leadingAnchor.constraint(equalTo: axis, constant: constant).isActive = true
            case .trailing(let axis, let constant):
                self.trailingAnchor.constraint(equalTo: axis, constant: constant).isActive = true
            case .top(let axis, let constant):
                self.topAnchor.constraint(equalTo: axis, constant: constant).isActive = true
            case .bottom(let axis, let constant):
                self.bottomAnchor.constraint(equalTo: axis, constant: constant).isActive = true
            case .centerX(let axis, let constant):
                self.centerXAnchor.constraint(equalTo: axis, constant: constant).isActive = true
            case .centerY(let axis, let constant):
                self.centerYAnchor.constraint(equalTo: axis, constant: constant).isActive = true
            case .height(let constant):
                self.heightAnchor.constraint(equalToConstant: constant).isActive = true
            case .width(let constant):
                self.widthAnchor.constraint(equalToConstant: constant).isActive = true
            }
        }
    }
    
}
