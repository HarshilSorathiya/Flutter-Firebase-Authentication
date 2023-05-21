import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/Screens/login_screen.dart';
import 'package:flutter_firebase_auth/Utils/showOtpDialogBox.dart';
import 'package:flutter_firebase_auth/Utils/show_snackbar.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthMethods {
  FirebaseAuthMethods(this.auth);

  final FirebaseAuth auth;

  // Email -Password Authntication..

  Future<void> signupWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await sendEmailVerificatin(context);
    } on FirebaseAuthException catch (e) {
      print(e);
      showSnackBar(context, e.message!);
    }
  }

  ////  Email verification ....

  Future<void> sendEmailVerificatin(BuildContext context) async {
    try {
      auth.currentUser!.sendEmailVerification();
      showSnackBar(context, "Email Verification Sent!");
      print('User is verifed');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

///// logIn with email

  Future<void> signinWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (auth.currentUser!.emailVerified == false) {
        await sendEmailVerificatin(context);
      }
      showSnackBar(
          context, 'hi, ${auth.currentUser!.email}. welcome to our World');
    } on FirebaseAuthException catch (e) {
      print(e);
      showSnackBar(context, e.message!);
    }
  }

  ///phone NUmber Authentication

  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required BuildContext context,
  }) async {
    TextEditingController codeController = TextEditingController();
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (error) {
        print(error);
        showSnackBar(context, error.message!);
      },
      codeSent: (verificationId, forceResendingToken) async {
        showOTPDialogBox(
            context: context,
            codeController: codeController,
            onPressed: () async {
              PhoneAuthCredential credential = PhoneAuthProvider.credential(
                verificationId: verificationId,
                smsCode: codeController.text.trim(),
              );
              await auth.signInWithCredential(credential);
              print('you signedIn');
              Navigator.pop(context);
            });
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  //  Sing in with google
  //

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        final credential = GoogleAuthProvider.credential(
            idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

        UserCredential userCredential =
            await auth.signInWithCredential(credential);
        print(userCredential.user);

        googleUser!.authentication
            .whenComplete(() => Navigator.pushNamed(context, '/0'));
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  Future<void> signInAnonymous(BuildContext context) async {
    try {
      await auth.signInAnonymously();
    } on FirebaseAuthException catch (e) {}
  }

  //SignOut

  Future<void> signOut(BuildContext context) async {
    await auth.signOut();
  }
}
