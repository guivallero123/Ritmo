
import SwiftUI

// ================================================
// INÍCIO DA CONTENTVIEW
// Responsável pela navegação principal do Ritmo.
// ================================================

struct ContentView: View {

    // MARK: - Estado da navegação

    // Guarda a seção selecionada.
    @State private var selecao: Secao? = .hoje

    // MARK: - Dados compartilhados

    // A ContentView continua sendo dona da lista.
    @State private var habitos: [Habito] = [
        Habito(nome: "Ler 20 minutos"),
        Habito(nome: "Caminhar 30 minutos")
    ]

    // MARK: - Seções do aplicativo

    enum Secao: String, CaseIterable, Identifiable {

        case hoje = "Hoje"
        case habitos = "Hábitos"
        case rotinas = "Rotinas"

        var id: Self { self }

        var simbolo: String {
            switch self {
            case .hoje:
                return "checkmark.circle"
            case .habitos:
                return "repeat"
            case .rotinas:
                return "calendar"
            }
        }

    } // FIM DA ENUM Secao

    // ============================================
    // INÍCIO DO BODY
    // ============================================

    var body: some View {

        NavigationSplitView {

            // INÍCIO DA BARRA LATERAL

            List(Secao.allCases, selection: $selecao) { secao in

                Label(
                    secao.rawValue,
                    systemImage: secao.simbolo
                )
                .tag(secao)

            } // FIM DA LISTA DA BARRA LATERAL

            .navigationTitle("Ritmo")
            .listStyle(.sidebar)

        } detail: {

            // INÍCIO DO CONTEÚDO PRINCIPAL

            switch selecao {

            // PÁGINA HOJE

            case .hoje:
                Text("Um dia de cada vez.")
                    .font(.title)

            // PÁGINA HÁBITOS

            case .habitos:

                // Apresenta a View criada em outro arquivo.
                // $habitos passa um Binding para a lista.
                HabitosView(habitos: $habitos)

            // PÁGINA ROTINAS

            case .rotinas:
                Text("Minhas rotinas")
                    .font(.title)

            // NENHUMA SEÇÃO SELECIONADA

            case nil:
                Text("Selecione uma seção")
                    .foregroundStyle(.secondary)

            } // FIM DO SWITCH

        } // FIM DO NAVIGATIONSPLITVIEW

        .frame(minWidth: 650, minHeight: 400)

    } // FIM DO BODY

} // FIM DA ESTRUTURA CONTENTVIEW
