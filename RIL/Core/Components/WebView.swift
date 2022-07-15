//
//  WebView.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 15/7/22.
//

import SwiftUI
import WebKit

struct WebView: View {
    var url: String?
    @State var isLoading: Bool = false
    
    
    var body: some View {
        WebViewRepresentable(url: URL(string: url ?? "")!, showLoading: $isLoading)
            .overlay(isLoading ? ProgressView().toAnyView() : EmptyView().toAnyView())
    }
}

struct WebViewRepresentable: UIViewRepresentable {
    let url: URL
    @Binding var showLoading: Bool
    
    func makeUIView(context: Context) -> some UIView {
        let webView = WKWebView()
        let request = URLRequest(url: url)
        
        webView.navigationDelegate = context.coordinator
        webView.load(request)
        
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeCoordinator() -> WebViewCoordinator {
        WebViewCoordinator {
            showLoading = true
        } didFinish: {
            showLoading = false
        }

    }
}

class WebViewCoordinator: NSObject, WKNavigationDelegate {
    var didStart: () -> Void
    var didFinish: () -> Void
    
    init(didStart: @escaping ()-> Void = {}, didFinish: @escaping ()-> Void = {}) {
        self.didStart = didStart
        self.didFinish = didFinish
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        didStart()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        didFinish()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(error)
    }
}


struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url: "https://raselindustry.com/service-center/", isLoading: false)
    }
}
