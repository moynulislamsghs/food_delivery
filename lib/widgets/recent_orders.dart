import 'package:flutter/material.dart';
import 'package:fooddelivery/data/data.dart';
import 'package:fooddelivery/models/order.dart';

class RecentOrders extends StatefulWidget {
  const RecentOrders({Key? key}) : super(key: key);

  @override
  State<RecentOrders> createState() => _RecentOrdersState();
}

class _RecentOrdersState extends State<RecentOrders> {
  buildRecentOrder(Order order) {
    return Container(
      width: 320,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              image: AssetImage('${order.food!.imageUrl}'),
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${order.food!.name}'),
                Text('${order.restaurant!.name}'),
                Text('${order.date}'),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30),
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.orange,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: currentUser.orders!.length,
              itemBuilder: (context, index) {
                Order order = currentUser.orders![index];
                return buildRecentOrder(order);
              }),
        ),
      ],
    );
  }
}
