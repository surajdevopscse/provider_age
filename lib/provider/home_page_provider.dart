import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  bool? isEligible;
  String? eligibilityMessage = '';
  void checkEligibility(int age) {
    if (age >= 18) {
      isEligible = true;
      eligibilityMessage = "You are Eligible!";
      notifyListeners();
    } else if (age < 18) {
      isEligible = false;
      eligibilityMessage = "You are not Eligible!";
      notifyListeners();
    }
  }
}
