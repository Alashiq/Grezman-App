import 'package:flutter/material.dart';
import 'package:flutter_starter/Const/color_list.dart';

class ReloadInside extends StatelessWidget {
  final double? height;
  const ReloadInside({Key? key, @required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: CircularProgressIndicator(
          color: AppColor.BASE_BUTTON.color,
        ),
      ),
    );
  }
}
