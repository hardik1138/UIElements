import UIKit

class PersonalInfoVC: UIViewController {

    private let mySegGender:UISegmentedControl = {
        let seg = UISegmentedControl()
        seg.insertSegment(withTitle: "Male", at: 0, animated: true)
        seg.insertSegment(withTitle: "Female", at: 1, animated: true)
        seg.selectedSegmentIndex = 0
        seg.addTarget(self, action: #selector(segCllick), for: .valueChanged)
        seg.backgroundColor = .white
        seg.layer.borderColor =  UIColor.white.cgColor
        seg.layer.borderWidth = 0.0
        return seg
    }()
    private let lblTitle:UILabel = {
        let label =  UILabel()
        label.text = "Personal info"
        label.font = .boldSystemFont(ofSize : 24)
        return label
    }()
    
    private let nameTextField:UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.placeholder = "Enter name..."
        textField.textAlignment = .left
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8.0
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0)
        return textField
    }()
   
    private let emailTextField:UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.placeholder = "Enter email..."
        textField.textAlignment = .left
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8.0
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0)
        return textField
    }()
    
    
    private let mobileTextField:UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.placeholder = "Mobile no..."
        textField.textAlignment = .left
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8.0
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0)
        return textField
    }()
    @objc func segCllick (){
        print(mySegGender.selectedSegmentIndex)
    }
    private let myPage:UIPageControl = {
        let page = UIPageControl()
        page.numberOfPages = 3
        page.currentPage = 1
        page.backgroundColor = .white
        page.pageIndicatorTintColor = .gray
        page.currentPageIndicatorTintColor = .black
        page.addTarget(self, action: #selector(pageCllick), for: .valueChanged)
        return  page
    }()
    
    @objc func pageCllick (){
        print(myPage.currentPage)
        if(myPage.currentPage == 0)
        {
            let vc = HomeViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
        if(myPage.currentPage == 2)
        {
            myPage.currentPage = 1
        }
    }
    
    private let lblCity:UILabel = {
        let label =  UILabel()
        label.text = "City"
        label.font = .boldSystemFont(ofSize : 16)
        return label
    }()
    
    private let pickerView = UIPickerView()
    private let pickerData = ["Surat", "Bombay", "Navsari","Vapi","Valsad","A'bad"]
    
    private let lblSub:UILabel = {
        let label =  UILabel()
        label.text = "Subject"
        label.font = .boldSystemFont(ofSize : 16)
        return label
    }()
    
    private let mySlider:UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 10
        slider.addTarget(self, action: #selector(slidClick), for: .valueChanged)
        return slider
    }()
    
    @objc func slidClick (){
        lblSubValue.text = "\(Int(round(mySlider.value)))"
    }
    private let lblSubValue:UILabel = {
        let label =  UILabel()
        label.text = "0"
        label.font = .boldSystemFont(ofSize : 16)
        return label
    }()
    private let lblDate:UILabel = {
        let label =  UILabel()
        label.text = "Birthdate"
        label.font = .boldSystemFont(ofSize : 16)
        return label
    }()
    
    private let myDate:UIDatePicker = {
        let date = UIDatePicker()
        date.datePickerMode = .date
        date.timeZone = TimeZone(secondsFromGMT: 0)
        date.addTarget(self, action: #selector(dateCllick), for: .valueChanged)
        return date
    }()
    
    @objc func dateCllick (){
        print(myDate.date)
    }

    private let lblATKT:UILabel = {
        let label =  UILabel()
        label.text = "No of ATKT"
        label.font = .boldSystemFont(ofSize : 16)
        return label
    }()
    
    private let mySteper:UIStepper = {
        let steper = UIStepper()
        steper.minimumValue = 0
        steper.value = 0
        steper.tintColor =  .black
        steper.maximumValue = 5
        steper.addTarget(self, action: #selector(stepClick), for: .valueChanged)
        return steper
    }()
    
    @objc func stepClick (){
        lblSteValue.text = String(Int(round(mySteper.value)))
    }
    private let lblSteValue:UILabel = {
        let label =  UILabel()
        label.text = "0"
        label.font = .boldSystemFont(ofSize : 16)
        return label
    }()
    
    private let mySwitch:UISwitch = {
        let myswitch = UISwitch()
        myswitch.addTarget(self, action: #selector(switchClick), for: .valueChanged)
        return myswitch
    }()
    
    @objc func switchClick (){
        if mySwitch.isOn
        {
            print(mySwitch.isOn)
            view.backgroundColor = .gray
        }else
        {
            view.backgroundColor = .white
        }
    }
    
    private let nextBtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("Save", for: .normal)
        btn.addTarget(self, action: #selector(btnCllick), for: .touchUpInside)
        btn.backgroundColor = .black
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 12
        btn.layer.shadowColor = UIColor.gray.cgColor
        btn.layer.shadowOpacity = 0.8
        btn.layer.shadowRadius = 8
        return btn
    }()
    
    @objc func btnCllick (){
        let vc = FinalViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.setNavigationBarHidden(true, animated: false)
        present(nav, animated: false)
    }
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        //view.addSubview(mySeg)
        view.addSubview(lblTitle)
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(mobileTextField)
        view.addSubview(mySegGender)
        view.addSubview(myPage)
        view.addSubview(lblCity)
        view.addSubview(pickerView)
        pickerView.dataSource = self
        pickerView.delegate = self
        view.addSubview(lblSub)
        view.addSubview(mySlider)
        view.addSubview(lblSubValue)
        view.addSubview(lblDate)
        view.addSubview(myDate)
        view.addSubview(lblATKT)
        view.addSubview(mySteper)
        view.addSubview(lblSteValue)
        view.addSubview(mySwitch)
        view.addSubview(nextBtn)
    }
    override func viewDidLayoutSubviews() {
        //mySeg.frame = CGRect(x: 0, y: view.safeAreaInsets.top , width: view.width, height: 40)
        lblTitle.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 40, width: view.width, height: 60)
        mySwitch.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 20, width: view.width, height: 40)
        nameTextField.frame = CGRect(x: 20, y: lblTitle.bottom , width: view.width - 40, height: 40)
        emailTextField.frame = CGRect(x: 20, y: nameTextField.bottom + 10 , width: view.width - 40, height: 40)
        mobileTextField.frame = CGRect(x: 20, y: emailTextField.bottom + 10 , width: (view.width / 2) - 40, height: 40)
        mySegGender.frame = CGRect(x: mobileTextField.right + 37 , y: emailTextField.bottom + 10 , width: (view.width / 2) - 40, height: 40)
        lblCity.frame = CGRect(x: 20, y: mobileTextField.bottom + 30 , width: view.width/2 - 40, height: 40)
        pickerView.frame = CGRect(x: lblCity.right - 100 , y:  mobileTextField.bottom, width: view.width/2 - 100, height: 100)
        lblSub.frame = CGRect(x: 20, y: pickerView.bottom - 10, width: view.width/2 - 40, height: 40)
        mySlider.frame = CGRect(x: lblSub.right - 70 , y: pickerView.bottom - 10, width: view.width/2, height: 40)
        lblSubValue.frame = CGRect(x: mySlider.right + 10, y: pickerView.bottom - 10, width: 100, height: 40)
        lblDate.frame = CGRect(x: 20, y: lblSub.bottom + 10, width: view.width/2 - 40, height: 40)
        myDate.frame = CGRect(x: lblDate.right - 70, y: lblSub.bottom + 10, width: view.width - lblDate.right + 50, height: 40)
        lblATKT.frame = CGRect(x: 20, y: lblDate.bottom + 10, width: view.width/2 - 40, height: 40)
        mySteper.frame = CGRect(x: lblATKT.right - 50, y: lblDate.bottom + 15, width: view.width - lblATKT.right, height: 40)
        lblSteValue.frame = CGRect(x: mySteper.right + 10, y: lblDate.bottom + 10, width: 100, height: 40)
        nextBtn.frame = CGRect(x: 60, y: view.bottom - 100 , width: view.width - 120 , height: 40)
        
        myPage.frame = CGRect(x: 20, y: view.bottom - 60, width: view.width - 40, height: 40)
        
    }
}
extension PersonalInfoVC : UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel = view as? UILabel;
        
        if (pickerLabel == nil)
        {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: "Montserrat", size: 16)
            pickerLabel?.textAlignment = .center
        }
        pickerLabel?.text = pickerData[row]
        return pickerLabel!;
    }
}
