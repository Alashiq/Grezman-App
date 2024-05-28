import 'package:flutter/material.dart';

class ReloadInside extends StatelessWidget {
  final double? height;
  const ReloadInside({Key? key, @required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: height,
      width: double.infinity,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
