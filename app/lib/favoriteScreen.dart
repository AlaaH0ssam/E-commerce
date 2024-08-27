import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/models/furniture.dart';
import 'FavoriteProvider.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final favoriteItems = favoritesProvider.favoriteItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Furniture'),
      ),
      body: favoriteItems.isEmpty
          ? const Center(
              child: Text(
                'No favorite items yet!',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: favoriteItems.length,
              itemBuilder: (context, index) {
                final item = favoriteItems[index];
                return FavoriteItemCard(furniture: item);
              },
            ),
    );
  }
}

class FavoriteItemCard extends StatelessWidget {
  final Furniture furniture;

  const FavoriteItemCard({
    Key? key,
    required this.furniture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: furniture.imageUrl.isNotEmpty
            ? Image.network(
                furniture.imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              )
            : Icon(Icons.image, size: 50),
        title: Text(furniture.title),
        subtitle: Text('\$${furniture.price.toStringAsFixed(2)}'),
        trailing: IconButton(
          icon: Icon(Icons.favorite, color: Colors.red),
          onPressed: () {
            favoritesProvider.removeFavorite(furniture);
          },
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            '/productDetails',
            arguments: furniture,
          );
        },
      ),
    );
  }
}
