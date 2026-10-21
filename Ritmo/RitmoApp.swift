//
//  RitmoApp.swift
//  Ritmo
//
//  Created by Guilherme Henrique Vallero Rocha on 14/10/26.
//

import SwiftUI
import SwiftData

//INICIO DO APLICATIVO RITMO
//CONFIGURA A JANELA E A PERSISTENCIA DOS DADOS

@main
struct RitmoApp: App {
    
    // MARK: - INÍCIO DA INTERFACE PRINCIPAL
    
    var body: some Scene {
        WindowGroup {
            //Tela principal do aplicativo
            ContentView()
        } //fim do windowGroup
        
        //Configura o armazenamento persistente para os objetos do tipo habito
        
        .modelContainer(for: Habito.self)
        
    } //FIM DA STRUCT RitmoApp
} //FIM DO APP
