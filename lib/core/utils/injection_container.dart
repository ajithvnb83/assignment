import 'package:assignment/features/home_screen/presentation/cubit/home_screen_cubit.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

Future<void> init() async {
  di.registerFactory<HomeScreenCubit>(() => HomeScreenCubit());
}
