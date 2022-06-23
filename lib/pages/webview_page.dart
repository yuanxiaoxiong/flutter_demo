import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

String url = 'https://www.nmme.cc/';
bool _isShow = true;

///市集：市集使用两个webView代替，因为豆瓣中 这个就是WebView
class WebViewPageWidget extends StatelessWidget {
  const WebViewPageWidget({Key? key}) : super(key: key);

  void setShowState(bool isShow) {
    _isShow = isShow;
  }

  @override
  Widget build(BuildContext context) {
    return _WebViewWidget(url);
  }
}

class _WebViewWidget extends StatefulWidget {
  final String url;

  const _WebViewWidget(this.url, {Key? key}) : super(key: key);

  @override
  _WebViewWidgetState createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<_WebViewWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build widget.url=${widget.url}');
    return WebView(
      initialUrl: widget.url,
      // userAgent:
          // "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36",
    );
  }
}
