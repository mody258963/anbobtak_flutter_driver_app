import 'package:flutter/material.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestscreenState();
}

class _RequestscreenState extends State<RequestScreen> {


  // Dummy list of orders to display
  final List<Order> _orders = [
    Order(orderId: '001', customerName: 'John Doe', address: '123 Main St', product: 'Laptop', price: 1200.00),
    Order(orderId: '002', customerName: 'Jane Smith', address: '456 Oak St', product: 'Smartphone', price: 850.00),
    Order(orderId: '003', customerName: 'Alice Johnson', address: '789 Pine St', product: 'Headphones', price: 150.00),
  ];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Orders'),
      ),
      body: ListView.builder(
        itemCount: _orders.length,
        itemBuilder: (context, index) {
          final order = _orders[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              onTap: () {
                
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
              trailing: Icon(Icons.check_box_outline_blank), // Just UI, no selection logic
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action disabled, purely UI
        },
        child: Icon(Icons.done),
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

  Order({
    required this.orderId,
    required this.customerName,
    required this.address,
    required this.product,
    required this.price,
  });
}
