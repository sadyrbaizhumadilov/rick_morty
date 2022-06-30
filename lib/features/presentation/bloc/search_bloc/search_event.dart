import 'package:equatable/equatable.dart';

abstract class SearchPersonEvent extends Equatable{
  const SearchPersonEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class SearchPersons extends SearchPersonEvent{
  final String personQuery;

  SearchPersons(this.personQuery);
}
 