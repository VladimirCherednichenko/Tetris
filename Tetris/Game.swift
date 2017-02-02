

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
    
    init(viewController:GameDrow){
        
        self.viewController=viewController
        figure=provider.getNextFigure()
    }
    
    func clearView() {self.viewController.clearView()}
    
    func fillCollor(_ fillArray:[Int]) {for element in fillArray{self.viewController.fillThePixel(gameIndex: element)}}
    
    func clearThePixelCollor(_ cleanArray:[Int]) {for element in cleanArray{self.viewController.clearThePixel(gameIndex: element)}}
    
    
    @objc func moveElementDown() {
        
        var indexesOfCurrentFigureOnView:[Int]=[]
        indexesOfCurrentFigureOnView=figure.getIndexForView()
        
        
        /*for element in figure.offsetOfPoiIts{
         
         let ellementIllappend = element.x + element.y*10
         
         currentElementIndex.append(ellementIllappend)
         
         }
         _=figure.offsetOfPoiIts.map{
         let ellementIllappend=$0.x + $0.y*10+figure.startPoint.y*10+figure.startPoint.x
         figureWithMovement.append(ellementIllappend)
         
         }*/
        
        
        self.clearView()
        
        self.fillCollor(indexesOfSavedElements+indexesOfCurrentFigureOnView)
        print(figure.startPoint.y)
        print(indexesOfCurrentFigureOnView)
        print(figure.getIndexOfMaxY())
        
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
                figure.moveFigureDown()}}
        else {
            figure = provider.getNextFigure()
            indexesOfSavedElements=indexesOfSavedElements+indexesOfCurrentFigureOnView}
        
        if indexesOfSavedElements != [] {
            indexesOfSavedElements=removeDuplicate(indexesOfSavedElements)
            indexesOfSavedElements=removeLine(indexesOfSavedElements)
        }
        
        /*
         var currentElementWithMove:[Int]=[]
         var maxIndexOfCurrentElement:Int=0
         currentElementIndex=element.indexOfCurrent
         
         for element in currentElementIndex{
         let elementIllAdd:Int
         elementIllAdd=element+y
         currentElementWithMove.append(elementIllAdd)}
         maxIndexOfCurrentElement=searchMaxNummberInArray(Array: currentElementWithMove)
         
         
         
         
         
         for indexOfSaved in savedElementsIndex{
         for indexOfCurrent in currentElementWithMove{
         if (indexOfCurrent+10)==indexOfSaved {savedElementsIndex=savedElementsIndex+currentElementWithMove
         y=0
         if indexOfCurrent < 20 {savedElementsIndex=[]; currentElementWithMove=[]
         //stopY=true
         }
         element.changeElement()}
         }}
         
         self.clearView()
         self.fillCollor(currentElementWithMove+savedElementsIndex)
         
         if maxIndexOfCurrentElement>=170 {
         savedElementsIndex=savedElementsIndex+currentElementWithMove
         y=0
         element.changeElement()
         }
         if savedElementsIndex==[] {} else {
         savedElementsIndex=removeDuplicate(savedElementsIndex)
         savedElementsIndex=removeLine(savedElementsIndex)
         }
         
         
         
         if !stopY {y=y+10}
         */
        
    }
    
    
    
    @objc func moveElementRight(){
        
        
        
        /*var currentElementWithMove:[Int]=[]
         var bufer:Int
         currentElementIndex=element.indexOfCurrent
         bufer=(maxInTens(currentElementIndex)+y) % 10
         
         if bufer<9 {y=y+1}
         for element in currentElementIndex{
         let elementIllAdd:Int
         elementIllAdd=element+y
         currentElementWithMove.append(elementIllAdd)}
         
         
         self.clearView()
         if !stopY {self.fillCollor(currentElementWithMove+savedElementsIndex)}*/
        
        
    }
    @objc func moveElementLeft(){
        
        /*var currentElementWithMove:[Int]=[]
         var bufer:Int
         
         currentElementIndex=element.indexOfCurrent
         bufer=(minInTens(currentElementIndex)+y)%10
         
         
         if bufer>=1 {y=y-1}
         for element in currentElementIndex{
         let elementIllAdd:Int
         elementIllAdd=element+y
         currentElementWithMove.append(elementIllAdd)}
         
         
         self.clearView()
         if !stopY {self.fillCollor(currentElementWithMove+savedElementsIndex)}*/
        
        
    }
    @objc func moveElementDownTouch(){
        
        moveElementDown()
        
        
        
    }
    
    
    
    @objc func rotateElement(){
        
        /*var currentElementWithMove:[Int]=[]
         var maxIndexOfCurrentElement:Int=0
         var stopTap=false
         
         currentElementIndex=element.indexOfCurrent
         
         for element in currentElementIndex{
         let elementIllAdd:Int
         elementIllAdd=element+y
         currentElementWithMove.append(elementIllAdd)}
         maxIndexOfCurrentElement=searchMaxNummberInArray(Array: currentElementWithMove)
         
         
         
         
         
         for indexOfCurrent in currentElementWithMove{
         if indexOfCurrent>149{stopTap=true}
         for indexOfSaved in savedElementsIndex{
         if (indexOfCurrent+10)==indexOfSaved {savedElementsIndex=savedElementsIndex+currentElementWithMove
         y=0; stopTap=true
         if indexOfCurrent < 20 {savedElementsIndex=[]; currentElementWithMove=[]
         
         }
         element.changeElement()}
         }}
         
         if !stopTap {element.rotate()}
         self.clearView()
         self.fillCollor(currentElementWithMove+savedElementsIndex)
         
         if maxIndexOfCurrentElement>=170 {
         savedElementsIndex=savedElementsIndex+currentElementWithMove
         y=0
         element.changeElement()
         }
         if savedElementsIndex==[] {} else {
         savedElementsIndex=removeDuplicate(savedElementsIndex)
         savedElementsIndex=removeLine(savedElementsIndex)
         }
         */
        
        
        
    }
}


