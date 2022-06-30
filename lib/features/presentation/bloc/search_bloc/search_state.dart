import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/features/domain/entities/person_entity.dart';

abstract class SearchPersonState extends Equatable{
  const SearchPersonState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class PersonEmpty extends SearchPersonState{

}

class PersonSearchLoading extends SearchPersonState{}

class PersonSearchLoaded extends SearchPersonState{
  final List<PersonEntity> person;

  PersonSearchLoaded({required this.person});
  @override
  // TODO: implement props
  List<Object?> get props => [person];
}

class SearchPersonError extends SearchPersonState{
  final String message;

  SearchPersonError({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}