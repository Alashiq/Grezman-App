import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../Features/Auth/Controllers/auth_controller.dart';
import 'widgets/onboard_slide.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardKey = GlobalKey<IntroductionScreenState>();

    return Scaffold(
        body: GetBuilder<AuthController>(
      builder: (controller) => Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: IntroductionScreen(
            // globalBackgroundColor: Color(0xffeff1f7),
            globalBackgroundColor: Color(0xffeff1f7),
            key: onboardKey,
            onChange: (value) {
              controller.onboarding = value;
              controller.update();
              print(value);
            },
            bodyPadding: EdgeInsets.fromLTRB(0, 140, 0, 0),
            globalHeader: Container(
              height: 50,
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.fromLTRB(10, 60, 10, 10),
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 80,
                    ),
                    Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/img/logo.png",
                        height: 42,
                      ),
                    )),
                    Container(
                      width: 80,
                      alignment: Alignment.center,
                      child: controller.onboarding != 2
                          ? InkWell(
                              onTap: () {
                                controller.endBoarding();
                              },
                              child: Text(
                                "تخطي",
                                style: TextStyle(
                                  fontFamily: 'Adelle',
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff5a5a5a),
                                  fontSize: 14,
                                ),
                              ),
                            )
                          : Container(),
                    ),
                  ],
                ),
              ),
            ),
            globalFooter: Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 46),
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  if (controller.onboarding != 2)
                    onboardKey.currentState
                        ?.animateScroll(controller.onboarding + 1);
                  else
                    controller.endBoarding();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff5f8fea),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // <-- Radius
                  ),
                ),
                child: Text(
                  controller.onboarding != 2 ? "التالي" : "إبدأ الأن",
                  style: const TextStyle(
                    fontFamily: 'Adelle',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            pages: [
              onBoardSlide(
                "حسابات الإنترنت",
                "وفرنا لك منصة تقدر من خلالها تتحكم في جميع حساباتك في شركات الإنترنت والإتصالات",
                'https://ouch-cdn2.icons8.com/CKZgO-dLqzDN71048fX8ev-wufQS5VkvoajbcqnoYW0/rs:fit:456:456/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvOTgx/L2ExMTczYmE1LTMw/MDAtNGQyZC1hODIx/LTgxYTQ2OTAxMGIw/Zi5wbmc.png',
                false,
              ),
              onBoardSlide(
                "اقرب نت",
                "من خلال تطبيقنا تقدر تبحث على اقرب شركة إنترنت إليك وتعرف اسعار الشركات وتقدم طلب للإشتراك معهم",
                'https://cdn3d.iconscout.com/3d/premium/thumb/global-location-5617927-4688420.png',
                false,
              ),
              onBoardSlide(
                "متجر الكروت",
                "نوفر لك متجر الكتروني يوفرلك كل كروت شركات الإتصالات والإنترنت, تقدر تشتري الكروت عبر بوابات الدفع الليبية",
                'https://cdn3d.iconscout.com/3d/premium/thumb/mobile-shopping-app-6929801-5686172.png',
                false,
              ),
              // onBoardSlide(
              //   "فرص تبرع متنوعة",
              //   "نغطي كافة المجالات الخيرية وتصل الى من يستحقها من الفئات الاشد احتياجا",
              //   'assets/svg/onboard2.svg',
              //   true,
              // ),
            ],
            showNextButton: false,
            showDoneButton: false,
            dotsDecorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(20.0, 9.0),
              activeColor: Color(0xff5f8fea),
              color: Colors.black26,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
            ),
          ),
        ),
      ),
    ));
  }
}
