
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'HomePage.dart';
import 'LoginPage.dart';

Future<void> LoginSystem(String email,String password) async {

  try {
    FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    errorNotifier.value = "login";
    uid.value = _auth.currentUser!.uid.toString();//This gives user id of login person

    print(uid.value);
  } on FirebaseAuthException catch (error) {
    print(error);
    if(error is FirebaseAuthException){
      print(error.code);
      switch(error.code.toString()){
        case "user-not-found": errorNotifier.value = 'register your mail';
        break;

        case "invalid-email" : errorNotifier.value = 'Invalid email';
        break;

        case "wrong-password":errorNotifier.value = 'Invalid password';
        break;

        case "network-request-failed":errorNotifier.value = 'cheak Internet Connection';
        break;
      }

    }
  }

}

Future<void> RegisterSystem(String email,String mobile_number,String create_password) async{

  try {

    FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.createUserWithEmailAndPassword(
        email: email, password: create_password);
    uid.value = _auth.currentUser!.uid.toString();
    FirebaseFirestore.instance.collection("Users").doc(uid.value.toString()).collection("UserDetails").doc().set({"RegisterEmail":email,"RegisterMobileNumber":mobile_number});
    FirebaseFirestore.instance.collection("Users").doc(uid.value.toString()).collection("walletAmount").doc(uid.value.toString()).set({"amount":"00"});
    FirebaseFirestore.instance.collection("Users").doc(uid.value.toString()).collection("withdrawRequest").doc(uid.value.toString()).set({"amount":"00"});

    errorNotifier.value = "register";
    print(errorNotifier.value);

  } on FirebaseAuthException catch (error) {
    print(error);
    if(error is FirebaseAuthException){
      print(error.code);
      print(error.hashCode);
      switch(error.code.toString()){

        case "email-already-in-use" : errorNotifier.value = "The email address is already in use";
        break;
        case "invalid-email" : errorNotifier.value = 'Email Address is badly formated';
        break;
        case "network-request-failed" : errorNotifier.value = 'Cheak Internet Connection';
        break;
        case "weak-password" : errorNotifier.value = 'Please Create Strong Password';
      }

    }
  }

}