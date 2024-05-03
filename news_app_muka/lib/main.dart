import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_app_muka/config/root/app_root.dart';
import 'package:news_app_muka/config/root/on_generate_root.dart';
import 'package:news_app_muka/data/local_storage/local_storage_hive.dart';
import 'package:news_app_muka/home/bloc/cubit/home_cubit.dart';
import "package:path_provider/path_provider.dart";
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();

  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  runApp(const MyApp());
}

late SharedPreferences sharedPreferences;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      lazy: false,
      create: (context) => HiveStorage()..initDataBase(),
      child: BlocProvider(
        create: (contextA) => HomeCubit(context: context),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'News App Muka',
              theme: ThemeData(
                brightness:
                    sharedPreferences.getBool("theme")==true ? Brightness.dark : Brightness.light,
                useMaterial3: false,
              ),
              initialRoute: AppRoot.home,
              onGenerateRoute: OnGenerateRoot.onGenerateRoute,
            );
          },
        ),
      ),
    );
  }
}
