//
//  LNSMagnifierView.swift
//  LNSMagnifierView
//
//  Created by linus on 2020/8/23.
//  Copyright © 2020 linusling. All rights reserved.
//

import UIKit
import QuartzCore

final public class LNSMagnifierView: UIView {
    
    fileprivate var viewToMagnify: UIView?
    fileprivate var scale: CGFloat = 2.0
    fileprivate var offsetX: CGFloat = 0.0
    fileprivate var offsetY: CGFloat = 0.0
    fileprivate var needPlusSign: Bool = false
    
    public var size: CGFloat = 100.0 {
        didSet {
            let c = center
            frame = CGRect(x: c.x - size / 2, y: c.y - size / 2, width: size, height: size)
            layer.cornerRadius = size / 2
        }
    }
    public var outlineColor: UIColor = .lightGray {
        didSet {
            layer.borderColor = outlineColor.cgColor
        }
    }
    public var outlineWidth: CGFloat = 2 {
        didSet {
            layer.borderWidth = outlineWidth
        }
    }
    
    public init(frame: CGRect, viewToMagnify: UIView, scale: CGFloat = 2, offsetX: CGFloat = 0, offsetY: CGFloat = 0, needPlusSign: Bool = false) {
        super.init(frame: frame)
        layer.cornerRadius = size / 2
        layer.masksToBounds = true
        backgroundColor = .white
        layer.borderColor = outlineColor.cgColor
        layer.borderWidth = outlineWidth
        self.scale = scale
        self.offsetX = offsetX
        self.offsetY = offsetY
        self.viewToMagnify = viewToMagnify
        self.needPlusSign = needPlusSign
        if self.needPlusSign {
            self.addPlusSign()
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext()
            else { return }
        context.translateBy(x: frame.size.width / 2, y: frame.size.height / 2)
        context.scaleBy(x: scale, y: scale)
        context.translateBy(x: 1 - frame.midX, y: 1 - frame.midY)
        isHidden = true
        viewToMagnify?.layer.render(in: context)
        isHidden = false
        center = CGPoint.init(x: center.x + offsetX, y: center.y + offsetY)
    }
    
    func addPlusSign() {
        let lineLayer = CAShapeLayer()
        let plusShapePath = CGMutablePath()
        lineLayer.fillColor = UIColor.clear.cgColor//填充色
        lineLayer.strokeColor = self.outlineColor.cgColor//线颜色
        lineLayer.lineWidth = self.outlineWidth
        plusShapePath.move(to: .init(x: center.x - self.size / 10, y: center.y))
        plusShapePath.addLine(to: .init(x: center.x + self.size / 10, y: center.y))
        plusShapePath.move(to: .init(x: center.x, y: center.y - self.size / 10))
        plusShapePath.addLine(to: .init(x: center.x, y: center.y + self.size / 10))
        lineLayer.path = plusShapePath
        self.layer.addSublayer(lineLayer)
    }
}
