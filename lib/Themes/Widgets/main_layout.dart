import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'bottom_bar.dart';
import 'main_app_bar.dart';

class MainLayout extends StatelessWidget {
  final int pageId;
  final String title;
  final Widget? child;

  const MainLayout(
      {super.key,
      required this.pageId,
      @required this.child,
      required this.title});

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
            MainAppBar(
              title: title,
            ),
            Hero(tag: "bottmbar", child: BottomBar(activeTab: pageId)),
          ],
        ),
      ),
    );
  }
}
