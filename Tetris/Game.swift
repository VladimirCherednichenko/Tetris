

import UIKit


class Game:GameProtocol{
    
    var y:Int=10
    var stopY:Bool=false
    var cleanTime:Int=0
    var element=Element()
    var currentElementIndex:[Int] = []
    var viewController:GameDrow
    
    var indexesOfSavedElements:[Int]=[]
    var provider=Provider()
    var figure:Figure
    var senderObject:protocolGameOver
    init(viewController:GameDrow,senderObject:protocolGameOver){
        self.senderObject=senderObject
        self.viewController=viewController
        figure=provider.getNextFigure()
    }
    deinit {
        
    }
    
    func clearView() {self.viewController.clearView()}
    
    func fillCollor(_ fillArray:[Int]) {for element in fillArray{self.viewController.fillThePixel(gameIndex: element)}}
    
    func clearThePixelCollor(_ cleanArray:[Int]) {for element in cleanArray{self.viewController.clearThePixel(gameIndex: element)}}
    
    
    
    @objc func moveElementDown() {
        
        var indexesOfCurrentFigureOnView:[Int]=[]
        indexesOfCurrentFigureOnView=figure.getIndexForView()
        self.clearView()
        self.fillCollor(indexesOfSavedElements+indexesOfCurrentFigureOnView)
        
       
        
        var figureChanged=false
        print(figure.getIndexOfMaxY())
        if  figure.getIndexOfMaxY()<=16 {
            for element in indexesOfCurrentFigureOnView{
                for index in indexesOfSavedElements{
                    if element+10==index {
                        indexesOfSavedElements=indexesOfSavedElements+indexesOfCurrentFigureOnView
                        figure = provider.getNextFigure()
                        figureChanged=true
                        }
                }}
            if !figureChanged{
                figure.moveFigureDown()}}
        else {
            figure = provider.getNextFigure()
            indexesOfSavedElements=indexesOfSavedElements+indexesOfCurrentFigureOnView}
       
        if indexesOfSavedElements != [] {
            indexesOfSavedElements=removeDuplicate(indexesOfSavedElements)
            indexesOfSavedElements=removeLine(indexesOfSavedElements)
            print(indexesOfSavedElements)
        //there begins Game Over
       indexesOfSavedElements=indexesOfSavedElements.sorted(by: <)
            if 10>indexesOfSavedElements[0]{
             
                indexesOfSavedElements=[]
                senderObject.sendGameOverScrean()
                
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
                        figure = provider.getNextFigure()
                        figureChanged=true
                    }
                }}
            if !figureChanged{
                figure.rotate()}}
        else {
            figure = provider.getNextFigure()
            indexesOfSavedElements=indexesOfSavedElements+indexesOfCurrentFigureOnView}
        
        if indexesOfSavedElements != [] {
            indexesOfSavedElements=removeDuplicate(indexesOfSavedElements)
            indexesOfSavedElements=removeLine(indexesOfSavedElements)
        }
        
        
        
        
    }
}


