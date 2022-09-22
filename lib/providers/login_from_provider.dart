import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  bool _isloading = false;
  bool _recordar = false;

  bool get isLoading => _isloading;
  set isLoading(bool value) {
    _isloading = value;
    notifyListeners();
  }

  bool get recordar => _recordar;
  set recordar(bool value) {
    _recordar = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}
