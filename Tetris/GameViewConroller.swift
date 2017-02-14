import UIKit


class GameViewController: UIViewController, GameDraw {
    var points:Int=0
    var valueOfDivision:CGFloat
    var widthPixel:CGFloat!
    var numberOfPixels:Int!
    var countVerticalpixels:Int=0
    var pixelArray=[UIImageView]()
    var gameDelegate:GameProtocol?
    let labelWithPoints=UILabel()
    
    //init
    init(_ valueOfDivision:CGFloat){
        self.valueOfDivision=valueOfDivision
        super.init(nibName: nil, bundle: nil)
    }
        required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createPixelArray(){
        
        for _ in 0...numberOfPixels-1{
            
            let pixel=UIImageView(image: #imageLiteral(resourceName: "pixelDark"))
            pixel.translatesAutoresizingMaskIntoConstraints = false
            pixel.contentMode = .scaleAspectFit
            pixelArray.append(pixel)}}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //calculatinng the devision
        widthPixel=view.frame.width*valueOfDivision
        countVerticalpixels=Int(view.frame.height/widthPixel)
        numberOfPixels=countVerticalpixels*Int(1/valueOfDivision)
        createPixelArray()
        self.view.backgroundColor = UIColor.darkGray
        //adding SwipeRecognizer
        let swipeRight = UISwipeGestureRecognizer(target: gameDelegate, action: #selector(Game.moveElementRight))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        let swipeLeft = UISwipeGestureRecognizer(target: gameDelegate, action: #selector(Game.moveElementLeft))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        let swipeDown = UISwipeGestureRecognizer(target: gameDelegate, action: #selector(Game.moveElementDownTouch))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
        let tap = UITapGestureRecognizer(target: gameDelegate, action: #selector(Game.rotateElement))
        self.view.addGestureRecognizer(tap)
        //Here I creaate vertical Stack, that hold all components
        let verticalStack = UIStackView()
        verticalStack.axis = .vertical
        //verticalStack.spacing = 0.5
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(verticalStack)
        verticalStack.rightAnchor.constraint(equalTo: view.rightAnchor).isActive=true
        verticalStack.leftAnchor.constraint(equalTo: view.leftAnchor).isActive=true
        verticalStack.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive=true
        //verticalStack.topAnchor.constraint(equalTo: view.topAnchor).isActive=true
    
        var stackArray=[UIStackView]()
        
        for j in 0...countVerticalpixels-1 {
            
            let horizontalStack = UIStackView()
            //horizontalStack.spacing=0.5
            horizontalStack.axis = .horizontal
            horizontalStack.translatesAutoresizingMaskIntoConstraints = false
            stackArray.append(horizontalStack)
            verticalStack.addArrangedSubview(stackArray[j])
            
            for i in 0...Int(1/valueOfDivision)-1{
                let index:Int=(i+j*Int(1/valueOfDivision))
                stackArray[j].addArrangedSubview(pixelArray[index])
                pixelArray[index].heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: CGFloat(valueOfDivision)).isActive=true
                pixelArray[index].widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: CGFloat(valueOfDivision)).isActive=true
                
            }
            
        }
        //Adding a score Label
        labelWithPoints.text=String(points)
        labelWithPoints.textColor=UIColor.white
        labelWithPoints.font=UIFont(name: "XPED Shadow", size: 35.0   )
        labelWithPoints.translatesAutoresizingMaskIntoConstraints=false
        view.addSubview(labelWithPoints)
        labelWithPoints.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
        labelWithPoints.topAnchor.constraint(equalTo: view.topAnchor).isActive=true
        
        
    }
    
    func fillThePixel(gameIndex:Int){
        if gameIndex >= 0 && gameIndex <= numberOfPixels-1 {
            pixelArray[gameIndex].image=#imageLiteral(resourceName: "pixelRed")}
    }
    
    
    
    func clearView(){
        for element in pixelArray{
            element.image=nil
            element.backgroundColor=UIColor.darkGray
        }
        labelWithPoints.text=String(points)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}

