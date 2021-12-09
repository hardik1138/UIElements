

import UIKit

class HomeViewController: UIViewController {

    
    private let toolbar:UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.backgroundColor = .white
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let gallery = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handlegallery))
        toolbar.items = [space,gallery]
        toolbar.barTintColor = .white
        toolbar.layer.borderColor = UIColor.white.cgColor
        toolbar.tintColor = .black
        return toolbar
    }()
    @objc func handlegallery(){
        print("Gallery Called")
        ImagePicker.sourceType = .photoLibrary
        DispatchQueue.main.async {
            self.present(self.ImagePicker,animated: true)
        }
    }
    private let dpView:UIImageView = {
        let imgview = UIImageView()
        imgview.contentMode = .scaleAspectFill
        imgview.backgroundColor = .gray
        imgview.image = UIImage(named: "user")
        imgview.layer.cornerRadius = 124
        imgview.clipsToBounds = true
        return imgview
    }()
    
    private let ImagePicker : UIImagePickerController = {
        let ip = UIImagePickerController()
        ip.allowsEditing = false
        return ip
    }()
    public let myTextView:UILabel = {
        let label =  UILabel()
        label.text = "Select Profile"
        label.font = .boldSystemFont(ofSize : 20)
        label.textAlignment = .center
        return label
    }()
    
    private let nextBtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("Next", for: .normal)
        btn.addTarget(self, action: #selector(btnCllick), for: .touchUpInside)
        btn.backgroundColor = .black
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 12
        btn.layer.shadowColor = UIColor.gray.cgColor
        btn.layer.shadowOpacity = 0.8
        btn.layer.shadowRadius = 8
        return btn
    }()
    private let myPage:UIPageControl = {
        let page = UIPageControl()
        page.numberOfPages = 3
        page.backgroundColor = .white
        page.pageIndicatorTintColor = .gray
        page.currentPageIndicatorTintColor = .black
        page.addTarget(self, action: #selector(pageCllick), for: .valueChanged)
        return  page
    }()
    
    @objc func pageCllick (){
        print(myPage.currentPage)
        if(myPage.currentPage == 1)
        {
            let vc = PersonalInfoVC()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func btnCllick (){
        let vc = PersonalInfoVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = .white
        super.viewDidLoad()
        view.addSubview(toolbar)
        view.addSubview(dpView)
        view.addSubview(myTextView)
        view.addSubview(nextBtn)
        view.addSubview(myPage)
        ImagePicker.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapview))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        dpView.addGestureRecognizer(tapGesture)
    }
     override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let toolbarHGeight:CGFloat = view.safeAreaInsets.top + 40.0
        toolbar.frame = CGRect(x: 0, y: view.safeAreaInsets.top , width: view.frame.size.width, height:toolbarHGeight)
        dpView.frame = CGRect(x: (view.width/2) - 124, y: 150, width: 248, height: 248)
        myTextView.frame = CGRect(x: 20 , y: dpView.bottom + 20, width: view.width - 40, height: 60)
        nextBtn.frame = CGRect(x: 60, y: view.bottom - 100 , width: view.width - 120 , height: 40)
        myPage.frame = CGRect(x: 20, y: view.bottom - 60, width: view.width - 40, height: 40)
    }
}
extension HomeViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage{
            dpView.image = selectedImage
        }
        picker.dismiss(animated: true)
    }
}

extension HomeViewController{
    @objc private func didTapview(gesture:UITapGestureRecognizer){
        print("press")
        handlegallery()
    }
}
