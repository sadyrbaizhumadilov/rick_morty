import 'dart:convert';


import 'package:rick_and_morty_app/core/error/exception.dart';
import 'package:rick_and_morty_app/features/data/models/person_model.dart';
import 'package:rick_and_morty_app/features/domain/usecases/get_all_persons.dart';
import 'package:rick_and_morty_app/features/domain/usecases/search_person.dart';
import 'package:http/http.dart' as http;

abstract class PersonRemoteDataSource {
 Future<List<PersonModel>> getAllPersons(int page);





 Future<List<PersonModel>> searchPerson(String query);
}

class PersonRemoteDataSourceImpl implements PersonRemoteDataSource{
  final http.Client client;

  PersonRemoteDataSourceImpl({required this.client});
  @override
  Future<List<PersonModel>> getAllPersons(int page) =>_getPersonFromUrl("https://rickandmortyapi.com/api/character/?page=$page");
@override
  Future<List<PersonModel>> searchPerson(String query) =>_getPersonFromUrl("https://rickandmortyapi.com/api/character/?name=$query");
    
Future<List<PersonModel>>_getPersonFromUrl(String url)async{
  print(url);
  final respone=await client.get(Uri.parse(url),
    headers: {'Content-Type':'application/json'});
    if(respone.statusCode==200){
      final persons=json.decode(respone.body);
      return (persons['results']as List).map((person) => PersonModel.fromJson(person)).toList();
    }else {
      throw ServerException();
    }
  }
  }
