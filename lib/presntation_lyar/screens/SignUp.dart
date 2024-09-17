import 'package:anbobtak_flutter_driver_app/presntation_lyar/widgets/widgets.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Widgets _widgets = Widgets();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController OPTcontroller = TextEditingController();
  bool _isSend = false;
  bool _isverfiy = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MaterialApp(
        home: Scaffold(
            body: Column(children: [
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
                  _widgets.TextFiledLogin(
                      'Name', namecontroller, 7, 'Name is very short', context),
                  _widgets.TextFiledLogin('Phone Number', phonecontroller, 9,
                      'Very short email', context),
                  if (_isSend)
                    _widgets.TextFiledLogin('OTP Code', OPTcontroller, 6,
                        'Enter 6 digits in the What\'sApp SMS ', context),
                  if (_isverfiy)
                    _widgets.TextFiledLogin('Password', passwordcontroller, 8,
                        'Please enter more than 8 characters', context),
                ],
              ),
            ),
          )),
    ])));
  }
}
