
import SwiftUI

// ================================================
// INÍCIO DA TELA HOJE
// Mostra o progresso dos hábitos do usuário.
// ================================================

struct HojeView: View {

    // MARK: - INÍCIO DOS DADOS RECEBIDOS

    // Recebe os hábitos enviados pela ContentView.
    // Como apenas consultamos a lista, usamos let.
    let habitos: [Habito]

    // MARK: - FIM DOS DADOS RECEBIDOS


    // MARK: - INÍCIO DOS CÁLCULOS DE PROGRESSO

    // Calcula a quantidade total de hábitos.
    private var totalHabitos: Int {

        habitos.count

    } // FIM DA PROPRIEDADE totalHabitos


    // Calcula quantos hábitos estão concluídos.
    private var habitosConcluidos: Int {

        // filter seleciona apenas os hábitos
        // cujo campo concluido seja true.
        habitos.filter { habito in

            habito.concluido

        }.count // Conta os itens selecionados.

    } // FIM DA PROPRIEDADE habitosConcluidos
    
    
    // MARK: - INÍCIO DO CÁLCULO DA PROPORÇÃO
    
    private var progresso: Double {
        //Se não houver hábitos, retorna zero, isso evita dividir um numero por zero
        
        guard totalHabitos > 0 else {
            return 0
        }
        
        return Double(habitosConcluidos) / Double(totalHabitos)
        
    } // FIM DA PROPRIESDADE progresso
      
      // MARK: - FIM DO ÇALCUULO DA PROPORÇÃO

    // MARK: - FIM DOS CÁLCULOS DE PROGRESSO


    // ============================================
    // INÍCIO DA INTERFACE
    // ============================================

    var body: some View {

        VStack(spacing: 16) {

            // Título da tela.
            Text("Hoje")
                .font(.largeTitle)
                .fontWeight(.bold)

            // Mensagem de incentivo.
            Text("Um dia de cada vez.")
                .foregroundStyle(.secondary)

            // Mostra os números calculados.
            Text(
                "Hábitos concluídos: \(habitosConcluidos) de \(totalHabitos)"
            )
            .font(.headline)
            
            //MARK: - INÍCIO DA BARRA DE PROGRESSO
            //ProgressView mostra visualmente o progresso
            //O valor varia de 0.0 até 1.0
            
            ProgressView(value: progresso, total: 1)
                .frame(maxWidth: 320)
            
            //MARK: - FIM DA BARRA DE PROGRESSO
            
            //MARK: - INÍCIO DA PORCENTAGEM
            
            //multiplica poe 100 para exigir a porcentagem
            //int remove as casas decimais do texto
            
            Text("\(Int(progresso * 100))% concluido")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                 
                 // MARK: - FIM DA PORCENTAGEM
            
            
            
            
            
            
            
            
            
            
            
            
            

        } // FIM DO VSTACK

        // Ocupa o espaço disponível na tela.
        .frame(maxWidth: .infinity, maxHeight: .infinity)

    } // FIM DO BODY

    // ============================================
    // FIM DA INTERFACE
    // ============================================

} // FIM DA STRUCT HojeView

// ================================================
// FIM DA TELA HOJE
// ================================================


// MARK: - INÍCIO DA PRÉVIA

#Preview {

    // Dados de exemplo usados somente na prévia.
    HojeView(
        habitos: [
            Habito(nome: "Ler 20 minutos", concluido: true),
            Habito(nome: "Caminhar 30 minutos")
        ]
    )

} // FIM DA PRÉVIA
