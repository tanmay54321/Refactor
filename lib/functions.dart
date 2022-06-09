import 'HomePage.dart';
import 'LoginPage.dart';
import 'package:email_auth/email_auth.dart';



final emailAuth = new EmailAuth(
  sessionName: "Sample session",
);

void sendOTP(String email) async{

  bool result = await emailAuth.sendOtp(
      recipientMail: email, otpLength: 4
  );
  if(result){
    otp_status.value = "otp send";
  }
  else{
    print(result);
    otp_status.value = "Please Enter Valid Mail";
  }
}

void validate(String email,String otp){
  bool result = emailAuth.validateOtp(recipientMail: email, userOtp: otp);
  if(result){
    verify.value = "verified";
  }else{
    verify.value = "Invalid OTP";
  }
}
