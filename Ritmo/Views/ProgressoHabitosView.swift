import SwiftUI

// ================================================
// INÍCIO DO COMPONENTE DE PROGRESSO
// Mostra o resumo dos hábitos concluídos.
// ================================================


struct ProgressoHabitosView: View {
    // MARK: - INÍCIO DOS DADOS RECEBIDOS
    
    //Quantidade de hábitos concluídos
    
    let concluidos: Int
    
    //Quantidade total de hábitos.
    
    let total: Int
    
    // MARK: - FIM DOS DADOS RECEBIDOS
    
    
    // MARK: - INÍCIO DOS CÁLCULOS
    
    //Calcula o progresso de 0.0 a 1.0
    
    private var progresso: Double {
        
        //Evita divisão por zero.
        
        guard total > 0 else {
            return 0
        }
        
        return Double(concluidos)/Double(total)
        
    } // FIM DA PROPRIEDADE progresso
    
    // MARK: - FIM DOS CÁlCULOS
    
    
    
    // ================================================
    // INÍCIO DA INTERFACE
    // ================================================
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 14) {
            
            // MARK: - INÍCIO DO CABEÇALHO DO CARTÃO
            
            VStack {
                
                Text("Progresso diário")
                    .font(.headline)
                
                Spacer()
                
                Text("\(concluidos) de \(total)")
                    .foregroundStyle(.secondary)
                
            } // FIM DO HSTACK
            
            
            // MARK: - INÍCIO DA BARRA DE PROGRESSO
            
            ProgressView(value: progresso, total: 1)
            
            // MARK: - FIM DA BARRA DE PROGRESSO
            
            // MARK: - INÍCIO DA PORCENTAGEM
            
            Text("\(Int(progresso * 100))% dos hábitoa concluidos")
                .font( .subheadline)
                .foregroundStyle(.secondary)
            
            // MARK: - FIM DA PORCENTAGEM
            
            
        }// FIM DO VSTACK DO CARTÃO
        
        //Aparência do cartão.
        
        .padding(20)
        .background(.quaternary.opacity(0.3))
        .clipShape(
            RoundedRectangle(cornerRadius: 20)
        )
    } // FIM DO BODY
    
    // ================================================
    // FIM DA INTERFACE
    // ================================================

} // FIM DA STRUCT ProgressoHabitosView


// ================================================
// FIM DO COMPONENTE DE PROGRESSO
// ================================================

#Preview {
    
    ProgressoHabitosView(
        concluidos: 1,
        total: 2
    )
    
    .padding()
    
} // FIM DA PREVIA
