import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/models/furniture.dart';
import 'FavoriteProvider.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late Furniture item;
  late FavoritesProvider favoritesProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    item = ModalRoute.of(context)!.settings.arguments as Furniture;
    favoritesProvider = Provider.of<FavoritesProvider>(context);
  }

  void _toggleFavorite() {
    setState(() {
      if (favoritesProvider.isFavorite(item)) {
        favoritesProvider.removeFavorite(item);
      } else {
        favoritesProvider.addFavorite(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isFavorite = favoritesProvider.isFavorite(item);

    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite
                  ? Colors.red
                  : const Color.fromARGB(255, 132, 128, 128),
            ),
            onPressed: _toggleFavorite,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Center(
              child: Image.network(
                item.imageUrl,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            // Product Title
            Text(
              item.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Product Price
            Text(
              '\$${item.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 10),
            // Product Rating
            Text(
              'Rating: ${item.rating.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 20),
            // Product Description
            Text(
              item.description,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Add to Cart'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
