import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopeymart/CommonFiles/my_bottom_sheet.dart';

class GoogleSignInCtrl extends GetxController{
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? user;

  Future googleLogin()async{
    try {
    MyBottomSheet.myLoader();
      final googleUser = await googleSignIn.signIn();
      Get.back();
      if (googleUser == null) return;
      MyBottomSheet.myLoader();
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      MyBottomSheet.myDialog(message: e.toString(), errorCode: 'Google Login');
    }
  }

  Future googleLogOut() async{
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}