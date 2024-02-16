
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'loginViewModel.g.dart';

class LoginViewModel = _LoginViewModel with _$LoginViewModel;

enum AuthStatus{validCode, invalidCode, loading, main, incorrectNumb, wrongCode, networkError, error}

abstract class _LoginViewModel with Store{

    @observable
    String phoneNumber = "+79033140199";

    @observable
    String? verificaionCode = "";

    @observable
    String verificationId = "";

    @observable
     AuthStatus status = AuthStatus.main;

    @observable
    late TextEditingController pinEditingController;

    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


    @action
    Future<void> signInWithTelephone() async{
        await _firebaseAuth.verifyPhoneNumber(
            phoneNumber: phoneNumber,
            verificationCompleted: (credential) async{
                status = AuthStatus.validCode;
            },
            verificationFailed: (e){
                status = AuthStatus.error;
                print(e);
            },
            codeSent: (String verificationId, int? resendToken) {
                status =AuthStatus.loading;
                this.verificationId = verificationId;
            },
            codeAutoRetrievalTimeout: (String verificationId){
                this.verificationId = verificationId;
            }
        );
    }

    @action
    Future<void> checkOTP() async{
        try{
            status = AuthStatus.loading;
            PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: pinEditingController.text.trim());
            status = AuthStatus.loading;
            var answer = await _firebaseAuth.signInWithCredential(credential);
            if(answer.user != null){
                status = AuthStatus.validCode;
            }
            else{
                status = AuthStatus.wrongCode;
            }
        }
        catch(e){
            status = AuthStatus.error;
        }

    }

}