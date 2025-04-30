import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/loaders.dart';

class LoginController extends GetxController {
  /// variables

  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();




  Future<void> emailAndPasswordSignIn() async {
   final manager = Get.put(NetworkManager());
    try {
      final isConnected = await manager.isConnected();
      if (!isConnected) {
        return;
      }
      if (!loginFormKey.currentState!.validate()) {
        return;
      }
      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //// redirect
      AuthenticationRepository.instance.screenRedirect();
    }
    catch(e){
      TLoaders.errorSnackBar(title: 'oh snap', message: e.toString());
    }
  }

}