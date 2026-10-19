import SwiftUI

// MARK: - INÍCIO DA TELA HOJE

struct HojeView: View {
    
    //MARK - INÍCIO DA INTERFACE
    var body: some View{
        VStack(spacing: 16) {
            Text("Hoje")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Um dia de cada vez.")
                .foregroundStyle(.secondary)
            
        } // FIM DO VSTACK
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        
    } //Fim do body
    //MARK: - FIM DA TELA HOJE
    
    // MARK: - INÍCIO DA PRÉVIA
    
}
#Preview {
    HojeView()
}
    
    // MARK: - FIM DA PRÉVIA
    

