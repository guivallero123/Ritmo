
import Foundation

// ================================================
// MODELO DE DADOS HABITO
// Define as informações de um único hábito.
// ================================================

struct Habito: Identifiable {

    // Identificador único.
    let id = UUID()

    // Nome do hábito.
    var nome: String

    // Estado de conclusão.
    var concluido: Bool = false

} // FIM DA ESTRUTURA HABITO
