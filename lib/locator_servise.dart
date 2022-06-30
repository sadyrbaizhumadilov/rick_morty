import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rick_and_morty_app/core/platform/network_info.dart';
import 'package:rick_and_morty_app/features/data/data_repositories/person_data_repository.dart';
import 'package:rick_and_morty_app/features/data/data_sources/person_local_data_source.dart';
import 'package:rick_and_morty_app/features/data/data_sources/person_remote_data_source.dart';
import 'package:rick_and_morty_app/features/domain/repositories/person_repository.dart';
import 'package:rick_and_morty_app/features/domain/usecases/get_all_persons.dart';
import 'package:rick_and_morty_app/features/domain/usecases/search_person.dart';
import 'package:rick_and_morty_app/features/presentation/bloc/person_list_cubit.dart/person_list_cubit.dart';
import 'package:rick_and_morty_app/features/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:http/http.dart ' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;
Future<void>init()async{
  //Bloc, Cubit
  sl.registerFactory(() => PersonListCubit(getAllPersons: sl()));
  sl.registerFactory(() => SearchPersonBloc(searchPerson: sl()));

  //UseCase
  sl.registerLazySingleton(() => GetAllPersons(sl()));
  sl.registerLazySingleton(() => SearchPerson(sl()));

  //Repository
  sl.registerLazySingleton<PersonRepository>(() => PersonDataRepository(
      personRemoteDataSource: sl(),
      netWorkInfo: sl(),
      personLocalDataSource: sl()));

  sl.registerLazySingleton<PersonRemoteDataSource>(
      () => PersonRemoteDataSourceImpl(client: http.Client()));

  sl.registerLazySingleton<PersonLocalDataSource>(
      () => PersonLocalDataSourceImpl(sharedPreferences: sl()));
  //Core
  sl.registerLazySingleton<NetWorkInfo>(
      () => NetWorkInfoImpl(connectionChecker: sl()));
  //External
  final sharedPreferences=await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
