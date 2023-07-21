import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity/modules/home/bloc/home_bloc.dart';
import 'package:infinity/modules/home/view/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (context) => HomeBloc()..add(HomeEventImage()),
          )
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Infinity',
          home: HomeView(),
        ));
  }
}
