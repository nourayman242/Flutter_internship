import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pantrypal/pages/home.dart';
import 'cubits/theme_cubits/theme_cubit.dart';
import 'cubits/theme_cubits/theme_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('pantryBox');
  runApp(BlocProvider(create: (_) => ThemeCubit(), child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeState.themeData,
          home: const HomePage(),
        );
      },
    );
  }
}
