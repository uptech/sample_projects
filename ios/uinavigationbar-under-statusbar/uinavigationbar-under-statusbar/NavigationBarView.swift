import UIKit

class NavigationBarView: UINavigationBar {
    // Do any other custom things you might need to do for this UINavigationBar
}

extension NavigationBarView: UIBarPositioningDelegate {
    // Make the navigation bar extend ender status bar
    override var barPosition: UIBarPosition {
        return .topAttached
    }
}
