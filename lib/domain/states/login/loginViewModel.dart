import 'dart:async';
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
    String phoneNumber = "";



    @observable
    String? verificaionCode = "";

    @observable
    int time = 30;

    @observable
    bool errorVisibility = false;

    @observable
    String verificationId = "";

    bool isBlocked = true;
    bool isStudent = true;

    late Timer _timer;

    @observable
     AuthStatus status = AuthStatus.main;

    @observable
    TextEditingController pinEditingController = TextEditingController();

    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


    @action
    void startTimer(){
        const oneSec = const Duration(seconds: 1);
        _timer = new Timer.periodic(
            oneSec,
                (Timer timer) {
                if (time == 0) {
                        timer.cancel();
                } else {
                        time--;
                }
            },
        );
    }

    @action
    Future<void> signInWithTelephone() async{
        print("+7${phoneNumber}");
        time = 30;
        startTimer();
        await _firebaseAuth.verifyPhoneNumber(
            phoneNumber: "+7${phoneNumber}",
            verificationCompleted: (credential) {
                status = AuthStatus.validCode;
                print("sucess");
            },
            verificationFailed: (e){
                status = AuthStatus.error;
                print(e);
            },
            codeSent: (String verificationId, int? resendToken) {
                print("object");
                status =AuthStatus.main;
                this.verificationId = verificationId;
            },
            codeAutoRetrievalTimeout: (String verificationId){
                print("sms retr");
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
                        isVerified: false,
                        isEnable: true,
                        role: 0
                    ).toJson()
                );
            }


            if(answer.user != null){


                if(snapshot.value != null){
                    final data = Map<String, dynamic>.from(snapshot.value as Map);
                    UserData userData = UserData.fromJson(data);
                    isBlocked = userData.isEnable;
                    isStudent = userData.role == 0 ? true : false;
                }

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