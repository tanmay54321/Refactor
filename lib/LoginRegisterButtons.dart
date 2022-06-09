import 'package:flutter/material.dart';
import 'package:webproject/LoginPage.dart';
import 'HomePage.dart';
import 'RefactorWidgets.dart';

class LoginRegisterButtons extends StatelessWidget {
  LoginRegisterButtons({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(


      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: 150.0,
                height: 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0))
                ),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              RegisterPage()),
                    );
                  },
                  color: white,
                  child: Center(
                    child: googlefonttext(text: "Login", colors: Colors.blueAccent, fontsize: big_fontsize, fontweight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(height: 15.0,),
              Container(
                width: 150.0,
                height: 30.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.0))
                ),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              RegisterPage()),
                    );
                  },
                  color: white,
                  child: Center(
                    child: googlefonttext(text: "Register", colors: Colors.blueAccent, fontsize: big_fontsize, fontweight: FontWeight.w500),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
