




import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';
import '../../../domain/usecases/search_person.dart';

import 'search_event.dart';
import 'search_state.dart';
const SERVER_FAILURE_MESSAGE='Server Failure';
const CACHE_FAILURE_MESSAGE='CACHE FAILURE';
class SearchPersonBloc extends Bloc<SearchPersonEvent,SearchPersonState>{
  final SearchPerson searchPerson;
  SearchPersonBloc({required this.searchPerson}) : super(PersonEmpty());
 @override
  Stream<SearchPersonState>mapEventToState(SearchPersonEvent event)async*{
if(event is SearchPersons){
  yield*_mapFetchPersonsToState(event.personQuery);
}
  }
Stream<SearchPersonState>_mapFetchPersonsToState(String personQuery)async*{
    yield PersonSearchLoading();
final failureOrPerson=await searchPerson(SearchPersonParams(query: personQuery));

yield failureOrPerson.fold((failure)=>SearchPersonError(message: _mapFailureToMessage(failure)), (person)=>PersonSearchLoaded(person: person)
);
}}
 String _mapFailureToMessage(Failure failure){
    switch(failure.runtimeType){
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
       return CACHE_FAILURE_MESSAGE;
      default:
      return 'Unexcepted Error'; 
      
    
    }
  }
