// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import '../firebase/API.dart';
import 'download.dart';
import 'home2.dart';
import 'widgets/button_widget.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Medical History';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.green),
        home: med_his(),
      );
}

class med_his extends StatefulWidget {
  static String id='med_his';
  @override
  _med_hisState createState() => _med_hisState();
}

class _med_hisState extends State<med_his> {
  UploadTask? task;
  File? file;

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : 'No File Selected';

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
                  margin: EdgeInsets.fromLTRB(4, 6, 5, 0),
                  child: Text("Medical History",style: TextStyle(
                    color:  Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: "El Messiri",
                    fontSize: 30,
                  )),
                ),

                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 1),
                    width: 37,
                    height: 37,
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

        padding: EdgeInsets.fromLTRB(70, 0, 70, 40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 20, 5),
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  //color: const Color(0xff7c94b6),
                  image: DecorationImage(
                    image: ExactAssetImage('assets/med.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                child: Center(
                  child: Row(
                    children: [
                      Container(
                        // ignore: prefer_const_constructors
                        child: Text(
                          'Safe Your Life',
                            style: TextStyle(
                            fontSize: 37,
                            fontWeight: FontWeight.w500,
                            fontFamily:'Style Script',
                          ),
                        ),
                      ),

                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: ExactAssetImage('assets/heart.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ButtonWidget(
                text: 'Select File',
                icon: Icons.attach_file,
                onClicked: selectFile,
              ),
              SizedBox(height: 10),
              Text(
                fileName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 35),
              ButtonWidget(
                text: 'Upload File',
                icon: Icons.cloud_upload_outlined,
                onClicked: uploadFile,
              ),
              SizedBox(height: 10),
              task != null ? buildUploadStatus(task!) : Container(),
              SizedBox(height: 45),
                Container(
                  child: Center(
                    child:ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(168, 31, 54, 182),
                        minimumSize: Size.fromHeight(50),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => dwonload()),);
                      },
                      icon: const Icon( // <-- Icon
                        Icons.download,
                        size: 28,
                      ),
                      label: const Text('Download File',
                      style: TextStyle(fontSize: 21, color: Colors.white,fontFamily: "Arial",),
                      ), // <-- Text
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }


  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = basename(file!.path);
    final destination = 'files/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);
    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download-Link: $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage %',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container();
          }
        },
      );
}