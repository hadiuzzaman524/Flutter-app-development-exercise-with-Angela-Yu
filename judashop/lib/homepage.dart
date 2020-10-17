import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:connectivity/connectivity.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class WebApplication extends StatefulWidget {
  @override
  _WebApplicationState createState() => _WebApplicationState();
}

closeScreen(BuildContext context) {

  return SystemNavigator.pop();
}

WebViewController controllerGlobal;

Future<bool> _exitApp(BuildContext context) async {
  if (await controllerGlobal.canGoBack()) {
    print("onwill goback");
    controllerGlobal.goBack();
  } else {
    closeScreen(context);
    Scaffold.of(context).showSnackBar(
      const SnackBar(content: Text("No back history item")),
    );

    return Future.value(false);
  }
}

class _WebApplicationState extends State<WebApplication> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  var alertStyle = AlertStyle(
    animationType: AnimationType.fromTop,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.normal,fontSize: 20),
    descTextAlign: TextAlign.center,
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: TextStyle(
      color: Colors.red,
    ),
    alertAlignment: Alignment.topCenter,
  );

showAlert(){
  Alert(
    context: context,
    style: alertStyle,
    type: AlertType.info,
    title: "NO INTERNET",
    desc: "MAKE SURE YOU HAVE AN INTERNET CONNECTION.",
    buttons: [
      DialogButton(
        child: Text(
          "CANCEL",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
        color: Color.fromRGBO(0, 179, 134, 1.0),
        radius: BorderRadius.circular(0.0),
      ),
    ],
  ).show();
}

  _checkInternetConnetion() async {

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {} else
    if (connectivityResult == ConnectivityResult.wifi) {} else {
      showAlert();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _exitApp(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF3A2A2F),
          // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
          actions: <Widget>[
            NavigationControls(_controller.future),
          ],
        ),
        // We're using a Builder here so we have a context that is below the Scaffold
        // to allow calling Scaffold.of(context) so we can show a snackbar.
        body: Builder(builder: (BuildContext context) {
          return WebView(
            initialUrl: 'https://juda.shop/',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onPageStarted: (start) {
              setState(() {
                _checkInternetConnetion();
              });
            },
            /*    onPageFinished: (finish) {
                  setState(() {
                    _checkInternetConnetion();
                  });
                },*/
          );
        }),
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture)
      : assert(_webViewControllerFuture != null);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        final WebViewController controller = snapshot.data;
        controllerGlobal = controller;

        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: !webViewReady
                    ? null
                    : () async {
                  if (await controller.canGoBack()) {
                    controller.goBack();
                  } else {
                    Scaffold.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("No back history item")),
                    );
                    return;
                  }
                },
              ),
              SizedBox(
                width: 20.0,
              ),
              IconButton(
                icon: const Icon(Icons.replay),
                onPressed: !webViewReady
                    ? null
                    : () {
                  controller.reload();
                },
              ),
              SizedBox(
                width: 20.0,
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: !webViewReady
                    ? null
                    : () async {
                  if (await controller.canGoForward()) {
                    controller.goForward();
                  } else {
                    Scaffold.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("No forward history item")),
                    );
                    return;
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
