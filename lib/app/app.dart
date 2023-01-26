import 'package:bloc_api/bloc/multi_state_bloc.dart';
import 'package:flutter/material.dart';
import '../ui/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>MultiStateBloc())
      ],
      child: const MyApp()
   );
  }
}





class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MultiStateBlocPage(),
    );
  }
}
