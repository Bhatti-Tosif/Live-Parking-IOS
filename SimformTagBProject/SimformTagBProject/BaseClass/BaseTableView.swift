//
//  BaseTableView.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 12/06/23.
//

import UIKit

class BaseTableView: UITableView {

    // MARK: -
    // MARK: - Properties

    /// Placeholder Image
    @IBInspectable var imagePlaceHolder: UIImage? {
        didSet {
            imgPlaceholder.image = imagePlaceHolder
        }
    }

    /// Placeholder label
    @IBInspectable var titlePlaceHolderLabel: String? {
        didSet {
            setLabelText()
        }
    }

    @IBInspectable var descriptionPlaceHolderLabel: String? {
        didSet {
            setLabelText()
        }
    }

    /// Loading Data placeholder
    @IBInspectable var loadingPlaceholder: String? {
        didSet {
            setLabelText()
        }
    }

    var didPullToRefresh: ((_ control: UIRefreshControl) -> Void)? {
        didSet {
            if didPullToRefresh != nil {
                refreshControl = collectionRefreshControl
                collectionRefreshControl.pulledToRefresh = { [weak self] in
                    guard let uSelf = self else { return }
                    uSelf.didPullToRefresh?(uSelf.collectionRefreshControl)
                }
            }
        }
    }

    // MARK: - Variables & Declarations
    internal var lodingState = LodingState.loading {
        didSet {
            setLabelText()
        }
    }

    private var completion: (() -> Void)?
    private var lblTitlePlaceholder = UILabel()
    private var lblDescriptionPlaceholder = UILabel()
    private let imgPlaceholder = UIImageView()
    let stackPlaceholder = UIStackView()
    private let collectionRefreshControl = BaseRefreshControl()
    var blockForTouchesBegan: ((_ touches: Set<UITouch>, _ event: UIEvent?) -> Void)?
    var blockForButtonAction: VoidCompletion?

    var progressIndicator = UIActivityIndicatorView() {
        didSet {
            progressIndicator.tintColor = R.color.deepAqua()
        }
    }

    lazy var btnEmpty = BaseButton(title: "")

    // MARK: - Private functions
    private func setLabelText() {
        switch lodingState {
        case .loading:
            lblDescriptionPlaceholder.text = loadingPlaceholder
            progressIndicator.startAnimating()
        case .empty:
            lblTitlePlaceholder.text = titlePlaceHolderLabel
            lblDescriptionPlaceholder.text = descriptionPlaceHolderLabel
            progressIndicator.stopAnimating()
        case .failure:
            lblTitlePlaceholder.text = titlePlaceHolderLabel
            lblDescriptionPlaceholder.text = descriptionPlaceHolderLabel
            progressIndicator.stopAnimating()
        case .success:
            lblTitlePlaceholder.text = titlePlaceHolderLabel
            lblDescriptionPlaceholder.text = descriptionPlaceHolderLabel
            progressIndicator.stopAnimating()
        }
    }

    /// Should show placeholder view
    ///
    /// - Parameter imgPlaceholder: image for Placeholder
    /// - Parameter lblTitlePlaceholder: Title Placeholder
    /// - Parameter lblDescriptionPlaceholder: Description Placeholder
    private func setUpPlaceholder() {
        let spacerLabel = UILabel()
        spacerLabel.text = " "
        let spacerLabel2 = UILabel()
        spacerLabel2.text = " "

        stackPlaceholder.axis = .vertical
        stackPlaceholder.distribution  = UIStackView.Distribution.equalSpacing

        lblTitlePlaceholder.textAlignment = .center
        lblTitlePlaceholder.numberOfLines = BaseTableViewDimensions.numberOfLines.lines
        lblTitlePlaceholder.textColor = R.color.blackColor()
        lblTitlePlaceholder.font = R.font.poppinsMedium(size: 18)

        lblDescriptionPlaceholder.textAlignment = .center
        lblDescriptionPlaceholder.numberOfLines = 0
        lblDescriptionPlaceholder.textColor = R.color.placeholderColor()
        lblDescriptionPlaceholder.font = R.font.poppinsRegular(size: 14)

        spacerLabel.heightAnchor.constraint(equalToConstant: BaseTableViewDimensions.spacerLabelHeight.value).isActive = true
        btnEmpty.widthAnchor.constraint(equalToConstant: bounds.width - BaseTableViewDimensions.stackPlaceholderWidth.value).isActive = true
        btnEmpty.heightAnchor.constraint(equalToConstant: BaseTableViewDimensions.btnEmptyHeight.value).isActive = true
        btnEmpty.type = 2

        imgPlaceholder.contentMode = .scaleAspectFit
        stackPlaceholder.addArrangedSubview(imgPlaceholder)
        stackPlaceholder.addArrangedSubview(spacerLabel)
        stackPlaceholder.addArrangedSubview(progressIndicator)
        stackPlaceholder.addArrangedSubview(lblTitlePlaceholder)
        stackPlaceholder.addArrangedSubview(lblDescriptionPlaceholder)
        stackPlaceholder.addArrangedSubview(spacerLabel2)
        stackPlaceholder.addArrangedSubview(btnEmpty)
        lblTitlePlaceholder.setContentHuggingPriority(.defaultHigh, for: .vertical)
        lblDescriptionPlaceholder.setContentHuggingPriority(UILayoutPriority(rawValue: BaseTableViewDimensions.descriptionPriority.contentHuggingPriority), for: .vertical)
        btnEmpty.setContentHuggingPriority(UILayoutPriority(rawValue: BaseTableViewDimensions.btnEmptyPriority.contentHuggingPriority), for: .vertical)
        stackPlaceholder.spacing = 0
        let container = UIView(frame: self.bounds)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(stackPlaceholder)
        stackPlaceholder.frame = CGRect(x: 0, y: 0, width: bounds.width - BaseTableViewDimensions.stackPlaceholderWidth.value, height: (bounds.width / 2) + BaseTableViewDimensions.stackPlaceholderHeight.value + 50)
        backgroundView = UIView()
        backgroundView?.addSubview(container)
        container.center = backgroundView?.center ?? center
        stackPlaceholder.center = container.center
    }

    /// Should show placeholder view
    ///
    /// - Parameter show: show
    internal func shouldShowPlaceholder(_ show: Bool) {
        stackPlaceholder.isHidden = !show
        lblTitlePlaceholder.isHidden = (lodingState == .loading)
        stackPlaceholder.center = backgroundView?.center ?? center
    }

    /// Should show placeholder view
    ///
    /// - Parameter show: show
    internal func shouldShowPlaceholderForLocationDetails(_ show: Bool) {
        stackPlaceholder.isHidden = !show
        lblTitlePlaceholder.isHidden = (lodingState == .loading)
        stackPlaceholder.center = center
    }
    
    // MARK: - Init Methods
    func commonInit() {
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        separatorStyle = .none
        btnEmpty.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
        btnEmpty.isHidden = true
    }

    // MARK: - Overrides
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        blockForTouchesBegan?((touches), event)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.setUpPlaceholder()
    }

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    @objc func buttonClicked() {
        blockForButtonAction?()
    }
}

class SelfSizedTableView: BaseTableView {
    
    override var contentSize:CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
