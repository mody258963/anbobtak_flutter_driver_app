import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pusher_beams/pusher_beams.dart';

import 'presntation_lyar/widgets/app_router.dart';

String? initialRoute;
String? ids;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyASmpa4YmxIBRbVL_TM1PpOGjW2jC2R7UQ",
      authDomain: "flutter-geolocation-9f4c3.firebaseapp.com",
      projectId: "anbobtak-d2b94",
      storageBucket: "anbobtak-d2b94.appspot.com",
      messagingSenderId: "75152996159", 
      appId: '1:75152996159:android:ab7762f2b7740c9971c58a'
  ));
  await PusherBeams.instance.start('24340098-8055-4e3b-bd3b-a6c713edadcd');
  await PusherBeams.instance.addDeviceInterest('hello');

 PermissionStatus status = await Permission.notification.request();
  if (status.isGranted) {
    // Permission granted, proceed with Pusher initialization
      runApp(MyApp(
    appRouter: AppRouter(),
  ));
  } else {
    // Handle permission denial
  }
  // final prefs = await SharedPreferences.getInstance();

  // Future<bool> checkToken() async {
  //   final dio = Dio();
  //   try {
  //     final token = prefs.getString('token');
  //     print("===token==$token");
  //     if (token == null) {
  //       return false;
  //     } else {
  //       Map<String, dynamic> headers = {
  //         'Authorization':
  //             'Bearer $token', // Assuming token is prefixed with 'Bearer '
  //         'Content-Type': 'application/json', // Adjust content type as needed
  //       };

  //       final response = await dio.get(
  //         'http://127.0.0.1:8000/api/v1/user/me',
  //         options: Options(
  //           headers: headers,
  //         ),
  //       );
  //       if (response.statusCode == 200) {
  //         //final data = response.data;
  //         return true;
  //       } else {
  //         print('fuck');
  //         return false;
  //       }
  //     }
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }

  // bool tokenValid = await checkToken();

  // if (tokenValid) {
  //   initialRoute = nav; //nav
  // } else {
  //   initialRoute = logain;
  //   await prefs.clear();
  // }      

}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: initialRoute,
    );
  }
}
