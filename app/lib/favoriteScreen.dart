import 'package:flutter/material.dart';

//import 'FavoriteProvider.dart';
class favoriteScreen extends StatelessWidget {
  const favoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /**Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final favoriteProducts = favoriteProvider.favoriteProducts;
 */
    return Scaffold(
      appBar: AppBar(
        title: 
           Text(
            'WishList',
            style: TextStyle(
              color: const Color.fromARGB(255, 69, 66, 66),
              fontSize: 16.5,
              fontWeight: FontWeight.bold,
            
          ),
        ),
      ),
      /*body: favoriteProducts.isEmpty
          ? Center(child: Text('No favorites added yet.'))
          : ListView.builder(
              itemCount: favoriteProducts.length,
              itemBuilder: (ctx, index) {
                final product = favoriteProducts[index];
                return ListTile(
                  leading: Image.network(product.imageUrl),
                  title: Text(product.name),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      favoriteProvider.toggleFavorite(product);
                    },
                  ),
                );
              },
            ),*/
    );
  }
}
