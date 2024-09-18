import 'package:anbobtak_flutter_driver_app/costanse/pages.dart';
import 'package:anbobtak_flutter_driver_app/presntation_lyar/widgets/widgets.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
    Widgets _widgets = Widgets();

  @override
  Widget build(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
    return MaterialApp(home: Scaffold(
      body: Column(
        children: [
          _widgets.LogoText(context),
              FadeInUp(
          duration: Duration(milliseconds: 1700),
          child: Container(
            width: width * 0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: Color.fromRGBO(196, 135, 198, .3)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.lightBlue,
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  )
                ]),
            child: Center(
              child: Column(
                children: [
                
                  _widgets.TextFiledLogin('Phone Number', phonecontroller, 9,
                      'Very short email', context),
          
                    _widgets.TextFiledLogin('Password', passwordcontroller, 8,
                        'Please enter more than 8 characters', context),
                ],
              ),
            ),
          )),
              SizedBox(
        height: 20,
      ),
      FadeInUp(
          duration: Duration(milliseconds: 1700),
          child: Container(
            width: width * 0.9,
            child: Column(
              children: [
                TextButton(onPressed: () {
                            Navigator.of(context, rootNavigator: true)
              .pushNamed(signup);
                }, child: Text("Create Account ?",style: TextStyle(color: Colors.grey),)),
                _widgets.AppButton(() {

                },'Sign In'),
              ],
            ),
          ))
        ]
      ),
    ),);
  }
}