import 'package:flutter/material.dart';
import 'package:fooddelivery/data/data.dart';
import 'package:fooddelivery/models/restaurant.dart';
import 'package:fooddelivery/widgets/recent_orders.dart';
import 'package:fooddelivery/widgets/restaurant_datails.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  buildRestaurant() {
    List<Widget> restaurantList = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurantList.add(
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RestaurantDetails(),
                ));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[200],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Image(
                      image: AssetImage('${restaurant.imageUrl}'),
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${restaurant.name}'),
                    Text('${restaurant.address}'),
                    Text('0.5 miles'),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Delivery'),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.account_circle)),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text('(${currentUser.cart!.length})',
                  style: TextStyle(
                    color: Colors.white,
                  )))
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                suffixIcon: Icon(Icons.close),
              ),
            ),
          ),
          Text('Recent Orders'),
          RecentOrders(),
          buildRestaurant(),
        ],
      ),
    );
  }
}
