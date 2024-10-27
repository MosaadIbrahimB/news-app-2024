import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../data/model/ResponseNews.dart';
import '../widget/shape_widget.dart';
class WebViewScreen extends StatefulWidget {
  static const nameRoute = "WebViewScreen";
  Articles? article;
  WebViewScreen({super.key,  this.article});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
late WebViewController controller;
@override
  void initState() {
  print("${widget.article?.url} ddddddddddddddd");
  controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onHttpError: (HttpResponseError error) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith(widget.article?.url??"")) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse(widget.article?.url??""));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: ShapeWidget.getShapeBorderWidget(),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          widget.article?.title ?? "",
          style: const TextStyle(color: Colors.white),
        ),
      ),
    body:   WebViewWidget(controller: controller),

    );
  }
@override
  void dispose() {
  controller.clearCache();  // Clear cache if necessary

  super.dispose();
}
}
