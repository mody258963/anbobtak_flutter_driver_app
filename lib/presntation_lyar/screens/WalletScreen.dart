
import 'package:anbobtak_flutter_driver_app/costanse/colors.dart';
import 'package:anbobtak_flutter_driver_app/presntation_lyar/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  Widgets _widgets = Widgets();


  @override
  Widget build(BuildContext context) {
        ScreenUtil.init(context, designSize: const Size(360, 852));
    return MaterialApp(
      home: Scaffold(
        backgroundColor: MyColors.white,
        appBar: AppBar(
          title: Text('My Wallet'),
          backgroundColor: MyColors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Wallet Balance Section
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: MyColors.Secondcolor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wallet Balance',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '\$ 1,250.00', // Example Balance
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              
              // Transaction History Title
              Text(
                'Recent Transactions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              
              // Transaction History Section
              Expanded(
                child: ListView.builder(
                  itemCount: 5, // Example of 5 transactions
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.monetization_on,
                          color: MyColors.Secondcolor,
                        ),
                        title: Text('Transaction #${index + 1}'),
                        subtitle: Text('Transaction Details'),
                        trailing: Text(
                          '-\$50.00',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              
              // Action Buttons (Add Money, Transfer)
        
            ],
          ),
        ),
               floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15.sp),
              child: Container(
                width: 150.w,
                height: 50.h,
                child: FloatingActionButton(
                  backgroundColor: MyColors.Secondcolor,
                  onPressed: () {},
                  child: Padding(
                    padding:  EdgeInsets.only(left: 30.sp),
                    child: Row(children: [
                      Text('Add Money',style: TextStyle(color: Colors.white)), 
                      Padding(
                        padding:  EdgeInsets.only(left: 8.sp),
                        child: Icon(Icons.attach_money ,color: Colors.white,),
                      )
                    ],),
                  ),
                  heroTag: 'fab1', // Ensure unique tags for FABs
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15.sp),
              child: Container(
                width: 150.w,
                child: FloatingActionButton(
                  backgroundColor: MyColors.Secondcolor,
                  onPressed: () {},
                  child: Padding(
                    padding:  EdgeInsets.only(left: 17.sp),
                    child: Row(children: [
                      Text('Transfer Money',style: TextStyle(color: Colors.white),), 
                      Padding(
                        padding:  EdgeInsets.only(left: 8.sp),
                        child: Icon(Icons.send ,color: Colors.white,),
                      )
                    ],),
                  ),
                  heroTag: 'fab2',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
