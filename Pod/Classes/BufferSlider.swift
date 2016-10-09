//
//  BufferSlider.swift
//  Pods
//
//  Created by brianliu on 2016/2/22.
//
//

import UIKit

let padding:CGFloat = 0;
///Enum of vertical position
public enum VerticalPosition:Int{
    case top = 1
    case center = 2
    case bottom = 3
}

/// - Easily use
/// - Easily customize
/// - Drop-In replacement
/// - Supports **Objective-C** and **Swift**
/// - *@IBDesignable* class *BufferSlider*
/// - *@IBInspectable* property *bufferStartValue* (*Swift.Double*)
/// - 0.0 ~ 1.0
/// - *@IBInspectable* property *bufferEndValue* (*Swift.Double*)
/// - 0.1 ~ 1.0
/// - *@IBInspectable* property *borderColor* (*UIKit.UIColor*)
/// - *@IBInspectable* property *fillColor* (*UIKit.UIColor*)
/// - *@IBInspectable* property *borderWidth* (*Swift.Double*)
/// - *@IBInspectable* property *sliderHeight* (*Swift.Double*)
@IBDesignable open class BufferSlider: UISlider {
    ///0.0 ~ 1.0. @IBInspectable
    @IBInspectable open var bufferStartValue:Double = 0{
        didSet{
            if bufferStartValue < 0.0 {
                bufferStartValue = 0
            }
            if bufferStartValue > bufferEndValue {
                bufferStartValue = bufferEndValue
            }
            self.setNeedsDisplay()
        }
    }
    ///0.0 ~ 1.0. @IBInspectable
    @IBInspectable open var bufferEndValue:Double = 0{
        didSet{
            if bufferEndValue > 1.0 {
                bufferEndValue = 1
            }
            if bufferEndValue < bufferStartValue{
                bufferEndValue = bufferStartValue
            }
            self.setNeedsDisplay()
        }
    }
    
    ///baseColor property. @IBInspectable
    @IBInspectable open var baseColor:UIColor = UIColor.lightGray
    
    ///progressColor property. @IBInspectable
    @IBInspectable open var progressColor:UIColor? = UIColor.blue
    
    ///bufferColor property. @IBInspectable
    @IBInspectable open var bufferColor:UIColor? = nil

    ///BorderWidth property. @IBInspectable
    @IBInspectable open var borderWidth: Double = 0.5{
        didSet{
            if borderWidth < 0.1 {
                borderWidth = 0.1
            }
            self.setNeedsDisplay()
        }
    }
    
    ///Slider height property. @IBInspectable
    @IBInspectable open var sliderHeight: Double = 2 {
        didSet{
            if sliderHeight < 1 {
                sliderHeight = 1
            }
        }
    }
    ///Adaptor property. Stands for vertical position of slider. (Swift and Objective-C)
    /// - 1 -> Top
    /// - 2 -> Center
    /// - 3 -> Bottom
    @IBInspectable open var sliderPositionAdaptor:Int{
        get {
            return sliderPosition.rawValue
        }
        set{
            let r = abs(newValue) % 3
            switch r {
            case 1:
                sliderPosition = .top
            case 2:
                sliderPosition = .center
            case 0:
                sliderPosition = .bottom
            default:
                sliderPosition = .center
            }
        }
    }
    ///Vertical position of slider. (Swift only)
    open var sliderPosition:VerticalPosition = .center
    
    ///Draw round corner or not
    @IBInspectable open var roundedSlider:Bool = true
    
    ///Draw hollow or solid color
    @IBInspectable open var hollow:Bool = true
    
    ///Do not call this delegate mehtod directly. This is for hiding built-in slider drawing after iOS 7.0
    open override func trackRect(forBounds bounds: CGRect) -> CGRect {
        var result = super.trackRect(forBounds: bounds)
        result.size.height = 0.01
        return result
    }
    
    ///Custom Drawing. Subclass and and override to suit you needs.
    open override func draw(_ rect: CGRect) {
//        UIColor.redColor().colorWithAlphaComponent(0.3).set()
//        UIRectFrame(rect)
        baseColor.set()
        let rect = self.bounds.insetBy(dx: CGFloat(borderWidth)+padding, dy: CGFloat(borderWidth))
        let height = sliderHeight.CGFloatValue
        let radius = height/2
        var sliderRect = CGRect(x: rect.origin.x, y: rect.origin.y + (rect.height/2-radius), width: rect.width, height: rect.width) //default center
        switch sliderPosition {
        case .top:
            sliderRect.origin.y = rect.origin.y
        case .bottom:
            sliderRect.origin.y = rect.origin.y + rect.height - sliderRect.height
        default:
            break
        }

        let path = UIBezierPath()
        if roundedSlider {
            path.addArc(withCenter: CGPoint(x: sliderRect.minX + radius, y: sliderRect.minY+radius), radius: radius, startAngle: CGFloat(M_PI)/2, endAngle: -CGFloat(M_PI)/2, clockwise: true)
            path.addLine(to: CGPoint(x: sliderRect.maxX-radius, y: sliderRect.minY))
            path.addArc(withCenter: CGPoint(x: sliderRect.maxX-radius, y: sliderRect.minY+radius), radius: radius, startAngle: -CGFloat(M_PI)/2, endAngle: CGFloat(M_PI)/2, clockwise: true)
            path.addLine(to: CGPoint(x: sliderRect.minX + radius, y: sliderRect.minY+height))
        }else{
            path.move(to: CGPoint(x: sliderRect.minX, y: sliderRect.minY+height))
            path.addLine(to: sliderRect.origin)
            path.addLine(to: CGPoint(x: sliderRect.maxX, y: sliderRect.minY))
            path.addLine(to: CGPoint(x: sliderRect.maxX, y: sliderRect.minY+height))
            path.addLine(to: CGPoint(x: sliderRect.minX, y: sliderRect.minY+height))
        }

        baseColor.setStroke()
        path.lineWidth = borderWidth.CGFloatValue
        path.stroke()
        if hollow == false { path.fill() }
        path.addClip()
        
        var fillHeight = sliderRect.size.height-borderWidth.CGFloatValue
        if fillHeight < 0 {
            fillHeight = 0
        }
        
        let fillRect = CGRect(
            x: sliderRect.origin.x + sliderRect.size.width*CGFloat(bufferStartValue),
            y: sliderRect.origin.y + borderWidth.CGFloatValue/2,
            width: sliderRect.size.width*CGFloat(bufferEndValue-bufferStartValue),
            height: fillHeight)
        if let color = bufferColor { color.setFill() }
        else if let color = self.superview?.tintColor{ color.setFill()}
        else{ UIColor(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0).setFill() }
        
        UIBezierPath(rect: fillRect).fill()
        
//        if let color = progressColor {
//            color.setFill()
//            let fillRect = CGRect(
//                x: sliderRect.origin.x,
//                y: sliderRect.origin.y + borderWidth.CGFloatValue/2,
//                width: sliderRect.size.width*CGFloat((value-minimumValue)/(maximumValue-minimumValue)),
//                height: fillHeight)
//            UIBezierPath(rect: fillRect).fill()
//        }
    }

}


extension Double{
    var CGFloatValue: CGFloat {
        return CGFloat(self)
    }
}
