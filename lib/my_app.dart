import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:assignment/core/utils/common_import.dart';
import 'package:assignment/core/utils/injection_container.dart' as sl;

import 'features/home_screen/presentation/pages/home_screen.dart';
import 'features/home_screen/presentation/cubit/home_screen_cubit.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl.di<HomeScreenCubit>()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
