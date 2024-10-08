import 'dart:io';

import 'package:anbobtak_flutter_driver_app/costanse/colors.dart';
import 'package:anbobtak_flutter_driver_app/costanse/pages.dart';
import 'package:anbobtak_flutter_driver_app/presntation_lyar/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DocScreen extends StatefulWidget {
  const DocScreen({super.key});

  @override
  State<DocScreen> createState() => _DocScreenState();
}

class _DocScreenState extends State<DocScreen> {

  final TextEditingController IdNumber = TextEditingController();
  Widgets _widgets = Widgets();
   File? _frontIdImage;
  File? _backIdImage;
  File? _drivingLicenseImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(String imageType) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        switch (imageType) {
          case 'frontId':
            _frontIdImage = File(pickedFile.path);
            break;
          case 'backId':
            _backIdImage = File(pickedFile.path);
            break;
          case 'drivingLicense':
            _drivingLicenseImage = File(pickedFile.path);
            break;
        }
      });
    }
  }

  Widget _buildImagePicker(String imageType, String label, File? image) {
        final width = MediaQuery.of(context).size.width;
        final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => _pickImage(imageType),
      child: Container(
        width: double.infinity,
        height: height * 0.09,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.blue), // Replace Colors.blue with your color
          image: image != null
              ? DecorationImage(
                  image: FileImage(image),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: image == null
            ? Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image, color: Colors.blue), // Replace Colors.blue with your color
                    SizedBox(width: 10),
                    Text(label),
                  ],
                ),
              )
            : null,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
        final width = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        title: Text("Driver Signup"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            _buildImagePicker('frontId', 'Add Front of ID photo', _frontIdImage),
            SizedBox(height: 20),
            _buildImagePicker('backId', 'Add Back of ID photo', _backIdImage),
            SizedBox(height: 20),
            _buildImagePicker('drivingLicense', 'Add Driving License photo', _drivingLicenseImage),

              SizedBox(height: 20),
      _widgets.TextFieldinApp(IdNumber,'ID number',13,'13 Charactor in front of the ID card','13 Charactor in front of the ID card',13,0,0,TextInputType.number,context),
              SizedBox(height: 20),
          _widgets.Dropbox('Viachel',['Car', 'Tricycle', 'Truck'],(newValue) {
      },),
              SizedBox(height: 20),
       _widgets.Dropbox('Goverment',['Cairo', 'Alex', 'Mansora'],(newValue) {
      },),
              SizedBox(height: 20),
              _widgets.Dropbox('Regoin',['New Cairo', 'New Cairo 1', 'New Cairo 2'],(newValue) {

      },),
              SizedBox(height: 20),
              _widgets.AppButton((){
                                          Navigator.of(context, rootNavigator: true)
              .pushNamed(nav);
              }, "Continue"),
              SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Handle navigation to Sign In
                  },
                  child: Text(
                    "Go to Sign In Page",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "By creating an account, you agree to our Privacy policy and Terms of use.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}


    