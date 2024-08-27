import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_assesment/features/groceries/presentation/bloc/grocery_bloc.dart';
import 'package:mobile_assesment/features/groceries/presentation/pages/detailspage.dart';
import 'package:mobile_assesment/features/groceries/presentation/pages/getAllGroceries.dart';
import 'package:mobile_assesment/features/groceries/presentation/pages/splash.dart';
import 'package:mobile_assesment/service_locator.dart';
// import 'service_locator.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GroceryBloc>(
          create: (context) => getIt<GroceryBloc>(),
        ),

      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Splash(),
      ),
    );
  }
}

