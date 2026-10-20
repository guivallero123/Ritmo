
import SwiftUI

// ================================================
// INÍCIO DA TELA PRINCIPAL DO RITMO
// ================================================

struct ContentView: View {

    // MARK: - INÍCIO DOS ESTADOS

    // Controla a seção selecionada na barra lateral.
    @State private var selecao: Secao? = .hoje

    // Lista compartilhada de hábitos.
    // Por enquanto, os dados ficam apenas na memória.
    @State private var habitos: [Habito] = [
        Habito(nome: "Ler 20 minutos"),
        Habito(nome: "Caminhar 30 minutos")
    ]

    // MARK: - FIM DOS ESTADOS


    // MARK: - INÍCIO DAS SEÇÕES DE NAVEGAÇÃO

    enum Secao: String, CaseIterable, Identifiable {

        case hoje = "Hoje"
        case habitos = "Hábitos"
        case rotinas = "Rotinas"

        // Identificador de cada seção.
        var id: Self {
            self
        }

        // Ícone apresentado na barra lateral.
        var simbolo: String {

            switch self {

            case .hoje:
                return "checkmark.circle"

            case .habitos:
                return "repeat"

            case .rotinas:
                return "calendar"

            } // FIM DO SWITCH

        } // FIM DA PROPRIEDADE simbolo

    } // FIM DO ENUM Secao

    // MARK: - FIM DAS SEÇÕES DE NAVEGAÇÃO


    // ================================================
    // INÍCIO DA INTERFACE
    // ================================================

    var body: some View {

        NavigationSplitView {

            // MARK: - INÍCIO DA BARRA LATERAL

            List(Secao.allCases, selection: $selecao) { secao in

                Label(
                    secao.rawValue,
                    systemImage: secao.simbolo
                )
                .tag(secao)

            } // FIM DA LISTA DE NAVEGAÇÃO

            .navigationTitle("Ritmo")
            .listStyle(.sidebar)

            // MARK: - FIM DA BARRA LATERAL

        } detail: {

            // MARK: - INÍCIO DO CONTEÚDO PRINCIPAL

            switch selecao {

            case .hoje:

                // Binding: a tela Hoje pode consultar
                // e modificar os hábitos.
                HojeView(habitos: $habitos)

            case .habitos:

                // A tela Hábitos usa a mesma lista.
                HabitosView(habitos: $habitos)

            case .rotinas:

                RotinasView()

            case nil:

                Text("Selecione uma seção")
                    .foregroundStyle(.secondary)

            } // FIM DO SWITCH

            // MARK: - FIM DO CONTEÚDO PRINCIPAL

        } // FIM DO NAVIGATIONSPLITVIEW

        .frame(minWidth: 650, minHeight: 400)

    } // FIM DO BODY

    // ================================================
    // FIM DA INTERFACE
    // ================================================

} // FIM DA STRUCT ContentView


// MARK: - INÍCIO DA PRÉVIA

#Preview {
    ContentView()
} // FIM DA PRÉVIA
