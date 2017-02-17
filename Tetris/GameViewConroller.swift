import UIKit


class GameViewController: UIViewController, GameDraw {
    var points:Int = 0
    var valueOfDivision:CGFloat
    var columns:Int
    private(set) var numberOfPixels:Int
    private(set) var rows:Int
    var pixelArray = [UIImageView]()
    var gameDelegate:GameProtocol?
    let labelWithPoints = UILabel()
    
    //init
    init(_ valueOfDivision:CGFloat,_ columns:Int,_ rows:Int)
    {
        self.columns = columns
        self.rows = rows
        self.numberOfPixels = rows*columns
        self.valueOfDivision = valueOfDivision
        super.init(nibName: nil, bundle: nil)
        //viewDidLoad()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createPixelArray()
    {
        
        for _ in 0...numberOfPixels-1
        {
            
            let pixel = UIImageView(image: #imageLiteral(resourceName: "pixelDark"))
            pixel.translatesAutoresizingMaskIntoConstraints = false
            pixel.contentMode = .scaleAspectFit
            pixelArray.append(pixel)}}
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        createPixelArray()
        self.view.backgroundColor = UIColor.darkGray
        //adding SwipeRecognizer
        let swipeRight = UISwipeGestureRecognizer(target: gameDelegate, action: #selector(Game.didSwipeRight))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        let swipeLeft = UISwipeGestureRecognizer(target: gameDelegate, action: #selector(Game.didSwipeLeft))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        let swipeDown = UISwipeGestureRecognizer(target: gameDelegate, action: #selector(Game.didSwipeDown))
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
        verticalStack.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        verticalStack.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        verticalStack.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        var stackArray = [UIStackView]()
        
        for j in 0...rows-1
        {
            let horizontalStack = UIStackView()
            horizontalStack.axis = .horizontal
            horizontalStack.translatesAutoresizingMaskIntoConstraints = false
            stackArray.append(horizontalStack)
            verticalStack.addArrangedSubview(stackArray[j])
            
            for i in 0...columns-1
            {
                let index:Int = (i+j*columns)
                stackArray[j].addArrangedSubview(pixelArray[index])
                pixelArray[index].heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: CGFloat(valueOfDivision)).isActive = true
                pixelArray[index].widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: CGFloat(valueOfDivision)).isActive = true
                
            }
            
        }
        //Adding a score Label
        labelWithPoints.text = String(points)
        labelWithPoints.textColor = UIColor.white
        labelWithPoints.font = UIFont(name: "XPED Shadow", size: 35.0   )
        labelWithPoints.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelWithPoints)
        labelWithPoints.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelWithPoints.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        
    }
    //FILL PIXELS
    
    func fillThePixel(x:Int,y:Int, blockImage:UIImage)
    {
        let gameIndex:Int = y*columns+x
        if gameIndex >= 0 && gameIndex <= numberOfPixels-1
        {
            pixelArray[gameIndex].image = blockImage
        }
    }
    
    
    
    func clearView()
    {
        for element in pixelArray
        {
            element.image = nil
            element.backgroundColor = UIColor.darkGray
        }
        labelWithPoints.text = String(gameDelegate!.points)
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool
    {
        return true
    }
    
}

