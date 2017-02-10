

import UIKit


class Game:GameProtocol{
    
    var y:Int=10
    var cleanTime:Int=0
    var currentElementIndex:[Int] = []
    var gameViewController:GameDraw
    var indexesOfSavedElements:[Int]=[]
    var provider=Provider()
    var figure:Figure
    var timer=Timer()
    var applicationControllerObject:protocolGameOver
    init(gameViewController:GameDraw,applicationControllerObject:protocolGameOver){
        self.applicationControllerObject=applicationControllerObject
        self.gameViewController=gameViewController
        figure=provider.getFigure()
        timer=Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(moveElementDown), userInfo: nil, repeats: true)
    }
    
    func clearView() {self.gameViewController.clearView()}
    
    func fillCollor(_ fillArray:[Int]) {for element in fillArray{self.gameViewController.fillThePixel(gameIndex: element)}}
    
    func clearThePixelCollor(_ cleanArray:[Int]) {for element in cleanArray{self.gameViewController.clearThePixel(gameIndex: element)}}
    
    
    
    @objc func moveElementDown() {
        
        var indexesOfCurrentFigureOnView:[Int]=[]
        indexesOfCurrentFigureOnView=figure.getIndexForView()
        self.clearView()
        self.fillCollor(indexesOfSavedElements+indexesOfCurrentFigureOnView)
        
        
        
        var figureChanged=false
       
        if  figure.getIndexOfMaxY()<=16 {
            for element in indexesOfCurrentFigureOnView{
                for index in indexesOfSavedElements{
                    if element+10==index {
                        if !figureChanged {
                        indexesOfSavedElements=indexesOfSavedElements+indexesOfCurrentFigureOnView
                        figure = provider.getNextFigure()
                        
                            figureChanged=true}
                    }
                }}
            if !figureChanged{
                figure.moveFigureDown()}
        } else {
            figure = provider.getNextFigure()
            indexesOfSavedElements=indexesOfSavedElements+indexesOfCurrentFigureOnView}
        
        if indexesOfSavedElements != [] {
            
            indexesOfSavedElements=removeDuplicate(indexesOfSavedElements)
            indexesOfSavedElements=removeLine(indexesOfSavedElements)
           
            //there begins Game Over
            indexesOfSavedElements=indexesOfSavedElements.sorted(by: <)
            if 10>indexesOfSavedElements[0]{
                self.fillCollor(indexesOfSavedElements+(indexesOfCurrentFigureOnView.map{$0+10}))
                                indexesOfSavedElements=[]
                timer.invalidate()
                applicationControllerObject.sendGameOverScreen()
                
                
            }
        }
    }
    
    
    
    @objc func moveElementRight(){
        
        if figure.getMaxX()+figure.startPoint.x<9{
            figure.moveFigureRight()
            
            var indexesOfCurrentFigureOnView:[Int]=[]
            indexesOfCurrentFigureOnView=figure.getIndexForView()
            self.clearView()
            self.fillCollor(indexesOfSavedElements+indexesOfCurrentFigureOnView)
            
            
            
        }
    }
    @objc func moveElementLeft(){
        if figure.getMinX()+figure.startPoint.x>0{
            figure.moveFigureLeft()
            
            var indexesOfCurrentFigureOnView:[Int]=[]
            indexesOfCurrentFigureOnView=figure.getIndexForView()
            self.clearView()
            self.fillCollor(indexesOfSavedElements+indexesOfCurrentFigureOnView)
            
            
            
        }
    }
    @objc func moveElementDownTouch(){
        
        moveElementDown()
        
        
        
    }
    
    
    
    @objc func rotateElement(){
        var indexesOfCurrentFigureOnView:[Int]=[]
        indexesOfCurrentFigureOnView=figure.getIndexForView()
        self.clearView()
        self.fillCollor(indexesOfSavedElements+indexesOfCurrentFigureOnView)
        
        
        
        var figureChanged=false
        if  figure.getIndexOfMaxY()<=16 {
            for element in indexesOfCurrentFigureOnView{
                for index in indexesOfSavedElements{
                    if element+10==index {indexesOfSavedElements=indexesOfSavedElements+indexesOfCurrentFigureOnView
                        figure = provider.getNextFigure();
                        figureChanged=true
                    }
                }}
            if !figureChanged{//FIX IT
                figure.rotate()}
        } else {
            figure = provider.getNextFigure();
            indexesOfSavedElements=indexesOfSavedElements+indexesOfCurrentFigureOnView}
        
        if indexesOfSavedElements != [] {
            indexesOfSavedElements=removeDuplicate(indexesOfSavedElements)
            indexesOfSavedElements=removeLine(indexesOfSavedElements)
        }
        
        
        
        
    }
}


