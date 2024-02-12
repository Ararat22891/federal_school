
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'loginViewModel.g.dart';

class LoginViewModel = _LoginViewModel with _$LoginViewModel;


abstract class _LoginViewModel with Store{

    @observable
    String phoneNumber = "+79600777466";

    @observable
    String? verificaionCode = "";

    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    @observable
    String verificationId = "";


    @override
    Future<void> signInWithTelephone() async{
        await _firebaseAuth.verifyPhoneNumber(
            phoneNumber: phoneNumber,
            verificationCompleted: (credential) async{
                await _firebaseAuth.signInWithCredential(credential);
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


    @action
    Future<bool> checkOTP() async{
        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: verificaionCode!);
        var answer = await _firebaseAuth.signInWithCredential(credential);
        return answer.user != null ? true : false;
    }
}