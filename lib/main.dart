import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/commons/app_colors.dart';
import 'package:rick_and_morty_app/features/presentation/bloc/person_list_cubit.dart/person_list_cubit.dart';
import 'package:rick_and_morty_app/features/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:rick_and_morty_app/locator_servise.dart' as di;

import 'features/presentation/pages/home_page.dart';
import 'locator_servise.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<PersonListCubit>(
              create: (context) => sl<PersonListCubit>()..loadPerson()),
          BlocProvider<SearchPersonBloc>(
              create: (context) => sl<SearchPersonBloc>()),
        ],
        child: MaterialApp(
          theme: ThemeData.dark().copyWith(
              backgroundColor: AppColors.mainBackground,
              scaffoldBackgroundColor: AppColors.mainBackground),
              home: HomePage(),
        ),);
  }
}
