//
//  UIButtonMask.swift
//  ButtonMask
//
//  Created by Costantino Pistagna on 03/02/2017.
//  Copyright © 2017 sofapps. All rights reserved.
//

import UIKit

extension UIButton {
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if let anImage = self.image(for: .normal) {
            return isAlphaVisible(atPoint: point, forImage: anImage)
        }
        return super.point(inside: point, with: event)
    }
    
    func isAlphaVisible(atPoint: CGPoint, forImage image: UIImage) -> Bool {
        var point = atPoint
        let iSize = image.size
        let bSize = self.bounds.size
        
        point.x *= (bSize.width > 0) ? (iSize.width / bSize.width) : 1
        point.y *= (bSize.height > 0) ? (iSize.height / bSize.height) : 1
        
        if let pixelColor = image.color(atPixel: point) {
            var fAlpha: CGFloat = 0
            pixelColor.getRed(nil, green: nil, blue: nil, alpha: &fAlpha)
            return (fAlpha == 1.0)
        }
        return false
    }
}

extension UIImage {
    func color(atPixel point:CGPoint) -> UIColor? {
        if CGRect(x:0, y:0, width:self.size.width, height:self.size.height).contains(point) == false {
            return nil
        }
        let imageRef = self.cgImage
        let width = imageRef!.width
        let height = imageRef!.height
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let rawData = UnsafeMutablePointer<UInt8>.allocate(capacity: (height*width*4))
        let bytesPerPixel = 4
        let bytesPerRow = bytesPerPixel * width
        let bitsPerComponent = 8
        let bitmapInfo = CGImageAlphaInfo.premultipliedLast.rawValue | CGBitmapInfo.byteOrder32Big.rawValue
        
        let context = CGContext.init(data: rawData, width: width, height: height, bitsPerComponent: bitsPerComponent, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: bitmapInfo)
        
        context?.draw(imageRef!, in: CGRect(x: 0, y: 0, width: width, height: height))
        
        let byteIndex: Int = (bytesPerRow * Int(point.y)) + Int(point.x) * bytesPerPixel
        
        let red = CGFloat(rawData[byteIndex]) / CGFloat(255.0)
        let green = CGFloat(rawData[byteIndex + 1]) / CGFloat(255.0)
        let blue = CGFloat(rawData[byteIndex + 2]) / CGFloat(255.0)
        let alpha = CGFloat(rawData[byteIndex + 3]) / CGFloat(255.0)
        
        return UIColor.init(colorLiteralRed: Float(red), green: Float(green), blue: Float(blue), alpha: Float(alpha))
    }
}
