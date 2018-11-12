import UIKit
import Constraid

class ViewController: UIViewController {
    private let navigationBarView: UINavigationBar = {
        let nav = UINavigationBar(frame: .zero)

        // Add items to the left and right of the navigation bar.
        // This isn't necessary to do but we wanted you to see something expected in the navigation bar
        let navItem = UINavigationItem()
        let leftButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelClicked))
        let rightButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveClicked))
        navItem.leftBarButtonItem = leftButton
        navItem.rightBarButtonItem = rightButton

        // Add navigation items to the bar
        nav.items = [navItem]
        return nav
    }()

    @objc private func cancelClicked() {
        print("Canceld clicked")
    }

    @objc private func saveClicked() {
        print("Save Clicked")
    }

    init() {
        super.init(nibName: nil, bundle: nil)

        navigationBarView.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 187/255, green: 42/255, blue: 97/255, alpha: 100)

        let navBar = navigationBarView
        view.addSubview(navBar)

        // This sets the auto layout constraints to be within the safe area by setting the leading, top, and trailing constraints.
        // safeAreaLayoutGuide will be under the status bar and the notch in the iPhone X
        Constraid.cup(navBar, byTopEdgeOf: view.safeAreaLayoutGuide).activate()
    }
}

extension ViewController: UINavigationBarDelegate {
    public func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}
