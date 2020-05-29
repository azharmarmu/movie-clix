import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

loadingBar(
  BuildContext context, {
  bool barrierDismissible: true,
}) {
  return showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[SpinKitPulse(color: Colors.white)],
    ),
  );
}
