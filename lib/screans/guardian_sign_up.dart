// ignore_for_file: prefer_const_constructors, duplicate_ignore, camel_case_types, unused_import, avoid_unnecessary_containers, unused_local_variable, unnecessary_import, deprecated_member_use, empty_statements, avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main/common/theme_helper.dart';
import 'package:main/model/user_model.dart';
import 'package:main/otp_guardian.dart';
import 'package:main/screans/home.dart';
import 'package:main/screans/home2.dart';
import 'package:main/screans/login.dart';
import 'package:main/screans/sign_up.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../otp.dart';




//import 'package:main/colors.dart';


class guardian_sign_up extends StatefulWidget {
  guardian_sign_up({ Key? key }) : super(key: key);

  static String id='guardian_sign_up';
  get decoration => null;
  
  
  @override
  State<guardian_sign_up> createState() => _guardian_sign_upState();
}

final GlobalKey<FormState> _formkey= GlobalKey<FormState>();
bool obserText = true;

class _guardian_sign_upState extends State<guardian_sign_up> {

  final _auth = FirebaseAuth.instance;
 // string for displaying the error Message
  String? errorMessage;

  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final mobileEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();
  final nationalIdEditingController = new TextEditingController();
  final ageEditingController = new TextEditingController();
  final genderEditingController = new TextEditingController();
  final addressEditingController = new TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    //first name field
    final firstNameField = TextFormField(
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("First Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Color.fromARGB(151, 224, 203, 189),
          filled: true,
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //second name field
    final secondNameField = TextFormField(
        autofocus: false,
        controller: secondNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Last Name cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          secondNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Color.fromARGB(151, 224, 203, 189),
          filled: true,
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Last Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)+.com*").hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Color.fromARGB(151, 224, 203, 189),
          filled: true,
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

        //mobile field
    final mobileField = TextFormField(
        autofocus: false,
        controller: mobileEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Mobile Number cannot be Empty");
          }
          else if(value.length != 11){
            return "Phone Number Is Invaild \n Phone Number Must Be 11";
          }
          return null;
        },
        onSaved: (value) {
          mobileEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Color.fromARGB(151, 224, 203, 189),
          filled: true,
          prefixIcon: Icon(Icons.phone_in_talk),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Mobile Number",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

        //nationalId field
    final nationalIdField = TextFormField(
        autofocus: false,
        controller: nationalIdEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("National ID cannot be Empty");
          }
          else if(value.length != 14){
            return "National ID is incorrect \n Must Be 14 Digits";
          }
          return null;
        },
        onSaved: (value) {
          nationalIdEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Color.fromARGB(151, 224, 203, 189),
          filled: true,
          prefixIcon: Icon(Icons.credit_card),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "National ID",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

         //age field
    final ageField = TextFormField(
        autofocus: false,
        controller: ageEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          var X;
          if (value!.isEmpty) {
            return ("Age cannot be Empty");
          }
          else if(X = int.parse(value) < 15){
            return "Age Is Invaild";
          }
          return null;
        },
        onSaved: (value) {
          ageEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Color.fromARGB(151, 224, 203, 189),
          filled: true,
          prefixIcon: Icon(Icons.calendar_month),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Age",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

         //gender field
    final genderField = TextFormField(
        autofocus: false,
        controller: genderEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Gender cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          genderEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Color.fromARGB(151, 224, 203, 189),
          filled: true,
          prefixIcon: Icon(Icons.boy),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Gender",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

        //address field
    final addressField = TextFormField(
        autofocus: false,
        controller: addressEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("address cannot be Empty");
          }
          else if(value.length < 8){
            return "address is Too Short";
          }
          return null;
        },
        onSaved: (value) {
          addressEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Color.fromARGB(151, 224, 203, 189),
          filled: true,
          prefixIcon: Icon(Icons.location_pin),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Address",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final passwordField = TextFormField(
      
        autofocus: false,
        controller: passwordEditingController,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
          else if(value.length < 8){
            return "Password is Too Short";
          }
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Color.fromARGB(151, 224, 203, 189),
          filled: true,
          prefixIcon: Icon(Icons.lock),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: GestureDetector(
            onTap: (){
              setState(() {
                obserText =! obserText;
              });
              FocusScope.of(context).unfocus();
            },
            child: Icon(
              obserText==true? Icons.visibility:Icons.visibility_off, 
              color:Colors.black),
          ),
        ));

    //confirm password field
    final confirmPasswordField = TextFormField(
        autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: true,
        validator: (value) {
          if (confirmPasswordEditingController.text !=
              passwordEditingController.text) {
            return "Password don't match";
          }
          return null;
        },
        onSaved: (value) {
          confirmPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          fillColor: Color.fromARGB(151, 224, 203, 189),
          filled: true,
          prefixIcon: Icon(Icons.password),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: GestureDetector(
            onTap: (){
              setState(() {
                obserText =! obserText;
              });
              FocusScope.of(context).unfocus();
            },
            child: Icon(
              obserText==true? Icons.visibility:Icons.visibility_off, 
              color:Colors.black),
          ),
        ));

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage('assets/bk.jpg'),
                opacity: 0.25,
                fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.fromLTRB(5, 0, 2, 10),
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(    
                            image: const DecorationImage(
                            image: ExactAssetImage('assets/logo.jpeg'),
                            fit: BoxFit.cover,
                          ),

                          borderRadius: const BorderRadius.all( Radius.circular(130)),
                        boxShadow:[
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 40,
                            spreadRadius: 3,
                            offset: const Offset(10,40),
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 40,
                            spreadRadius: 3,
                            offset: const Offset(-10,40),
                          ),],
                          border: Border.all(
                            color: const Color.fromARGB(255, 253, 255, 115),
                            width: 2.5,
                          ),
                        ),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.only(bottom:20),
                        child: Center(
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left:49),
                              // ignore: prefer_const_constructors
                              child: Text(
                                'Welcome',
                                  style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w500,
                                  fontFamily:'Style Script',
                                ),
                              ),
                            ),
                            Container(
                        margin: const EdgeInsets.fromLTRB(4,0,0,5),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                        image: DecorationImage(
                        image: ExactAssetImage('assets/heart.png'),
                        fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],),
                        ),
                      ),
                      firstNameField,
                      SizedBox(height: 20),
                      secondNameField,
                      SizedBox(height: 20),
                      emailField,
                      SizedBox(height: 20),
                      mobileField,
                      SizedBox(height: 20),
                      nationalIdField,
                      SizedBox(height: 20),
                      ageField,
                      SizedBox(height: 20),
                      genderField,
                      SizedBox(height: 20),
                      addressField,
                      SizedBox(height: 20),
                      passwordField,
                      SizedBox(height: 20),
                      confirmPasswordField,
                      SizedBox(height: 20),
                      Container( 
                        margin: const EdgeInsets.fromLTRB(35, 10, 0, 0),
                        child: Row(
                          children: <Widget>[
                            Text("I Have An Account !",style: TextStyle(
                                    color: Color.fromARGB(255, 63, 63, 65),
                                    fontSize: 18,
                                    fontFamily: 'Joan',
                                    fontWeight: FontWeight.w900,
                                  ),),
                            GestureDetector(
                              child: Text("\t LOGIN",style: TextStyle(
                                      color: Color.fromARGB(255, 21, 117, 146),
                                      fontSize: 18,
                                      fontFamily: 'Joan',
                                      fontWeight: FontWeight.w900,
                                      ),
                              ),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => login()),);
                              },
                            ),]
                          ),
                      ),
                      SizedBox(height: 25),
                      Container(
                        margin: const EdgeInsets.only(left: 60, right:60),
                        height: 45,
                        width: double.infinity,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide( width: 1.25 ),
                        ),
                        child: Text("Register",style: new TextStyle(fontSize: 21.5,fontFamily: 'Joan',fontWeight: FontWeight.w900),),
                        onPressed: () async{
                         signUp(emailEditingController.text, passwordEditingController.text);
                         Navigator.push(context, MaterialPageRoute(builder: (context) => otp()),);
                        },
                        ),
                      ),
                      SizedBox(height: 0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
   void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = secondNameEditingController.text;
    userModel.secondName = secondNameEditingController.text;
    userModel.mobile = mobileEditingController.text;
    userModel.nationalId = nationalIdEditingController.text;
    userModel.age = ageEditingController.text;
    userModel.gender = genderEditingController.text;
    userModel.address = addressEditingController.text;
    userModel.password = passwordEditingController.text;
   

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => otp_guardian()),
        (route) => false);
  }
}
 



