import 'package:get/get.dart';

import '../../../Config/shared_preferences.dart';

mixin OnBoardingMixin {
  int onboarding = 0;

  endBoarding() async {
    await saveString("onboarding", "done");
    print(await loadString("onboarding"));
    Get.offAndToNamed("/login");
  }
}
