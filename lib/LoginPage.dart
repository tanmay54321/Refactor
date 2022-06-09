import 'package:flutter/material.dart';
import 'package:webproject/Authentication.dart';
import 'package:webproject/functions.dart';
import 'HomePage.dart';
import 'RefactorWidgets.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterContainer(),
    );
  }
}

class RegisterContainer extends StatelessWidget {
  String email = "";
  String mobile_number = "";
  String otp = "" ;
  String password = "";
  final _formKey = GlobalKey<FormState>();
  Future<void> RegisterHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      await RegisterSystem(email, mobile_number ,password);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400.0,
        height: 500.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(7, 22, 36, 1.0),
                Color.fromRGBO(29, 94, 157, 1.0)
              ],
            )),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                googlefonttext(
                    text: "Welcome Back in Piggy Bank",
                    colors: white,
                    fontsize: big_fontsize,
                    fontweight: FontWeight.w600),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    style: TextStyle(color: white),
                    decoration: InputDecoration(
                        hintText: "Mobile Number",
                        hintStyle:
                            TextStyle(color: white, fontSize: small_fontsize),
                        fillColor: white,
                        prefixIcon: Icon(
                          Icons.mobile_friendly,
                          color: Colors.white,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: white),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        )),
                    validator: (value) {
                      if (value!.length > 10) {
                        return "Enter valid mobile Number";
                      } else if (value.length < 10) {
                        return "Enter Valid Mobile Number";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      mobile_number = value;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    style: TextStyle(color: white),
                    decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle:
                            TextStyle(color: white, fontSize: small_fontsize),
                        fillColor: white,
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: white),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        )),
                    validator: (value) {
                      if (value == "") {
                        return "Enter Mail";
                      }

                      return null;
                    },
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                ),

                Container(
                  width: 120.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: white,
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      verify.value = "";

                      sendOTP(email);
                    },
                    color: white,
                    child: Center(
                      child: googlefonttext(
                          text: "Genrate OTP",
                          colors: Colors.blueAccent,
                          fontsize: small_fontsize,
                          fontweight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                ValueListenableBuilder(
                  valueListenable: otp_status,
                  builder: (context, value, child) {
                    return Column(
                      children: [
                        value == "otp send"
                            ? googlefonttext(
                                text: "OTP send successfully",
                                colors: Colors.green,
                                fontsize: small_fontsize,
                                fontweight: FontWeight.w400)
                            : googlefonttext(
                                text: value.toString(),
                                colors: Colors.red,
                                fontsize: small_fontsize,
                                fontweight: FontWeight.w400)
                      ],
                    );
                  },
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    style: TextStyle(color: white),
                    decoration: InputDecoration(
                        hintText: "OTP",
                        hintStyle:
                        TextStyle(color: white, fontSize: small_fontsize),
                        fillColor: white,
                        prefixIcon: Icon(
                          Icons.paste_sharp,
                          color: Colors.white,
                        ),
                        suffix:  Container(
                          width: 70.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            color: white,
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              otp_status.value = "";
                              validate(email, otp);
                            },
                            color: white,
                            child: Center(
                              child: googlefonttext(
                                  text: "Verify",
                                  colors: Colors.blueAccent,
                                  fontsize: small_fontsize,
                                  fontweight: FontWeight.w500),
                            ),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: white),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        )),
                    validator: (value) {
                      if (value == "") {
                        return "Enter OTP";
                      }
                      else if (value!.length < 6){
                        return "Enter valid OTP";
                      }
                      else if (value.length > 6){
                        return "Enter valid OTP";
                      }

                      return null;
                    },
                    onChanged: (value) {
                      otp = value;
                    },
                  ),
                ),
                ValueListenableBuilder(valueListenable: verify, builder: (context,value,child){
                  return Column(
                    children: [
                      value == "verified" ? googlefonttext(
                          text: "OTP is verified",
                          colors: Colors.green,
                          fontsize: small_fontsize,
                          fontweight: FontWeight.w400) :
                      googlefonttext(
                          text: value.toString(),
                          colors: Colors.red,
                          fontsize: small_fontsize,
                          fontweight: FontWeight.w400)
                    ],
                  );
                }),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    style: TextStyle(color: white),
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Create password",
                        hintStyle:
                        TextStyle(color: white, fontSize: small_fontsize),
                        fillColor: white,
                        prefixIcon: Icon(
                          Icons.password,
                          color: Colors.white,
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: white),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        )),
                    validator: (value) {
                      if(value!.length == ""){
                        return "Create password";
                      }
                      else if (value.length < 6){
                        return "Password size greater then 6 charecter";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      mobile_number = value;
                    },
                  ),
                ),
                Container(
                  width: 100.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      RegisterHome(context);
                    },
                    color: white,
                    child: Center(
                      child: googlefonttext(text: "Register", colors: Colors.blueAccent, fontsize: small_fontsize, fontweight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(height: 5.0,),
                ValueListenableBuilder(valueListenable: errorNotifier, builder: (context,value,child){
                  return Column(
                    children: [
                      value == "register" ?  Container(
                        width: 100.0,
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
                                      HomePage()),
                            );
                          },
                          color: white,
                          child: Center(
                            child: googlefonttext(text: "Next", colors: Colors.blueAccent, fontsize: big_fontsize, fontweight: FontWeight.w500),
                          ),
                        ),
                      ) : googlefonttext(text: value.toString(), colors: Colors.red, fontsize: small_fontsize, fontweight: FontWeight.w500)
                    ],
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
