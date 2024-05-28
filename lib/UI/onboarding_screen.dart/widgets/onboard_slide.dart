import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

PageViewModel onBoardSlide(title, description, image, isSvg) {
  return PageViewModel(
    titleWidget: Text(
      title,
      style: TextStyle(
        fontSize: 21,
        fontFamily: 'Adelle',
        color: Color(0xff5f8fea),
        fontWeight: FontWeight.w600,
      ),
    ),
    bodyWidget: Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Text(
        description,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          fontFamily: 'Adelle',
          color: Color(0xff333333),
        ),
      ),
    ),
    image: Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: isSvg ? SvgPicture.asset(image) : Image.network(image),
    ),
  );
}
