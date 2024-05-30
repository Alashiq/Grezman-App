import 'package:flutter/material.dart';
import 'package:flutter_starter/Features/Item/Controllers/item_controller.dart';
import 'package:flutter_starter/Themes/Widgets/back_layout.dart';
import 'package:flutter_starter/Utils/auto_load.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NewItemScreen extends StatelessWidget {
  const NewItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackLayout(
      title: 'عنصر جديد',
      child: GetBuilder<ItemController>(
        builder: (itemController) => AutoLoad(
          onInit: () {
            itemController.nameIn.clear();
            itemController.nameValidation = "";
            itemController.descriptionIn.clear();
            itemController.descriptionValidation = "";

            itemController.update();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Container(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Color(0xffeeeeee), width: 1.2),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 5),
                      Text(
                        "اضف عنصر",
                        style: TextStyle(
                          fontFamily: 'Swissra-Medium',
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 25),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "إسم العنصر",
                          style: TextStyle(
                            fontFamily: 'Swissra-Medium',
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        onChanged: (value) {
                          print("hh");
                          itemController.validateName();
                        },
                        controller: itemController.nameIn,
                        style: GoogleFonts.cairo(height: 1.87, fontSize: 18),
                        decoration: InputDecoration(
                          hintText: 'إسم العنصر',
                          hintStyle: TextStyle(
                            fontFamily: 'Swissra-Normal',
                            height: 1.87,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffe8ebf7), width: 1.4),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffe8ebf7), width: 1.4),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: Color(0xffe8ebf7), width: 1.4),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 20),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 6, 10, 0),
                          alignment: Alignment.centerRight,
                          child: Text(
                            itemController.nameValidation,
                            style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'Swissra-Normal',
                              fontSize: 12,
                            ),
                          )),
                      SizedBox(height: 25),
                      Container(
                        padding: EdgeInsets.only(right: 5),
                        alignment: Alignment.centerRight,
                        child: Text(
                          "المحتوى",
                          style: TextStyle(
                              fontFamily: 'Swissra-Medium',
                              fontSize: 15,
                              color: Color(0xff454545)),
                        ),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        onChanged: (value) {
                          // controller.checkPasswordStrength(value);
                        },
                        controller: itemController.descriptionIn,
                        style: GoogleFonts.cairo(height: 1.87, fontSize: 18),
                        decoration: InputDecoration(
                          hintText: 'المحتوى',
                          hintStyle: TextStyle(
                            fontFamily: 'Swissra-Normal',
                            height: 1.87,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffe8ebf7), width: 1.4),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffe8ebf7), width: 1.4),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: Color(0xffe8ebf7), width: 1.4),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 20),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 6, 10, 0),
                          alignment: Alignment.centerRight,
                          child: Text(
                            itemController.descriptionValidation,
                            style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'Swissra-Normal',
                              fontSize: 12,
                            ),
                          )),
                      SizedBox(height: 40),
                      Container(
                        height: 60,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => itemController.addNewItem(),
                          style: ElevatedButton.styleFrom(
                            elevation: 0.4,
                            backgroundColor: Color(0xff7886e9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            "إضافة",
                            style: TextStyle(
                              fontFamily: 'Swissra-Normal',
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
