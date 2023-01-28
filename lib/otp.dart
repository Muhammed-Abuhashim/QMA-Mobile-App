// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:main/screans/home2.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class otp extends StatefulWidget {
  static String id='otp';
  const otp({Key? key}) : super(key: key);

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  double screenHeight = 0;
  double screenWidth = 0;
  double bottom = 0;

  String otpPin = " ";
  String countryDial = "+1";
  String verID = " ";

  int screenState = 0;

  Color blue = const Color(0xff8cccff);

  Future<void> verifyPhone(String number) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: number,
      timeout: const Duration(seconds: 20),
      verificationCompleted: (PhoneAuthCredential credential) {
        showSnackBarText("Auth Completed!");
      },
      verificationFailed: (FirebaseAuthException e) {
        showSnackBarText("Auth Failed!");
      },
      codeSent: (String verificationId, int? resendToken) {
        showSnackBarText("OTP Sent!");
        verID = verificationId;
        setState(() {
          screenState = 1;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        showSnackBarText("Timeout!");
      },
    );
  }

  Future<void> verifyOTP() async {
    await FirebaseAuth.instance.signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: verID,
        smsCode: otpPin,
      ),
    ).whenComplete(() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => home2(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    bottom = MediaQuery.of(context).viewInsets.bottom;

    return WillPopScope(
      onWillPop: () {
        setState(() {
          screenState = 0;
        });
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
          child: Icon( Icons.arrow_back_ios, color: Colors.black,size: 28),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => home2()),);
          } ,
        ),
        centerTitle: true,
        elevation: 0.0,
          backgroundColor: Color.fromARGB(140, 0, 0, 0),
          title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(17, 6, 5, 0),
                    child: Text("Verification",style: TextStyle(
                      color:  Colors.black,
                      fontWeight: FontWeight.w600,
                      fontFamily: "El Messiri",
                      fontSize: 35
                    )),
                  ),

                    Container(
                      margin: EdgeInsets.fromLTRB(34, 0, 0, 1),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                      color: const Color(0xff7c94b6),
                      image: DecorationImage(
                        image: ExactAssetImage('assets/logo5.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all( Radius.circular(130)),
                      boxShadow:[
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 40,
                          spreadRadius: 3,
                          offset: Offset(10,40),
                        ),                 
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 40,
                          spreadRadius: 3,
                          offset: Offset(-10,40),
                        ),],
                        border: Border.all(
                          color: Color.fromARGB(255, 253, 255, 115),
                          width: 1.25,
                        ),
                      ),
                    ),
              ],
            ),
        ),
        
        body: Container(
          decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/bk.jpg'),
                      opacity: 0.25,
                      fit: BoxFit.cover,
                    ),
                  ),
          child: ListView(
            children: [
                  Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 65),
                        child: Container(
                          width: 320,
                          height: 530,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all( Radius.circular(15)),
                            color: Color.fromARGB(90, 0, 0, 0),
                            border: Border.all(
                              color: Color.fromARGB(137, 60, 58, 58),
                              width: 2.5,
                            ), 
                          ),
                          
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 30),
                                  child: Column(
                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      screenState == 0 ? stateRegister() : stateOTP(),
                                      GestureDetector(
                                        onTap: () {
                                          if(screenState == 0) {
                                            if(phoneController.text.isEmpty) {
                                              showSnackBarText("Phone number is still empty!");
                                            } else {
                                              verifyPhone(countryDial + phoneController.text);
                                            }
                                          } else {
                                            if(otpPin.length >= 6) {
                                              verifyOTP();
                                            } else {
                                              showSnackBarText("Enter OTP correctly!");
                                            }
                                          }
                                        },
                                        
                                        child: Container(
                                          height: 40,
                                          width: 200,
                                          margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(195, 92, 169, 232),
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "CONTINUE",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1.5,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
          ),
        ),
      ),
    );
  }

  void showSnackBarText(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  Widget stateRegister() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /*Text(
          "Phone number",
          style: GoogleFonts.montserrat(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),*/
       // SizedBox(height: 30),
       Container(
          margin: EdgeInsets.fromLTRB(48, 30, 0, 15),
          width: 165,
          height: 165,
          decoration: BoxDecoration(
            //color: const Color(0xff7c94b6),
            image: DecorationImage(
              image: ExactAssetImage('assets/verify.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        
        Padding(
          padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
          child: Text(
            "Enter Mobile Number",textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              //letterSpacing: 1.5,
              fontSize: 22.5,
            ),
          ),
        ),

        SizedBox(height: 10),

        Center(
          child: Text(
            "Please, Enter Your Right \nMobile Number To Receive \nThe Code",textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              //letterSpacing: 1.5,
              fontSize: 17,
            ),
          ),
        ),

        SizedBox(height: 30),
        IntlPhoneField(
          controller: phoneController,
          showCountryFlag: true,
          showDropdownIcon: true,
          initialValue: countryDial,
          onCountryChanged: (country) {
            setState(() {
              countryDial = "+" + country.dialCode;
            });
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            hintText: "Phone number",
          ),
        ),
      ],
    );
  }

  Widget stateOTP() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(22, 30, 0, 15),
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            //color: const Color(0xff7c94b6),
            image: DecorationImage(
              image: ExactAssetImage('assets/verify2.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: "We just sent a code to ",
                style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              TextSpan(
                text: countryDial + phoneController.text,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              
              TextSpan(
                text: "\nEnter the code here and we can continue!",
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 14.5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20,),
        PinCodeTextField(
          appContext: context,
          length: 6,
          onChanged: (value) {
            setState(() {
              otpPin = value;
            });
          },
          pinTheme: PinTheme(
            activeColor: blue,
            selectedColor: blue,
            inactiveColor: Colors.black26,
          ),
        ),
        const SizedBox(height: 20,),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Didn't receive the code? ",
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 13,
                ),
              ),
              WidgetSpan(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      screenState = 0;
                    });
                  },
                  child: Text(
                    "Resend",
                    style: GoogleFonts.montserrat(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget circle(double size) {
    return Container(
      height: screenHeight / size,
      width: screenHeight / size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }
}