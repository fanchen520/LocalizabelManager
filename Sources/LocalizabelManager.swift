struct LocalizabelManager {
    var text = "Hello, World!"
    func textPrint() {
        print(text)
    }
    
    func resetAppBundle() {
        APPBundle.resetBundle()
    }
}
