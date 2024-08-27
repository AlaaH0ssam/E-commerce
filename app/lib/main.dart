import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'services/homeDecoration_service.dart';
import 'cubits/get_decoration_cubit/home_decoration_cubit.dart';
import 'spalsh.dart';
import 'CreateAccount.dart';
import 'login.dart';
import 'HomeScreen.dart';
import 'Accountscreen.dart';
import 'onboardscreens.dart';
import 'favoriteScreen.dart';
import 'productscreen.dart';
import 'FavoriteProvider.dart';

void main() {
  runApp(const PetShop());
}

class PetShop extends StatelessWidget {
  const PetShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeDecorationCubit(HomeDecorationService())
            ..fetchFurnitureData(
                'https://dummyjson.com/products/category/furniture'),
        ),
      ],
      child: ChangeNotifierProvider(
        create: (_) => FavoritesProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => splashScreen(),
            '/onboard': (context) => OnboardingScreen(),
            '/create-account': (context) => CreateaccountScreen(),
            '/login': (context) => loginscreen(),
            '/Home': (context) => HomeScreen(),
            '/Account': (context) => AccountScreen(username: ''),
            '/favscreen': (context) => FavoriteScreen(),
            '/productDetails': (context) => ProductScreen(),
          },
        ),
      ),
    );
  }
}
