import SwiftUI
import AVFoundation

struct BookView: View {
    @EnvironmentObject var languageManager: LanguageManager
    @State private var currentPage = 0
    @State private var isBackButtonPressed = false
    @State private var isNextButtonPressed = false
    @State private var frameWidth: CGFloat = 0.65
    @State private var frameHeight: CGFloat = 0.9
    @State private var frameCornerRadius: CGFloat = 15
    @State private var frameBorderColor: Color = .blue
    @State private var bookPages: [String] = []
    
    @State private var audioPlayer: AVAudioPlayer?
    @State private var isAudioPlaying = false
    @State private var showControls = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("Rio")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.3)
                    .edgesIgnoringSafeArea(.all)

                if !bookPages.isEmpty {
                    Text(bookPages[currentPage])
                        .font(.system(size: 22))
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(frameCornerRadius)
                        .shadow(radius: 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: frameCornerRadius)
                                .stroke(frameBorderColor, lineWidth: 2)
                        )
                        .frame(width: geometry.size.width * frameWidth, height: geometry.size.height * frameHeight)
                        .animation(.easeInOut(duration: 0.5), value: currentPage)
                        .transition(currentPage % 2 == 0 ? .slide : .move(edge: .trailing))
                        .offset(x: geometry.size.width * 0, y: geometry.size.height * -0.1)
                } else {
                    Text("Cargando historia...")
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(frameCornerRadius)
                        .shadow(radius: 10)
                        .frame(width: geometry.size.width * frameWidth, height: geometry.size.height * frameHeight)
                        .offset(x: geometry.size.width * 0.1, y: geometry.size.height * -0.1)
                }

                VStack {
                    Spacer()
                    HStack {
                        Button(action: {
                            if currentPage > 0 {
                                withAnimation {
                                    currentPage -= 1
                                }
                            }
                        }) {
                            Text(languageManager.getLocalizedText(for: "BotonAtras"))
                                .padding()
                                .frame(width: 200, height: 125)
                                .font(.system(size: 30))
                                .background(isBackButtonPressed ? Color.blue : Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .shadow(radius: isBackButtonPressed ? 10 : 5)
                                .scaleEffect(isBackButtonPressed ? 1.05 : 1.0)
                        }
                        .disabled(currentPage == 0)
                        .simultaneousGesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged({ _ in
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        isBackButtonPressed = true
                                    }
                                })
                                .onEnded({ _ in
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        isBackButtonPressed = false
                                    }
                                })
                        )

                        Spacer()

                        if currentPage == bookPages.count - 1 {
                            NavigationLink(destination: CulturaView()) {
                                HStack {
                                    Text(languageManager.getLocalizedText(for: "BotonIrCultura"))
                                    Image(systemName: "flag.fill")
                                }
                                .padding()
                                .frame(width: 200, height: 125)
                                .font(.system(size: 30))
                                .background(isNextButtonPressed ? Color.blue : Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .shadow(radius: isNextButtonPressed ? 10 : 5)
                                .scaleEffect(isNextButtonPressed ? 1.05 : 1.0)
                            }
                        } else {
                            Button(action: {
                                if currentPage < bookPages.count - 1 {
                                    withAnimation {
                                        currentPage += 1
                                    }
                                }
                            }) {
                                Text(languageManager.getLocalizedText(for: "BotonSiguiente"))
                                    .frame(width: 200, height: 125)
                                    .font(.system(size: 30))
                                    .background(isNextButtonPressed ? Color.blue : Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                                    .shadow(radius: isNextButtonPressed ? 10 : 5)
                                    .scaleEffect(isNextButtonPressed ? 1.05 : 1.0)
                            }
                            .disabled(currentPage == bookPages.count - 1)
                            .simultaneousGesture(
                                DragGesture(minimumDistance: 0)
                                    .onChanged({ _ in
                                        withAnimation(.easeInOut(duration: 0.2)) {
                                            isNextButtonPressed = true
                                        }
                                    })
                                    .onEnded({ _ in
                                        withAnimation(.easeInOut(duration: 0.2)) {
                                            isNextButtonPressed = false
                                        }
                                    })
                            )
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.5))
                }
                
                VStack {
                    Button(action: {
                        if !isAudioPlaying {
                            playSound(for: languageManager.selectedLanguage)
                            showControls = true
                        }
                    }) {
                        Image("Bocina")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding()
                    }
                    
                    if showControls {
                        HStack {
                            Button(action: {
                                pauseAudio()
                            }) {
                                Text("Pausa")
                                    .padding()
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            Button(action: {
                                resumeAudio()
                            }) {
                                Text("Reanudar")
                                    .padding()
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                        }
                    }
                }.offset(x: -500, y: -260)
                
                HStack {
                    LanguageSwitcher()
                }.offset(x: 490, y: -350)  // Modificado para ajustar el botón hacia arriba
                
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .navigationTitle(languageManager.getLocalizedText(for: "Historia de la cultura Mam"))
            .navigationBarBackButtonHidden(true)
            .onAppear {
                loadBookPages()
            }
            .onChange(of: languageManager.selectedLanguage) { _ in
                stopAudioAndHideControls()
                loadBookPages()
            }
        }
    }

    private func loadBookPages() {
        let fullStory = languageManager.getLocalizedText(for: "Historia Mam")
        let pageSize = fullStory.count / 5
        var pages: [String] = []

        var currentIndex = fullStory.startIndex
        for _ in 0..<4 {
            let endIndex = fullStory.index(currentIndex, offsetBy: pageSize, limitedBy: fullStory.endIndex) ?? fullStory.endIndex
            let page = String(fullStory[currentIndex..<endIndex])
            pages.append(page)
            currentIndex = endIndex
        }

        let lastPage = String(fullStory[currentIndex..<fullStory.endIndex])
        pages.append(lastPage)

        self.bookPages = pages
    }

    private func playSound(for language: String) {
        var audioFileName: String
        
        switch language {
        case "es":
            audioFileName = "audio_es"
        case "en":
            audioFileName = "audio_en"
        case "mam":
            audioFileName = "audio_mam"
        default:
            return
        }

        guard let url = Bundle.main.url(forResource: audioFileName, withExtension: "mp3") else {
            print("No se encontró el archivo \(audioFileName).mp3")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
            isAudioPlaying = true
        } catch {
            print("Error al reproducir el audio: \(error.localizedDescription)")
        }
    }

    private func pauseAudio() {
        audioPlayer?.pause()
        isAudioPlaying = false
    }

    private func resumeAudio() {
        audioPlayer?.play()
        isAudioPlaying = true
    }

    private func stopAudioAndHideControls() {
        audioPlayer?.stop()
        isAudioPlaying = false
        showControls = false
    }
}

#Preview{
    BookView().environmentObject(LanguageManager()) // Proporciona el EnvironmentObject aquí
}
