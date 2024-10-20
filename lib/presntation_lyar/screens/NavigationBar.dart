import 'package:anbobtak_flutter_driver_app/costanse/colors.dart';
import 'package:anbobtak_flutter_driver_app/presntation_lyar/screens/MyorderScreen.dart';
import 'package:anbobtak_flutter_driver_app/presntation_lyar/screens/WalletScreen.dart';
import 'package:anbobtak_flutter_driver_app/presntation_lyar/screens/RequestScreen.dart';
import 'package:anbobtak_flutter_driver_app/presntation_lyar/widgets/widgets.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:pusher_beams/pusher_beams.dart';

class NavigationBars extends StatefulWidget {
  const NavigationBars({super.key});
  @override
  State<NavigationBars> createState() => _NavigationBarsState();
}

class _NavigationBarsState extends State<NavigationBars> {
  @override
  void initState() {
    super.initState();

    PusherBeams.instance.onMessageReceivedInTheForeground((notification) {
      print('Notification received: ${notification}');
      // Handle notification here
    });
  }
  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.list,size: 30.sp,),
        activeColorPrimary: MyColors.Secondcolor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.check_box,size: 30.sp),
        activeColorPrimary: MyColors.Secondcolor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.account_balance_wallet_rounded,size: 30.sp),
        activeColorPrimary: MyColors.Secondcolor,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  PersistentTabController _controller = PersistentTabController();
  List<Widget> _screens() {
    return [
      RequestScreen(),
      MyOrderScreen(),
      WalletScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
        ScreenUtil.init(context, designSize: const Size(360, 852));
    return MaterialApp(
      home: Scaffold(
        body: PersistentTabView(
          screens: _screens(),
          context,
          confineToSafeArea: true,
          controller: _controller,
          navBarHeight: 65.h,
          items: _navBarItems(),
          navBarStyle: NavBarStyle.style6,
          backgroundColor: MyColors.white,
          hideNavigationBarWhenKeyboardAppears: true,
          popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
        ),
      ),
    );
  }
}
