import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/features/domain/entities/person_entity.dart';

abstract class PersonState extends Equatable{
  const PersonState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PersonEmpty extends PersonState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PersonLoading extends PersonState{
  final List<PersonEntity>oldPersonList;
  final bool isFirstFetch;

  PersonLoading(this.oldPersonList, {this.isFirstFetch=false});
  @override
  // TODO: implement props
  List<Object?> get props => [oldPersonList];
}

class PersonLoaded extends PersonState{
  final List<PersonEntity>personsList;

  PersonLoaded(this.personsList);
  @override
  // TODO: implement props
  List<Object?> get props => [personsList];
}

class PersonError extends PersonState {
  final String message;

  PersonError({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}