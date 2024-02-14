
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'loginViewModel.g.dart';

class LoginViewModel = _LoginViewModel with _$LoginViewModel;


abstract class _LoginViewModel with Store{

    @observable
    String phoneNumber = "+7";

    @observable
    String? verificaionCode = "";

    @observable
    bool isCodeVerified = false;

    @observable
     TextEditingController pinEditingController = TextEditingController();

    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


    Future<void> signInWithTelephone() async{
        await _firebaseAuth.verifyPhoneNumber(
            phoneNumber: "+7$phoneNumber",
            verificationCompleted: (credential) async{
            },
            verificationFailed: (e){
                print(e);
            },
            codeSent: (String verificationId, int? resendToken) {
                this.verificationId = verificationId;
            },
            codeAutoRetrievalTimeout: (String verificationId){
                this.verificationId = verificationId;
            }
        );
    }

    @observable
    String verificationId = "";

    @action
    Future<bool> checkOTP() async{
        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: pinEditingController.text.trim());
        var answer = await _firebaseAuth.signInWithCredential(credential);
        isCodeVerified = answer.user != null ? true : false;
        return isCodeVerified;
    }
}