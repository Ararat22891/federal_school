
import 'package:federal_school/domain/models/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'loginViewModel.g.dart';

class LoginViewModel = _LoginViewModel with _$LoginViewModel;

enum AuthStatus{validCode, invalidCode, loading, main, incorrectNumb, wrongCode, networkError, error}

abstract class _LoginViewModel with Store{

    @observable
    String phoneNumber = "+79600777466";

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
        print("+7${phoneNumber}");
        await _firebaseAuth.verifyPhoneNumber(
            phoneNumber: "+7${phoneNumber}",
            verificationCompleted: (credential) async{
                status = AuthStatus.validCode;
            },
            verificationFailed: (e){
                status = AuthStatus.error;
                print(e);
            },
            codeSent: (String verificationId, int? resendToken) {
                print("object");
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

            String uid = FirebaseAuth.instance.currentUser!.uid;
            DatabaseReference ref = FirebaseDatabase.instance.ref("users").child(uid);
            var snapshot = await ref.get();
            String? token = await FirebaseMessaging.instance.getToken();
            if (snapshot.exists){
                await ref.update(
                    {"deviceToken" : token}
                );
            }
            else{
                await ref.set(
                    UserData(
                        userUID: uid,
                        deviceToken: token!,
                        telNumber: FirebaseAuth.instance.currentUser!.phoneNumber!,
                        role: 0
                    ).toJson()
                );
            }


            if(answer.user != null){
                status = AuthStatus.validCode;
            }
            else{
                status = AuthStatus.invalidCode;
            }
        }
        catch(e){
            status = AuthStatus.invalidCode;
        }

    }

}