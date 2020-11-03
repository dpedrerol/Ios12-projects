//
//  DrawingImageView.swift
//  08-MathsTraining
//
//  Created by Carlos Daniel Pedrerol on 27/10/2020.
//

import UIKit

class DrawingImageView: UIImageView {
    
    weak var delegate : ViewController?
    
    var currentTouchPosition : CGPoint?
    
   /* override func draw(_ rect: CGRect) {
        
        
    }*/
    
    func draw(from start: CGPoint, to end: CGPoint) {
        let renderer = UIGraphicsImageRenderer(size: self.bounds.size)
        
        self.image = renderer.image { ctx in
            self.image?.draw(in: self.bounds)
            
//  Definir los parámetros del dibujo de CGContext
            UIColor.darkGray.setStroke()
            ctx.cgContext.setLineCap(.round)
            ctx.cgContext.setLineWidth(12)

// Se dibuja una línea desde start hasta end
            ctx.cgContext.move(to: start)
            ctx.cgContext.addLine(to: end)
            ctx.cgContext.strokePath()
        }
    }
        
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.currentTouchPosition = touches.first?.location(in: self)
        
        
        NSObject.cancelPreviousPerformRequests(withTarget: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard let newTouchPoint = touches.first?.location(in: self) else {
            return
        }
        guard let previousTouchPoint = self.currentTouchPosition else {
            return
        }
        
        draw(from: previousTouchPoint, to: newTouchPoint)
        self.currentTouchPosition = newTouchPoint
        
        
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.currentTouchPosition = nil
        
        perform(#selector(numberDrawnOnScreen), with: nil, afterDelay: 0.5)
    }

    @objc func numberDrawnOnScreen() {
        guard let image = self.image else {
            return
        }
        let drawRect = CGRect(x: 0, y: 0, width: 28, height: 28)
        
        let format = UIGraphicsImageRendererFormat()
        format.scale = 1
        
        let renderer = UIGraphicsImageRenderer(bounds: drawRect, format: format)
        
        let imageWithWhiteBackground = renderer.image {ctx in
            
            UIColor.white.setFill()
            ctx.fill(bounds)
            image.draw(in: drawRect)
        }
        
//        Convertimos una UIimage de CG a CI
        let ciImage = CIImage(cgImage: imageWithWhiteBackground.cgImage!)
        
//        Hacemos una conversión de color para convertir fondo blanco en negro
        if let filter = CIFilter(name: "CIColorInvert") {
//        Define la CIImage como imagen a ser filtrada
            filter.setValue(ciImage, forKey: kCIInputImageKey)
            
//        Contexto para llevar a cabo el filtro, la transformación
        let context = CIContext(options: nil)
            
            if let outputImage = filter.outputImage {
//         Intentamos hacer la creación a CGImage
                if let imageRef = context.createCGImage(outputImage, from: ciImage.extent) {
//          Convertimos a un objeto UIImage con el que procesar los resultados
                    let resultImage = UIImage(cgImage: imageRef)
                    
//          Finalmente le pasamos la imagen procesada a nuestro delegado
                    self.delegate?.numberDrawn(resultImage)
                }
                
                
                
            }
        
            
        }
        
        
        
        
    }
    
}
