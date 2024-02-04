//
//  MainLogoToolbar.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import SwiftUI

private typealias builder = ToolbarItemsBuilder

struct MainLogoToolbar: ViewModifier {
    
    func body(content: Content) -> some View {
        NavigationView {
            content
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        builder.logoIcon(
                            logo: Image(Assets.images.pokedex)
                        )
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MainLogoToolbarTestView: View {
    
    var body: some View {
        ZStack {
            Text("MainLogoToolbar")
        }
        .toolbar(.logo)
    }
}

struct MainToolbarTestView_Previews: PreviewProvider {
    static var previews: some View {
        DevicesPreview {
            MainLogoToolbarTestView()
        }
    }
}
