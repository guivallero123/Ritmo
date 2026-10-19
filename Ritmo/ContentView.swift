
import SwiftUI

// ================================================
// INÍCIO DA CONTENTVIEW
// Responsável pela navegação principal do Ritmo.
// ================================================

struct ContentView: View {

    // MARK: - INÍCIO DO ESTADO DA NAVEGAÇÃO

    // Guarda a seção selecionada na barra lateral.
    // O ? permite que a seleção também seja nil.
    @State private var selecao: Secao? = .hoje

    // MARK: - FIM DO ESTADO DA NAVEGAÇÃO


    // MARK: - INÍCIO DOS DADOS COMPARTILHADOS

    // ContentView é dona da lista de hábitos.
    @State private var habitos: [Habito] = [
        Habito(nome: "Ler 20 minutos"),
        Habito(nome: "Caminhar 30 minutos")
    ]

    // MARK: - FIM DOS DADOS COMPARTILHADOS


    // MARK: - INÍCIO DAS SEÇÕES DO APLICATIVO

    enum Secao: String, CaseIterable, Identifiable {

        // Opções disponíveis na barra lateral.
        case hoje = "Hoje"
        case habitos = "Hábitos"
        case rotinas = "Rotinas"

        // Identificador de cada seção.
        var id: Self { self }

        // Ícone correspondente a cada seção.
        var simbolo: String {

            switch self {

            case .hoje:
                return "checkmark.circle"

            case .habitos:
                return "repeat"

            case .rotinas:
                return "calendar"

            } // FIM DO SWITCH DOS SÍMBOLOS

        } // FIM DA PROPRIEDADE simbolo

    } // FIM DA ENUM Secao

    // MARK: - FIM DAS SEÇÕES DO APLICATIVO


    // ============================================
    // INÍCIO DO BODY
    // ============================================

    var body: some View {

        // Divide a janela em barra lateral e conteúdo.
        NavigationSplitView {

            // ====================================
            // INÍCIO DA BARRA LATERAL
            // ====================================

            List(Secao.allCases, selection: $selecao) { secao in

                // Mostra o nome e o ícone da seção.
                Label(
                    secao.rawValue,
                    systemImage: secao.simbolo
                )
                .tag(secao)

            } // FIM DA LIST DA BARRA LATERAL

            .navigationTitle("Ritmo")
            .listStyle(.sidebar)

            // ====================================
            // FIM DA BARRA LATERAL
            // ====================================

        } detail: {

            // ====================================
            // INÍCIO DO CONTEÚDO PRINCIPAL
            // ====================================

            // Escolhe a tela com base na seleção.
            switch selecao {

            // INÍCIO DO CASO HOJE
            case .hoje:

                // A HojeView recebe os hábitos
                // apenas para consultar os dados.
                // Por isso, usamos habitos sem $.
                HojeView(habitos: habitos)

            // FIM DO CASO HOJE


            // INÍCIO DO CASO HÁBITOS
            case .habitos:

                // A HabitosView pode modificar a lista.
                // Por isso, usamos $habitos (Binding).
                HabitosView(habitos: $habitos)

            // FIM DO CASO HÁBITOS


            // INÍCIO DO CASO ROTINAS
            case .rotinas:

                // Apresenta a tela de rotinas.
                RotinasView()

            // FIM DO CASO ROTINAS


            // INÍCIO DO CASO SEM SELEÇÃO
            case nil:

                Text("Selecione uma seção")
                    .foregroundStyle(.secondary)

            // FIM DO CASO SEM SELEÇÃO

            } // FIM DO SWITCH

            // ====================================
            // FIM DO CONTEÚDO PRINCIPAL
            // ====================================

        } // FIM DO NAVIGATIONSPLITVIEW

        // Define o tamanho mínimo da janela.
        .frame(minWidth: 650, minHeight: 400)

    } // FIM DO BODY

} // FIM DA STRUCT ContentView

// ================================================
// FIM DA CONTENTVIEW
// ================================================

