import UIKit

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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 187/255, green: 42/255, blue: 97/255, alpha: 100)

        let navBar = navigationBarView
        self.navigationBarView.delegate = self
        view.addSubview(navBar)

        navBar.translatesAutoresizingMaskIntoConstraints = false
        navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        navBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    }
}

extension ViewController: UINavigationBarDelegate {
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        guard self.navigationBarView == bar as? UINavigationBar else {
            return bar.barPosition
        }
        return UIBarPosition.topAttached
    }
}
