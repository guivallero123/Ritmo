import Foundation
import SwiftData

//INICIO DO MODELO HÁBITO
//REPRESENTA UM HABITO SALVO PELO SWIFTDATA

@Model

final class Habito {
    
    //MARK: - INÍCIO DAS PROPRIEDADES
    
    //Nome informado pelo usuário
    var nome: String
    
    //Indica se o hábito foi concluido
    var concluido: Bool
    
    // MARK: - FIM DAS PROPRIEDADES
    
    
    //MARK: - INICIO DO INICIALIZADOR
    
    init(nome: String, concluido: Bool = false) {
        
        self.nome = nome
        self.concluido = concluido
        
    } //FIM DO INIT
    
    // MARK: - FIM DO INICIALIZADOR
    

} //FIM DA CLASS HABITO
