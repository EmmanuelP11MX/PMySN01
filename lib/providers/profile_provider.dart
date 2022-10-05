import 'package:flutter/material.dart';
import 'package:practica1/database/database_user.dart';
import 'package:practica1/models/users_model.dart';

class ProfileProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  UserDAO userDAO = UserDAO(
    fullName: '',
    email: '',
    phone: '',
    githubpage: '',
    image: '',
  );

  bool isfullUser = false;

  bool _isloading = false;
  bool get isLoading => _isloading;
  set isLoading(bool value) {
    _isloading = value;
    notifyListeners();
  }

  selectImage(String image) {
    userDAO.image = image;
    notifyListeners();
  }

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }

  newUser(String email) async {
    userDAO.email = email;
    final id = await DBProviderUser.db.newUser(userDAO);
    userDAO.id = id;
    notifyListeners();
  }

  cargarUser() async {
    final user = await DBProviderUser.db.getUser();
    userDAO = user![0];
    notifyListeners();
  }

  borrarUser() async {
    print(userDAO.id);
    await DBProviderUser.db.deleteUser(userDAO.id!);
    print("eliminado${userDAO.fullName}");
    userDAO = UserDAO();
  }

  actualizar() async {
    await DBProviderUser.db.updateUser(userDAO);
    cargarUser();
  }
}
