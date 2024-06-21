//
//  HostingController.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 27/1/24.
//

import SwiftUI

final class HostingController<ContentView: View>: UIHostingController<AnyView> {
    
    init(rootView: ContentView) {
        let view: AnyView
        view = AnyView(rootView)
        super.init(rootView: view)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // iOS 16: Needed to enable the Toolbar user interaction
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
