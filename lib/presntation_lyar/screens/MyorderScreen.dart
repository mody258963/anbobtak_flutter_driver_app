
import 'package:anbobtak_flutter_driver_app/costanse/colors.dart';
import 'package:anbobtak_flutter_driver_app/costanse/extensions.dart';
import 'package:anbobtak_flutter_driver_app/costanse/pages.dart';
import 'package:anbobtak_flutter_driver_app/presntation_lyar/screens/OrderDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/widgets.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
Widgets _widgets = Widgets();

  Widget ContanerOrder() {
   return Card(
    color: Colors.white,
      margin: EdgeInsets.all(10.w),
      child: Padding(
        padding:  EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Jun 01 . 2:20am', style: TextStyle(fontSize: 16.sp)),
                SizedBox(width: 120.w,),
               Container(
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 5.w),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(
        'Deliver',
        style: TextStyle(
          color: Colors.grey[700],
          fontSize: 12.sp,
        ),
      ),
    ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
      
                SizedBox(width: 10.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order ID: 12', style: TextStyle(fontSize: 14.sp)),
                    Text('EGP 12.1', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    context.pushReplacementNamed(orderDetals);
                  },
                  child: Text('View details',style: TextStyle(color: MyColors.Secondcolor),),
                ),
           OutlinedButton(
      onPressed: () {
        // Add your onPressed code here!
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.blue),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 9.h),
      ),
      child: Text(
        'Report',
        style: TextStyle(
          color: Colors.black,
          fontSize: 14.sp,
        ),
      ),
    ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 852));
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.white,
          title: Text('Order'),
        ),
        backgroundColor: MyColors.white,body: Center(
          child: Column(
            children: [       
              Container(height:200.h,child: ContanerOrder())
            ],
          ),
        ),),
    );
  }
}