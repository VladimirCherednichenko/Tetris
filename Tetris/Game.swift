

import UIKit


class Game:GameProtocol{
    
    private var gameViewController:GameDraw
    private var indexesOfSavedElements:[Int]=[]
    private var provider=Provider()
    private var figure:Figure
    private var timer=Timer()
    var points:Int=0
    private var maxY:Int!
    private var valueOfDivision:CGFloat
    private var applicationControllerObject:AppControllerProtocol
    init(gameViewController:GameDraw,applicationControllerObject:AppControllerProtocol,_ valueOfDivision:CGFloat){
        self.valueOfDivision=valueOfDivision
        self.applicationControllerObject=applicationControllerObject
        self.gameViewController=gameViewController
        figure=provider.getFigure()
        timer=Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(moveElementDown), userInfo: nil, repeats: true)
        
    }
    
    func clearView() {self.gameViewController.clearView()}
    func fillCollor(_ fillArray:[Int]) {
        for element in fillArray{self.gameViewController.fillThePixel(gameIndex: element)}}
    
    
    
    func getIndexForView(_ valueOfDivision:Int)->[Int]{
        var figureWithMovement:[Int]=[]
        for element in self.figure.offsetOfPoiIts{
            
            let ellementIllappend = element.x + element.y*valueOfDivision+figure.startPoint.x+figure.startPoint.y*valueOfDivision
            figureWithMovement.append(ellementIllappend)
            
            
        }
        return figureWithMovement.sorted(by: >).filter({return $0>=0})
    }
    
    
    @objc func moveElementDown() {
        maxY=gameViewController.countVerticalpixels
        var indexesOfCurrentFigureOnView:[Int]=[]
        indexesOfCurrentFigureOnView=self.getIndexForView(Int(1/valueOfDivision))
        self.clearView()
        self.fillCollor(indexesOfSavedElements+indexesOfCurrentFigureOnView)
        
        
        
        var figureChanged=false
        if  figure.getIndexOfMaxY()<=maxY-2 {
            for element in indexesOfCurrentFigureOnView{
                for index in indexesOfSavedElements{
                    if element+Int(1/valueOfDivision)==index {
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
            indexesOfSavedElements=removeLine(indexesOfSavedElements,self, numberOfPixelsInOneLine: Int(1/valueOfDivision))
            self.gameViewController.points=points
            //there begins Game Over
            indexesOfSavedElements=indexesOfSavedElements.sorted(by: <)
            if Int(1/valueOfDivision)>indexesOfSavedElements[0]{
                self.fillCollor(indexesOfSavedElements+(indexesOfCurrentFigureOnView.map{$0+Int(1/valueOfDivision)}))
                indexesOfSavedElements=[]
                timer.invalidate()
                applicationControllerObject.sendGameOverScreen()
                
                
            }
        }
    }
    @objc func moveElementRight(){
        
        if figure.getMaxX()+figure.startPoint.x<Int(1/valueOfDivision)-1{
            figure.moveFigureRight()
            
            var indexesOfCurrentFigureOnView:[Int]=[]
            indexesOfCurrentFigureOnView=self.getIndexForView(Int(1/valueOfDivision))
            self.clearView()
            self.fillCollor(indexesOfSavedElements+indexesOfCurrentFigureOnView)
        }
    }
    @objc func moveElementLeft(){
        if figure.getMinX()+figure.startPoint.x>0{
            figure.moveFigureLeft()
            
            var indexesOfCurrentFigureOnView:[Int]=[]
            indexesOfCurrentFigureOnView=self.getIndexForView(Int(1/valueOfDivision))
            self.clearView()
            self.fillCollor(indexesOfSavedElements+indexesOfCurrentFigureOnView)
        }
    }
    @objc func moveElementDownTouch(){
        moveElementDown()
        }
    
    
    
    @objc func rotateElement(){
        var indexesOfCurrentFigureOnView:[Int]=[]
        indexesOfCurrentFigureOnView=self.getIndexForView(Int(1/valueOfDivision))
        self.clearView()
        self.fillCollor(indexesOfSavedElements+indexesOfCurrentFigureOnView)
        var figureChanged=false
        if  figure.getIndexOfMaxY()<=maxY-2 {
            for element in indexesOfCurrentFigureOnView{
                for index in indexesOfSavedElements{
                    if element+Int(1/valueOfDivision)==index {indexesOfSavedElements=indexesOfSavedElements+indexesOfCurrentFigureOnView
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
            indexesOfSavedElements=removeLine(indexesOfSavedElements,self, numberOfPixelsInOneLine: Int(1/valueOfDivision))
        }
    }
}


