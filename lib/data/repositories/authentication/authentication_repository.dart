
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/features/screens/login/login.dart';
import 'package:t_store/features/screens/onboarding/onboarding.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ////var
  final deviceStorage = GetStorage();

  final _auth = FirebaseAuth.instance;


  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    final user = _auth.currentUser;
    if(user != null){
      Get.offAll(()=>const NavigationMenu());
    }
    else{
      //// local storage
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirsTime') != true ? Get
          .offAll(() => const LoginScreen()) : Get.offAll(
          const OnBoardingScreen());
    }
    }

    //// this is for log in with email
  Future<UserCredential> loginWithEmailAndPassword(String email , String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (e) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (e) {
      throw " Something went wrong. please try again";
    }
  }
}


