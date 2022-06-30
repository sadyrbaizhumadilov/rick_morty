
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class PersonEntity extends Equatable{
 final int id;
  final String name;
  final String species;
  final String status;
  final String type;
  final String gender;
  final LocationEntity origin;
  final LocationEntity location;
  final String image;
  final List<String> episode;
  final DateTime created;

  const PersonEntity({
    required this.id,
      required this.name,
     required this.species,
     required this.status, 
     required this.type,
     required this.gender,
     required this.origin,
     required this.location,
     required this.image,
     required this.episode,
     required this.created, });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    name,
    status,
    species,
    gender,
    type,
    origin,
    location,
    image,
    episode,
    created];

}
class LocationEntity{
  final String name;
  final String url;
  
 const LocationEntity({required this.name,required this.url});
}