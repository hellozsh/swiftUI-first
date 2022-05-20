//
//  PageViewController.swift
//  xzl-patient-swift
//
//  Created by 周素华 on 2022/5/2020.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
//Add another method to PageViewController to make the coordinator.
//    SwiftUI calls this makeCoordinator() method before makeUIViewController(context:), so that you have access to the coordinator object when configuring your view controller.
//    Tip
//    You can use this coordinator to implement common Cocoa patterns, such as delegates, data sources, and responding to user events via target-action.
//
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    var pages: [Page]

    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)

        return pageViewController
    }

    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [UIHostingController(rootView: pages[0])], direction: .forward, animated: true)
    }

    /*
     A SwiftUI view that represents a UIKit view controller can define a Coordinator type that SwiftUI manages and provides as part of the representable view’s context.
      
     Declare a nested Coordinator class inside PageViewController.

     SwiftUI manages your UIViewControllerRepresentable type’s coordinator, and provides it as part of the context when calling the methods you created above.
     */
    
    /*
     Initialize an array of controllers in the coordinator using the pages array of views.

     The coordinator is a good place to store these controllers, because the system initializes them only once, and before you need them to update the view controller.
     */
    
    class Coordinator: NSObject {
        var parent: PageViewController
        var controllers = [UIViewController]()

        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map {
                UIHostingController(rootView: $0)
            }
        }
    }
}
