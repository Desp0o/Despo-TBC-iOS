import UIKit

protocol HistoryDelegate: AnyObject {
    func historyOperations(operations: [String], theme: Bool)
}

final class CalculatorVC: UIViewController {
    private let resultsView = UIView()
    private let pad = UIView()
    
    private let firstLabel = UILabel()
    private var secondLabel = UILabel()
    
    private let gradientLayr = CAGradientLayer()
    
    private let mainNumStackView = UIStackView()
    private let firstNumbersStack = UIStackView()
    private let secondNumbersStack = UIStackView()
    private let thirdNumbersStack = UIStackView()
    private let fourthNumbersStack = UIStackView()
    private let fifthNumbersStack = UIStackView()
    private let bottomTwoLinesStack = UIStackView()
    
    private let button0 = CalcButton()
    private let button1 = CalcButton()
    private let button2 = CalcButton()
    private let button3 = CalcButton()
    private let button4 = CalcButton()
    private let button5 = CalcButton()
    private let button6 = CalcButton()
    private let button7 = CalcButton()
    private let button8 = CalcButton()
    private let button9 = CalcButton()
    private let dotButton = CalcButton()
    private let themeButton = CalcButton()
    private let percentIcon = CalcButton(value: "%")
    private let divideIcon = CalcButton(value: "/")
    private let mulitpleIcon = CalcButton(value: "*")
    private let decrementIcon = CalcButton(value: "-")
    private let incrementIcon = CalcButton(value: "+")
    private let acButton = CalcButton()
    private let resultButton = CalcButton()
    private let historyButton = UIButton()
    
    private var mainStackTopAnchorValue: NSLayoutConstraint?
    private var mainStackBottomAnchorValue: NSLayoutConstraint?
    private var secondLabelBottomValue: NSLayoutConstraint?
    private var historyButtonTopAnchor: NSLayoutConstraint?
    
    private var isLandscapeMode = false
    private var isDarkMode = false
    private var isCalculatedResult = false
    private var lastOperations: [String] = [""]
    
    override func willAnimateRotation(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        gradientLayr.frame = resultButton.bounds
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        isLandscapeMode = UIScreen.main.bounds.width > UIScreen.main.bounds.height ? true : false
        updateMainNumStackViewConstraints()
        updateSecondLabel()
        updateHistoryButtonContraint()
        view.layoutIfNeeded()
        
        gradinetColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc private func changeThemeMode() {
        isDarkMode = !isDarkMode
        
        if isDarkMode {
            overrideUserInterfaceStyle = .dark
        } else {
            overrideUserInterfaceStyle = .light
            
        }
        
        updateUI()
    }
    
    private func setupUI(){
        self.navigationController?.navigationBar.isHidden = true
        
        switch traitCollection.userInterfaceStyle {
        case .light:
            isDarkMode = false
        case .dark:
            isDarkMode = true
        default:
            isDarkMode = false
        }
        
        changeThemeMode()
        setupResultsView()
        setupHistoryButton()
        setupLabels()
        setupNumpad()
        setupMainNumStackView()
        addHorizontalStacks()
        setupButtons()
        setupStacks()
        gradinetColor()
        addShadow()
    }
    
    private func updateUI() {
        view.backgroundColor = isDarkMode ? darkThemeBackgroundColor : lightThemeBackgroundColor
        
        pad.backgroundColor = isDarkMode ? padDarkColor : padLightColor
        
        historyButton.setImage(UIImage(named: isDarkMode ? "historyLight" : "historyDark"), for: .normal)
        
        updateButtonIconsColor()
        updateButtonTitleColor()
    }
    
    private func setupResultsView() {
        view.addSubview(resultsView)
        resultsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resultsView.topAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            resultsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            resultsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
    
    private func setupLabels() {
        secondLabelSetup()
        firstLabelSetup()
    }
    
    private func firstLabelSetup() {
        resultsView.addSubview(firstLabel)
        firstLabel.text = ""
        firstLabel.font = UIFont.systemFont(ofSize: 20)
        firstLabel.textColor = actionsTextColor
        
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstLabel.trailingAnchor.constraint(equalTo: secondLabel.trailingAnchor),
            firstLabel.bottomAnchor.constraint(equalTo: secondLabel.topAnchor, constant: -8)
        ])
    }
    
    private func secondLabelSetup() {
        resultsView.addSubview(secondLabel)
        
        secondLabel.text = "0"
        secondLabel.font = UIFont.systemFont(ofSize: 48)
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        
        secondLabelBottomValue = secondLabel.bottomAnchor.constraint(equalTo: resultsView.bottomAnchor, constant: -40)
        
        NSLayoutConstraint.activate([
            secondLabel.trailingAnchor.constraint(equalTo: resultsView.trailingAnchor, constant: -43),
            secondLabelBottomValue ?? secondLabel.bottomAnchor.constraint(equalTo: resultsView.bottomAnchor, constant: -40)
        ])
    }
    
    private func updateSecondLabel() {
        if isLandscapeMode {
            secondLabelBottomValue?.constant = -10
            secondLabel.font = UIFont.systemFont(ofSize: 30)
        } else {
            secondLabelBottomValue?.constant = -40
            secondLabel.font = UIFont.systemFont(ofSize: 48)
        }
    }
    
    private func setupHistoryButton() {
        view.addSubview(historyButton)
        view.bringSubviewToFront(historyButton)
        
        historyButton.translatesAutoresizingMaskIntoConstraints = false
        
        historyButtonTopAnchor = historyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
        
        NSLayoutConstraint.activate([
            historyButtonTopAnchor ?? historyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            historyButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
        ])
        
        historyButton.addAction(UIAction(handler: {[weak self] action in
            self?.navigateToHistoryVC()
        }), for: .touchUpInside)
    }
    
    private func updateHistoryButtonContraint() {
        historyButtonTopAnchor?.constant = isLandscapeMode ? 50 : 30
    }
    
    private func setupNumpad() {
        view.addSubview(pad)
        
        pad.translatesAutoresizingMaskIntoConstraints = false
        pad.clipsToBounds = true
        pad.layer.cornerRadius = 28
        pad.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        NSLayoutConstraint.activate([
            pad.topAnchor.constraint(equalTo: resultsView.bottomAnchor, constant: 16),
            pad.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            pad.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            pad.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
    private func setupMainNumStackView() {
        pad.addSubview(mainNumStackView)
        
        mainNumStackView.translatesAutoresizingMaskIntoConstraints = false
        mainNumStackView.axis = .horizontal
        mainNumStackView.distribution = .fillEqually
        mainNumStackView.spacing = 16
        
        mainStackTopAnchorValue = mainNumStackView.topAnchor.constraint(equalTo: pad.topAnchor, constant: 48)
        mainStackBottomAnchorValue = mainNumStackView.bottomAnchor.constraint(equalTo: pad.bottomAnchor, constant: -66)
        
        NSLayoutConstraint.activate([
            mainNumStackView.leftAnchor.constraint(equalTo: pad.leftAnchor, constant: 42),
            mainNumStackView.rightAnchor.constraint(equalTo: pad.rightAnchor, constant: -42),
            mainStackTopAnchorValue ?? mainNumStackView.topAnchor.constraint(equalTo: pad.topAnchor, constant: 48),
            mainStackBottomAnchorValue ?? mainNumStackView.bottomAnchor.constraint(equalTo: pad.bottomAnchor, constant: -66)
        ])
    }
    
    private func updateMainNumStackViewConstraints() {
        if isLandscapeMode {
            mainStackTopAnchorValue?.constant = 12
            mainStackBottomAnchorValue?.constant = -12
        } else {
            mainStackTopAnchorValue?.constant = 48
            mainStackBottomAnchorValue?.constant = -66
        }
    }
    
    private func addHorizontalStacks() {
        let stackArray = [firstNumbersStack, secondNumbersStack, thirdNumbersStack, fourthNumbersStack]
        
        stackArray.forEach { stack in
            stack.axis = .vertical
            stack.spacing = 16
            
            mainNumStackView.addArrangedSubview(stack)
        }
    }
    
    private func setupButtons() {
        acButton.setupButtonsUI(name: "AC")
        button0.setupButtonsUI(name: "0")
        button1.setupButtonsUI(name: "1")
        button2.setupButtonsUI(name: "2")
        button3.setupButtonsUI(name: "3")
        button4.setupButtonsUI(name: "4")
        button5.setupButtonsUI(name: "5")
        button6.setupButtonsUI(name: "6")
        button7.setupButtonsUI(name: "7")
        button8.setupButtonsUI(name: "8")
        button9.setupButtonsUI(name: "9")
        dotButton.setupButtonsUI(name: ".")
        resultButton.setupButtonsUI(name: "=")
        
        let buttonsArray: [CalcButton] = [
            button0,
            button1,
            button2,
            button3,
            button4,
            button5,
            button6,
            button7,
            button8,
            button9,
            dotButton,
            acButton,
            percentIcon,
            divideIcon,
            mulitpleIcon,
            decrementIcon,
            incrementIcon
        ]
        
        themeButton.addTarget(self, action: #selector(changeThemeMode), for: .touchUpInside)
        
        for button in buttonsArray {
            button.addAction(UIAction(handler: { [weak self] action  in
                self?.addButtonAction(value: button.value )
            }), for: .touchUpInside)
        }
        
        resultButton.addAction(UIAction(handler: { [weak self] action  in
            self?.useCalculator()
        }), for: .touchUpInside)
    }
    
    private func updateButtonIconsColor() {
        themeButton.setupButtonsUI(isDarkMode: isDarkMode, isBordered: true, iconLight: "sun", iconDark: "moon")
        percentIcon.setupButtonsUI(isDarkMode: isDarkMode, isFilled:true, iconLight: "percentLight", iconDark: "percentSvg")
        divideIcon.setupButtonsUI(isDarkMode: isDarkMode, isFilled: true, iconLight: "divideLight", iconDark: "divideSvg")
        mulitpleIcon.setupButtonsUI(isDarkMode: isDarkMode, isFilled: true, iconLight: "multipleLight", iconDark: "multipleSvg")
        incrementIcon.setupButtonsUI(isDarkMode: isDarkMode, isFilled: true, iconLight: "incrementLight", iconDark: "increment")
        decrementIcon.setupButtonsUI(isDarkMode:isDarkMode, isFilled: true, iconLight: "decrementLight", iconDark: "decrement")
    }
    
    private func updateButtonTitleColor() {
        button0.updatetextColor(isDarkMode: isDarkMode)
        button1.updatetextColor(isDarkMode: isDarkMode)
        button2.updatetextColor(isDarkMode: isDarkMode)
        button3.updatetextColor(isDarkMode: isDarkMode)
        button4.updatetextColor(isDarkMode: isDarkMode)
        button5.updatetextColor(isDarkMode: isDarkMode)
        button6.updatetextColor(isDarkMode: isDarkMode)
        button7.updatetextColor(isDarkMode: isDarkMode)
        button8.updatetextColor(isDarkMode: isDarkMode)
        button9.updatetextColor(isDarkMode: isDarkMode)
        acButton.updatetextColor(isDarkMode: isDarkMode)
        dotButton.updatetextColor(isDarkMode: isDarkMode)
    }
    
    private func setupStacks() {
        let firstLine = [themeButton, button7, button4, button1, acButton]
        firstLine.forEach { button in
            firstNumbersStack.addArrangedSubview(button)
            firstNumbersStack.distribution = .fillEqually
        }
        
        let secondLine = [percentIcon, button8, button5, button2, button0]
        secondLine.forEach { button in
            secondNumbersStack.addArrangedSubview(button)
            secondNumbersStack.distribution = .fillEqually
        }
        
        let thirdLine = [divideIcon, button9, button6, button3, dotButton]
        thirdLine.forEach { button in
            thirdNumbersStack.addArrangedSubview(button)
            thirdNumbersStack.distribution = .fillEqually
        }
        
        let fourthLine = [mulitpleIcon, decrementIcon, incrementIcon, resultButton]
        fourthLine.forEach { button in
            fourthNumbersStack.addArrangedSubview(button)
            fourthNumbersStack.distribution = .fillProportionally
            fourthNumbersStack.spacing = 18
        }
    }
    
    private func gradinetColor() {
        gradientLayr.frame = resultButton.bounds
        gradientLayr.cornerRadius = resultButton.layer.cornerRadius
        gradientLayr.colors = [
            gradientColor1,
            gradientColor2
        ]
        
        resultButton.layer.insertSublayer(gradientLayr, at: 0)
    }
    
    private func addShadow() {
        resultButton.layer.shadowColor = shadowColor
        resultButton.layer.shadowOpacity = 1
        resultButton.layer.shadowRadius = 6
        resultButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        resultButton.layer.masksToBounds = false
    }
    
    private func navigateToHistoryVC() {
        let vc = HistoryVC(isDarkMode: isDarkMode, operationsArray: lastOperations)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func useCalculator() {
        guard let resText = secondLabel.text else { return }
        
        let replacedText = resText.replacingOccurrences(of: "%", with: "/100")
        let expn = NSExpression(format: replacedText)
        
        firstLabel.text = String(describing: secondLabel.text ?? "")
        secondLabel.text = String(reflecting: expn.expressionValue(with: nil, context: nil) ?? "0" )
        
        isCalculatedResult = true
        
        if firstLabel.text != "0" {
            lastOperations.append(firstLabel.text ?? "")
        }
    }
    
    private func addButtonAction(value: String) {
        let symbols = ["%", "/", "*",  "-", "+", "."]
        let noStart = ["%", "/", "*",  "-", "+"]
        
        if symbols.contains(String(secondLabel.text?.last ?? ".")) && symbols.contains(value) {
            let droppedWord = secondLabel.text!.dropLast()
            secondLabel.text = String(Substring(droppedWord))
        }
        
        if value == "AC" {
            lastOperations.append(value)
            secondLabel.text = "0"
            firstLabel.text = ""
        } else if secondLabel.text == "0" && noStart.contains(value)  {
            secondLabel.text = "0"
        } else if secondLabel.text == "0" || isCalculatedResult && !symbols.contains(value) {
            secondLabel.text? = value
            isCalculatedResult = false
        }  else {
            secondLabel.text? += value
            isCalculatedResult = false
        }
    }
}



#Preview {
    let vc = CalculatorVC()
    return vc
}


