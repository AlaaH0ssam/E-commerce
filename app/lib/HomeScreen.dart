import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/get_decoration_cubit/home_decoration_cubit.dart';
import 'cubits/get_decoration_cubit/home_decoration_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _navigateToProductDetails(BuildContext context, item) {
    Navigator.pushNamed(
      context,
      '/productDetails',
      arguments: item,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 30),
        child: Column(
          children: [
            // Search bar and notifications
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: const Color.fromARGB(255, 69, 66, 66),
                        ),
                        hintText: "Search",
                        hintStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 197, 190, 190),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        filled: true,
                        fillColor: Colors.white60,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notification_add_outlined),
                    iconSize: 28,
                    color: const Color.fromARGB(255, 69, 66, 66),
                  ),
                ],
              ),
            ),
            // Promotion Banner
            Container(
              margin: EdgeInsets.symmetric(vertical: 25),
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: ListTile(
                      title: Text(
                        'BIG SALE',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                      subtitle: Text(
                        'in all stock products',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    height: 155,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage('assets/images/Home.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Data List
            Expanded(
              child: BlocBuilder<HomeDecorationCubit, HomeDecorationState>(
                builder: (context, state) {
                  if (state is HomeDecorationLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is HomeDecorationSuccess) {
                    final furnitureList = state.furnitureList;
                    return ListView.builder(
                      itemCount: furnitureList.length,
                      itemBuilder: (context, index) {
                        final item = furnitureList[index];
                        return ListTile(
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          leading: item.imageUrl.isNotEmpty
                              ? Image.network(
                                  item.imageUrl,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                )
                              : Icon(Icons.image,
                                  size: 50), // Placeholder icon if no image
                          title: Text(item.title),
                          trailing: Text('\$${item.price.toStringAsFixed(2)}'),
                          onTap: () => _navigateToProductDetails(context, item),
                        );
                      },
                    );
                  } else if (state is HomeDecorationFailure) {
                    return Center(child: Text('Error: ${state.error}'));
                  } else {
                    return Center(child: Text('Unexpected state'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            // Navigate to different screens based on the index
            switch (_currentIndex) {
              case 0:
                // We are already on home, so no actions
                break;
              case 1:
                Navigator.pushNamed(context, '/favscreen');
                break;
              case 2:
                Navigator.pushNamed(context, '/Account');
                break;
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black54,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.black54,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: Colors.black54,
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
