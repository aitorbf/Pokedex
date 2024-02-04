//
//  NavigationToolbar.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import SwiftUI

private typealias builder = ToolbarItemsBuilder

struct NavigationToolbar: ViewModifier {
    
    let title: String
    let action: ((_ action: ToolbarAction) -> Void)?
    
    func body(content: Content) -> some View {
        NavigationView {
            content
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        builder.iconButton(
                            buttonImage: Image(systemName: Assets.System.chevronLeft),
                            buttonAction: .goBack,
                            action: action,
                            paddingEdge: .all
                        )
                    }
                    ToolbarItem(placement: .principal) {
                        builder.toolbarTitle(title, color: Theme.Color.onBackground)
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NavigationToolbarTestView: View {
    
    var body: some View {
        ZStack {
            Text("NavigationToolbar")
        }
        .toolbar(.backButton) { action in
            print(action)
        }
    }
}

struct NavigationToolbarTestView_Previews: PreviewProvider {
    static var previews: some View {
        DevicesPreview {
            NavigationToolbarTestView()
        }
    }
}
