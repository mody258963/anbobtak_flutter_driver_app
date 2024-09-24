
import 'package:anbobtak_flutter_driver_app/besnese_logic/email_auth/email_auth_cubit.dart';
import 'package:anbobtak_flutter_driver_app/costanse/pages.dart';
import 'package:anbobtak_flutter_driver_app/presntation_lyar/screens/DocScreen.dart';
import 'package:anbobtak_flutter_driver_app/presntation_lyar/screens/MyorderScreen.dart';
import 'package:anbobtak_flutter_driver_app/presntation_lyar/screens/NavigationBar.dart';
import 'package:anbobtak_flutter_driver_app/presntation_lyar/screens/OrderDetails.dart';
import 'package:anbobtak_flutter_driver_app/presntation_lyar/screens/SignIn.dart';
import 'package:anbobtak_flutter_driver_app/presntation_lyar/screens/SignUp.dart';
import 'package:anbobtak_flutter_driver_app/web_servese/dio/web_serv.dart';
import 'package:anbobtak_flutter_driver_app/web_servese/reproserty/myRepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../besnese_logic/get_method/get_method_cubit.dart';
import '../../besnese_logic/uploding_data/uploding_data_cubit.dart';

class AppRouter {
  UplodingDataCubit? uplodingDataCubit;
  GetMethodCubit? getMethodCubit;
  EmailAuthCubit? emailAuthCubit;
  AppRouter() {
    MyRepo myRepoInstance = MyRepo(NameWebServise());
    uplodingDataCubit = UplodingDataCubit(myRepoInstance);
    emailAuthCubit = EmailAuthCubit(
      myRepoInstance,
    );
    getMethodCubit = GetMethodCubit(
        myRepoInstance, emailAuthCubit ?? EmailAuthCubit(myRepoInstance));
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
       case signup:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<EmailAuthCubit>.value(
                  value: emailAuthCubit!,
                  child: const SignUp(),
                ));
                 case Doc:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<EmailAuthCubit>.value(
                  value: emailAuthCubit!,
                  child: const DocScreen(),
                ));
                 case logain:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<EmailAuthCubit>.value(
                  value: emailAuthCubit!,
                  child: const SignIn(),
                ));
               case nav:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<EmailAuthCubit>.value(
                  value: emailAuthCubit!,
                  child: const NavigationBars(),
                ));
           case orderDetals:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<EmailAuthCubit>.value(
                  value: emailAuthCubit!,
                  child: const OrderDetails(),
                ));
           case order:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<EmailAuthCubit>.value(
                  value: emailAuthCubit!,
                  child: const MyOrderScreen(),
                ));
    }
    
    return null;
  }
}
