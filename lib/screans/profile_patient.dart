import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import 'home2.dart';

class profile_patient extends StatefulWidget {
  const profile_patient({ Key? key }) : super(key: key);

  @override
  State<profile_patient> createState() => _profile_patientState();
}

class _profile_patientState extends State<profile_patient> {
  File? pickedImage;
  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Pic Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                    pickImage(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                    pickImage(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  margin: EdgeInsets.fromLTRB(55, 6, 5, 0),
                  child: Text("Profile",style: TextStyle(
                    color:  Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: "El Messiri",
                    fontSize: 35
                  )),
                ),

                  Container(
                    margin: EdgeInsets.fromLTRB(65, 0, 0, 1),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.indigo, width: 5),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: ClipOval(
                      child: pickedImage != null 
                        ? Image.file(
                        pickedImage!,
                        width: 170,
                        height: 170,
                        fit: BoxFit.cover,
                      ) 
                    :  Image.asset(
                              'assets/m.png',
                              width: 140,
                              height: 140,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 5,
                    child: IconButton(
                      onPressed: (){imagePickerOption();},
                      icon: const Icon(
                        Icons.add_a_photo_outlined,
                        color: Colors.blue,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 35),
              //width: 150,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all( Radius.circular(20)),
                color: Color.fromARGB(90, 0, 0, 0),
              ),
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 20, 200, 0),
                    child: Text("First Name \\",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 20, 200, 0),
                    child: Text("Last Name \\",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 20, 230, 0),
                    child: Text("Mobile \\",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(19, 20, 200, 0),
                    child: Text("National ID \\",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 17.5,
                    ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 20, 235, 0),
                    child: Text("Email \\",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 160, 0),
                    child: Text("Wheelchair ID \\",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(19, 20, 240, 0),
                    child: Text("Age \\",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 20, 210, 0),
                    child: Text("Gender \\",textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 20, 195, 0),
                    child: Text("Address \\",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}