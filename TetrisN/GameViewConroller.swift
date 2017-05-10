import UIKit


class GameViewController: UIViewController, GameDraw {
    var points:Int = 0
    var valueOfDivision:CGFloat
    var columns:Int
    static var counterForDeinit:Int = 0
    private(set) var numberOfPixels:Int
    private(set) var rows:Int
    var pixelArray = [UIImageView]()
    weak var gameDelegate:GamePlayController?
    let labelWithPoints = UILabel()
    
    
    init(_ valueOfDivision:CGFloat,_ columns:Int,_ rows:Int)
    {
        self.columns = columns
        self.rows = rows
        self.numberOfPixels = rows * columns
        self.valueOfDivision = valueOfDivision
        GameViewController.counterForDeinit = GameViewController.counterForDeinit + 1
        
        
        
        
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createPixelArray()
    {
        
        for _ in 0...numberOfPixels - 1
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
        let swipeRight = UISwipeGestureRecognizer(target: gameDelegate, action: #selector(GamePlayController.didSwipeRight))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        let swipeLeft = UISwipeGestureRecognizer(target: gameDelegate, action: #selector(GamePlayController.didSwipeLeft))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        let swipeDown = UISwipeGestureRecognizer(target: gameDelegate, action: #selector(GamePlayController.didSwipeDown))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
        let tap = UITapGestureRecognizer(target: gameDelegate, action: #selector(GamePlayController.rotateElement))
        self.view.addGestureRecognizer(tap)
        //Here I creaate vertical Stack, that hold all components
        let verticalStack = UIStackView()
        verticalStack.axis = .vertical
        
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(verticalStack)
        
        
        verticalStack.snp.makeConstraints{ (make) -> Void in
            
            make.right.equalTo(view.snp.right)
            make.left.equalTo(view.snp.left)
            make.bottom.equalTo(view.snp.bottom)
        }
        
        
        
        var stackArray = [UIStackView]()
        
        for j in 0...rows - 1
        {
            let horizontalStack = UIStackView()
            horizontalStack.axis = .horizontal
            horizontalStack.translatesAutoresizingMaskIntoConstraints = false
            stackArray.append(horizontalStack)
            verticalStack.addArrangedSubview(stackArray[j])
            
            for i in 0...columns - 1
            {
                let index:Int = (i + j * columns)
                stackArray[j].addArrangedSubview(pixelArray[index])
                
                pixelArray[index].snp.makeConstraints{ (make) -> Void in
                    make.height.equalTo(view.snp.width).multipliedBy(valueOfDivision)
                    make.width.equalTo(view.snp.width).multipliedBy(valueOfDivision)
                }
                
            }
            
        }
        //Adding a score Label
        labelWithPoints.text = String(points)
        labelWithPoints.textColor = UIColor.white
        labelWithPoints.font = UIFont(name: "XPED Shadow", size: 35.0   )
        labelWithPoints.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelWithPoints)
        
        
        
        
        labelWithPoints.snp.makeConstraints{ (make) -> Void in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view.snp.top)
        }
        
    }
    //FILL PIXELS
    
    func fillThePixel(x:Int,y:Int, blockImage:UIImage?)
    {
        let gameIndex:Int = y * columns + x
        if gameIndex >= 0 && gameIndex <= numberOfPixels - 1
        {
            pixelArray[gameIndex].image = blockImage
        }
    }
    
    func clearThePixel(x:Int,y:Int)
    {
        let gameIndex:Int = y * columns + x
        if gameIndex >= 0 && gameIndex <= numberOfPixels - 1
        {
            pixelArray[gameIndex].image = #imageLiteral(resourceName: "pixelDark")
        }
    }
    
    func clearView()
    {
        for element in pixelArray
        {
            element.image = nil
            element.backgroundColor = UIColor.darkGray
        }
        
    }
    func updatePoints(_ points:Int) {
        labelWithPoints.text = String(points)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    
    override var prefersStatusBarHidden: Bool
    {
        return true
    }
    deinit {
        
        
    }
}

