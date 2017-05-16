import UIKit


class GameViewController: UIViewController, GameDraw
{
    var points:Int = 0
    var valueOfDivision:CGFloat
    var columns:Int
    static var counterForDeinit:Int = 0
    private(set) var numberOfPixels:Int
    private(set) var rows:Int
    weak var gameDelegate:GamePlayController?
    let labelWithPoints = UILabel()
    var layout:GameViewLayout!
    
    
    init(_ valueOfDivision:CGFloat,_ columns:Int,_ rows:Int)
    {
        self.columns = columns
        self.rows = rows
        self.numberOfPixels = rows * columns
        self.valueOfDivision = valueOfDivision
        GameViewController.counterForDeinit = GameViewController.counterForDeinit + 1
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        UIApplication.shared.isStatusBarHidden = true
        
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.layout = GameViewLayout(view:view, rows: rows, columns: columns, valueOfDivision: valueOfDivision )
        
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
        
        layout.labelWithPoints.text = String(points)
        
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        UIApplication.shared.isStatusBarHidden = false
    }
    
    //FILL PIXELS
    
    func fillThePixel(x:Int,y:Int, blockImage:UIImage?)
    {
        let gameIndex:Int = y * columns + x
        if gameIndex >= 0 && gameIndex <= numberOfPixels - 1
        {
            layout.pixelArray[gameIndex].image = blockImage
            if layout == nil {
                print ("layout is nil")
            }
        }
        
    }
    
    func clearThePixel(x:Int,y:Int)
    {
        let gameIndex:Int = y * columns + x
        if gameIndex >= 0 && gameIndex <= numberOfPixels - 1
        {
            layout.pixelArray[gameIndex].image = #imageLiteral(resourceName: "pixelDark")
        }
        
        
    }
    
    func clearView()
    {
        for element in layout.pixelArray {
            element.image = nil
            element.backgroundColor = UIColor.darkGray
        }
        
        
    }
    func updatePoints(_ points:Int)
    {
        layout.labelWithPoints.text = String(points)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    
    override var prefersStatusBarHidden: Bool
    {
        return true
    }
    
}

