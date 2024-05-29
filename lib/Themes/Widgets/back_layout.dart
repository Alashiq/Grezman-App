import 'package:flutter/material.dart';
import 'package:flutter_starter/Themes/Widgets/back_app_bar.dart';

class BackLayout extends StatelessWidget {
  final String title;
  final Widget? child;

  const BackLayout({super.key, @required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xfffafbfd),
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 105, 0, 80),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: child,
              ),
            ),
            BackAppBar(
              title: title,
            ),
          ],
        ),
      ),
    );
  }
}
