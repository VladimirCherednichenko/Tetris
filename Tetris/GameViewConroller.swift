import UIKit


class GameViewController: UIViewController, GameDraw {
    
   
    
    var pixelArray=[UIImageView]()
    
    func createPixelArray(){
        for _ in 0...179{
            
            let pixel=UIImageView(image: #imageLiteral(resourceName: "pixelDark"))
            pixel.translatesAutoresizingMaskIntoConstraints = false
            /*pixel.backgroundColor=UIColor(patternImage:#imageLiteral(resourceName: "pixelRed"))*/
            pixel.contentMode = .scaleAspectFit
            pixelArray.append(pixel)}}
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "pixelDark"))
        createPixelArray()
        
        /*var backImage = UIImage(
         
         var resizablebackImage = backImage?.resizableImageWithCapInsets(UIEdgeInsets(top:10,left:0,bottom:10,right:0))*/
        
        
        //Here I creaate vertical Stack, that hold all components
        let verticalStack = UIStackView()
        verticalStack.axis = .vertical
        //verticalStack.spacing = 2
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(verticalStack)
        
        
        //verticalStack.rightAnchor.constraint(equalTo: view.rightAnchor).isActive=true
        verticalStack.leftAnchor.constraint(equalTo: view.leftAnchor).isActive=true
        verticalStack.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive=true
        //verticalStack.topAnchor.constraint(equalTo: view.topAnchor).isActive=true
        //
        var stackArray=[UIStackView]()
        
        for j in 0...17 {
            
            let horizontalStack = UIStackView()
            //horizontalStack.spacing=2
            horizontalStack.axis = .horizontal
            horizontalStack.translatesAutoresizingMaskIntoConstraints = false
            stackArray.append(horizontalStack)
            verticalStack.addArrangedSubview(stackArray[j])
            
            
            
            
            for i in 0...9
            {  let index:Int=(i+j*10)
                
                stackArray[j].addArrangedSubview(pixelArray[index])
                
                pixelArray[index].heightAnchor.constraint(equalTo: view.widthAnchor, multiplier:0.1).isActive=true
                pixelArray[index].widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1).isActive=true
            }
            
        }
        
        
        
    }
    
    func fillThePixel(gameIndex:Int){
        
        
        if gameIndex >= 0 && gameIndex <= 180 {
            pixelArray[gameIndex].image=#imageLiteral(resourceName: "pixelRed")}
    }
    
    func clearThePixel(gameIndex:Int){
        
        
        
        pixelArray[gameIndex].backgroundColor=UIColor(patternImage: #imageLiteral(resourceName: "pixelDark"))
    }
    
    func clearView(){
        for element in pixelArray{
            element.image=#imageLiteral(resourceName: "pixelDark")}
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}

