import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
class AdaptiveFlatButton extends StatelessWidget {

    final String text;
    final VoidCallback handelr;
    AdaptiveFlatButton(this.text, this.handelr);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS? CupertinoButton(child: Text('choose date'), onPressed: handelr) :TextButton(
                      onPressed: handelr, child: Text('choose date'));
  }
}