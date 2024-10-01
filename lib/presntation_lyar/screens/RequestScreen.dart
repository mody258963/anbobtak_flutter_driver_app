import 'package:anbobtak_flutter_driver_app/costanse/colors.dart';
import 'package:anbobtak_flutter_driver_app/presntation_lyar/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestscreenState();
}

class _RequestscreenState extends State<RequestScreen> {
  Widgets _widgets = Widgets();

  @override
  initState() {
    super.initState();
    _widgets.determinePosition();
  }

  Future<void> _getLocation() async {
    // Getting current position after permissions have been granted
    Position currentPosition = await Geolocator.getCurrentPosition();
    print('${currentPosition.latitude} , ${currentPosition.longitude}');

    // Update the state with the new location

    print(
        'Latitude: ${currentPosition.latitude}, Longitude: ${currentPosition.longitude}');
  }

  // Dummy list of orders to display
  final List<Order> _orders = [
    Order(
        orderId: '001',
        customerName: 'John Doe',
        address: '123 Main St',
        product: 'Laptop',
        price: 1200.00,
        LocationURL: 'https://maps.app.goo.gl/xd1RmqDvT61vw65o7'),
    Order(
        orderId: '002',
        customerName: 'Jane Smith',
        address: '456 Oak St',
        product: 'Smartphone',
        price: 850.00,
        LocationURL: 'https://maps.app.goo.gl/xd1RmqDvT61vw65o7'),
    Order(
        orderId: '003',
        customerName: 'Alice Johnson',
        address: '789 Pine St',
        product: 'Headphones',
        price: 150.00,
        LocationURL: 'https://maps.app.goo.gl/xd1RmqDvT61vw65o7'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: MyColors.white,
        appBar: AppBar(
          backgroundColor: MyColors.white,
          title: Text('Orders'),
        ),
        body: ListView.builder(
          itemCount: _orders.length,
          itemBuilder: (context, index) {
            final order = _orders[index];
            return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                onTap: () {
                  _getLocation();
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Orders to \$Address'),
                          content: Text(
                              'Are you sure that you will deliver the ORDER.'),
                          actions: [
                            TextButton(
                              child: Text('Decline Order'),
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                            ),
                            TextButton(
                              child: Text('Accept Order'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      });
                },
                title: Text(order.customerName),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Product: ${order.product}'),
                    Text('Address: ${order.address}'),
                    Text('Price: \$${order.price.toStringAsFixed(2)}'),
                  ],
                ),
                trailing: Icon(Icons
                    .check_box_outline_blank), // Just UI, no selection logic
              ),
            );
          },
        ),
      ),
    );
  }
}

class Order {
  final String orderId;
  final String customerName;
  final String address;
  final String product;
  final double price;
  final String LocationURL;

  Order(
      {required this.orderId,
      required this.customerName,
      required this.address,
      required this.product,
      required this.price,
      required this.LocationURL});
}
