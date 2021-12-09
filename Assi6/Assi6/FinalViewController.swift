
import UIKit

class FinalViewController: UIViewController {
    private let myPage:UIPageControl = {
        let page = UIPageControl()
        page.numberOfPages = 3
        page.currentPage = 2
        page.backgroundColor = .white
        page.pageIndicatorTintColor = .gray
        page.currentPageIndicatorTintColor = .black
        return  page
    }()
    private let myActivityIndicatorView:UIActivityIndicatorView = {
        let act = UIActivityIndicatorView()
        act.color = .blue
        return act
    }()
    public let myLabel:UILabel = {
        let label =  UILabel()
        label.text = "Data uploading..."
        label.font = .boldSystemFont(ofSize : 20)
        return label
    }()
    
    private let myProgressView : UIProgressView = {
        let pview = UIProgressView()
        pview.setProgress(0.0, animated: true)
        return pview
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        
        view.backgroundColor = .white
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 10.0,animations: {
            
            
            self.myProgressView.setProgress(1.0, animated:true)
        },completion: {(_ finished: Bool) -> Void in
            
            self.myLabel.text = "Data uploaded."
            self.myActivityIndicatorView.frame = CGRect(x: 20, y: 300 , width: 0, height: 0)
            //self.myProgressView.frame = CGRect(x: 100, y: myPage.top - 20,width: view.width - 200 ,height: 400)
        })
        
        DispatchQueue.main.async {
            self.myActivityIndicatorView.isHidden = !self.myActivityIndicatorView.isHidden
            self.myActivityIndicatorView.isHidden ? self.myActivityIndicatorView.stopAnimating() : self.myActivityIndicatorView.startAnimating()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myPage)
        view.addSubview(myProgressView)
        view.addSubview(myLabel)
        view.addSubview(myActivityIndicatorView)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myActivityIndicatorView.frame = CGRect(x: 20, y: 300 , width: view.width - 40, height: 40)
        myPage.frame = CGRect(x: 20, y: view.bottom - 60, width: view.width - 40, height: 40)
        myProgressView.frame = CGRect(x: 100, y: myPage.top - 20,width: view.width - 200 ,height: 400)
        myLabel.frame = CGRect(x: 110  , y: myProgressView.top - 40 , width: view.width - 40, height: 40)
    }
}
