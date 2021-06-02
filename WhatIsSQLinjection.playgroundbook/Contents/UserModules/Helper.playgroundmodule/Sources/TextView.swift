


import SwiftUI
import UIKit

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

public struct TextView: UIViewRepresentable {
    let placeholder: String 
    @Binding var text: String
    
    public init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
    }
    
    public func makeUIView(context: Context) -> UITextField {
        let textView = UITextField()
        
        textView.setRightPaddingPoints(10)
        textView.setLeftPaddingPoints(10)
        textView.backgroundColor = #colorLiteral(red: 0.2549019607843137, green: 0.27450980392156865, blue: 0.30196078431372547, alpha: 1.0)
        textView.textColor = .white
        textView.layer.cornerRadius = 10
        textView.delegate = context.coordinator
        textView.autocapitalizationType = .none
        textView.smartQuotesType = .no
        textView.autocorrectionType = .no
        textView.placeholder = "\(self.placeholder)"
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.addTarget(context.coordinator, 
                           action: #selector(Coordinator.textFieldDidChange(_:)), for: .editingChanged)
        
        return textView
    }
    
    public func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator($text)
    }
    
    public class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String
        
        public init(_ text: Binding<String>) {
            self._text = text
        }
        
        @objc func textFieldDidChange(_ textField: UITextField) {
            self.$text.wrappedValue = textField.text ?? ""
        }
    }
}
