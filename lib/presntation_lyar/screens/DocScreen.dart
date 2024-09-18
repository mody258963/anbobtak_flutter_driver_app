import 'package:anbobtak_flutter_driver_app/costanse/colors.dart';
import 'package:anbobtak_flutter_driver_app/presntation_lyar/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DocScreen extends StatefulWidget {
  const DocScreen({super.key});

  @override
  State<DocScreen> createState() => _DocScreenState();
}

class _DocScreenState extends State<DocScreen> {

  final TextEditingController IdNumber = TextEditingController();
  Widgets _widgets = Widgets();

  @override
  Widget build(BuildContext context) {
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
              GestureDetector(
                onTap: () {
                  // Handle image upload for ID photo
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image),
                      SizedBox(width: 10),
                      Text("Add ID photo"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image),
                      SizedBox(width: 10),
                      Text("Driving license photo"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
      _widgets.TextFieldinApp(IdNumber,'ID number',13,'13 Charactor in front of the ID card','13 Charactor in front of the ID card',13,0,0),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Region',
                  border: OutlineInputBorder(),
                ),
                items: <String>['Region 1', 'Region 2', 'Region 3'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  // Handle change
                },
              ),
              SizedBox(height: 20),
       _widgets.Dropbox('Viachel',['Car', 'Tricycle', 'Truck'],(newValue) {
      },),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Governorate',
                  border: OutlineInputBorder(),
                ),
                items: <String>['Governorate 1', 'Governorate 2', 'Governorate 3'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  // Handle change
                },
              ),
              SizedBox(height: 20),
              _widgets.AppButton((){

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


    