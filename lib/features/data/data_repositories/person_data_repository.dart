import 'package:rick_and_morty_app/core/error/exception.dart';
import 'package:rick_and_morty_app/core/platform/network_info.dart';
import 'package:rick_and_morty_app/features/data/data_sources/person_local_data_source.dart';
import 'package:rick_and_morty_app/features/data/data_sources/person_remote_data_source.dart';
import 'package:rick_and_morty_app/features/data/models/person_model.dart';
import 'package:rick_and_morty_app/features/domain/entities/person_entity.dart';
import 'package:rick_and_morty_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/features/domain/repositories/person_repository.dart';

import '../data_sources/person_remote_data_source.dart';


class PersonDataRepository implements PersonRepository{
  final NetWorkInfo netWorkInfo;
  final PersonRemoteDataSource personRemoteDataSource;
  final PersonLocalDataSource personLocalDataSource;

  PersonDataRepository({required this.personRemoteDataSource, required this.netWorkInfo,  required this.personLocalDataSource});
  @override
  Future<Either<Failure, List<PersonEntity>>> getAllPersons(int page) async {
    
    return await _getPersons(() => personRemoteDataSource.getAllPersons(page));
  }

  @override
  Future<Either<Failure, List<PersonEntity>>> searchPerson(String query) async {
    return await _getPersons(() => personLocalDataSource.getLastPersonsFromCache());
  }

  Future<Either<Failure, List<PersonModel>>>_getPersons(
    Future<List<PersonModel>> Function() getPersons) async{
      if(await netWorkInfo.isConnected){
        try{
          final remotePerson=await getPersons();
          personLocalDataSource.personsToCache(remotePerson);
          return Right(remotePerson);

        }on ServerException{
          return Left(ServerFailure());
        }
      }else{
        try{
          final locationPerson=await personLocalDataSource.getLastPersonsFromCache();
          return Right(locationPerson);

        }on CacheException{
          return Left(CacheFailure());
        }
      }
    }

}