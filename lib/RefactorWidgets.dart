import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';


class googlefonttext extends StatelessWidget {
  String text;
  Color colors;
  FontWeight fontweight;
  double fontsize;
  googlefonttext(
      {required this.text,
        required this.colors,
        required this.fontsize,
        required this.fontweight});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
          textStyle: TextStyle(
              color: colors, fontSize: fontsize, fontWeight: fontweight)),
    );
  }
}


// loading spin

class loadingspin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? Colors.red : Colors.green,
          ),
        );
      },
    );
  }
}

class textFormField extends StatelessWidget {
  String mobile_number = '';
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
      ),
      keyboardType: TextInputType.number,
      maxLength: 10,
      decoration: InputDecoration(
        counterStyle: TextStyle(color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusColor: Colors.black,
        prefixIcon: Icon(
          Icons.mobile_friendly,
          color: Colors.black,
        ),
        hintText: "Mobile Number",
        hintStyle: TextStyle(color: Colors.black, fontSize: 20.0),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter Mobile Number";
        }
        if (value.length < 10) {
          return "Please Enter Valid Mobile Number";
        }
        return null;
      },
      onChanged: (value) {
        mobile_number = value;
      },
    );
  }
}

//MaterialButton

class materialButton extends StatelessWidget {
  double fontsize;
  FontWeight fontweight;
  double CircularRadius;
  Color background_colors;
  Color text_colors;
  String text;
  Function function;
//  Function function;
  materialButton({
    required this.text,
    required this.text_colors,
    required this.background_colors,
    required this.CircularRadius,
    required this.function,
    required this.fontsize,
    required this.fontweight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 40,
      child: MaterialButton(
        color: background_colors,
        onPressed: () {
          function();
        },
        child: Text(
          text,
          style: TextStyle(
              color: text_colors, fontSize: fontsize, fontWeight: fontweight),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(CircularRadius))),
      ),
    );
  }
}

// Insert Network Image

class insertNetworkImage extends StatelessWidget {
  double width;
  double height;
  BoxShape image_shape;
  String image;
  insertNetworkImage(
      {required this.image,
      required this.width,
      required this.height,
      required this.image_shape}); // image_shape = BoxShape.rectangle/circle(Referance for future)
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.fill,
        ),
        shape: image_shape,
      ),
    );
  }
}



class clickebalText extends StatelessWidget {
  String text;
  Color color;
  double fontsize;
  FontWeight fontweight;
  Function function;
  clickebalText(
      {required this.text,
      required this.color,
      required this.fontsize,
      required this.fontweight,
        required this.function,
      });
//  clickebalText
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Text(
          "This is color sand clickebal text",
          style: GoogleFonts.lato(
              textStyle: TextStyle(
                  color: color, fontSize: fontsize, fontWeight: fontweight)),

        ),
        onTap: () {
          function;
        });
  }
}

class textbutton extends StatelessWidget {
  textbutton({required this.text, required this.function, required this.color,required this.fontsize,required this.fontweight});

  String text;
  Function function;
  Color color;
  double fontsize;
  FontWeight fontweight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function();
      },
      child: Text(
        text,
        style: TextStyle(color: color,fontWeight: fontweight,fontSize: fontsize),
      ),
    );
  }
}