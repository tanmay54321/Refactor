import 'package:flutter/material.dart';

import 'LoginRegisterButtons.dart';
import 'RefactorWidgets.dart';

List<Color> core_color = [
  Color.fromRGBO(7, 22, 36, 1.0),
  Color.fromRGBO(29, 94, 157, 1.0)
];

Color white = Colors.white;
double big_fontsize = 20;
double small_fontsize = 15;

// ValueNotifiers
ValueNotifier uid = ValueNotifier('');
ValueNotifier otp_status = ValueNotifier('');
ValueNotifier verify = ValueNotifier('');
ValueNotifier errorNotifier = ValueNotifier('');

class HomePage extends StatelessWidget {
  HomePage({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
          width: double.infinity,
          height: 400.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(150.0)),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(7, 22, 36, 1.0),
                Color.fromRGBO(29, 94, 157, 1.0)
              ],
            ),
          ),
          child: Center(
            child: Container(
              width: 500.0,
              height: 350.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all( Radius.circular(50.0)),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromRGBO(7, 22, 36, 1.0),
                      Color.fromRGBO(29, 94, 157, 1.0)
                    ],
                  )),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: googlefonttext(
                              text: "Piggy Bank",
                              colors: white,
                              fontsize: 60.0,
                              fontweight: FontWeight.w900),
                        )),
                    SizedBox(
                      height: 20.0,
                    ),
                    LoginRegisterButtons()
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
