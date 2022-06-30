import 'package:flutter/foundation.dart';
import 'package:rick_and_morty_app/features/data/models/location_model.dart';
import 'package:rick_and_morty_app/features/domain/entities/person_entity.dart';

class PersonModel extends PersonEntity{
  PersonModel({
      id,
      name,
      species,
      status, 
     type,
      gender,
      origin,
     location,
      image,
      episode,
     created,
     }) : super(
       id: id,
       name: name,
       species: species,
       status: status,
       type: type,
       gender: gender,
       origin: origin,
       location: location,
       episode: episode,
       image: image,
       created: created); 

  factory PersonModel.fromJson(Map<String, dynamic>json){
    return PersonModel(
      id: json['id'], 
      name: json['name'], 
      species: json['species'],
       status: json['status'], 
       type:json['type'], 
       gender: json['gender'],
        origin: json['origin']!=null ? LocationModel.fromJson(json['origin']):null,
         location:json['location']!=null ? LocationModel.fromJson(json['location']):null, 
         image: json['image'], 
         episode: (json['episode']as List<dynamic>).map((e) => e as String).toList(),
          created: DateTime.parse(json['created']as String));
  }
  Map<String, dynamic>toJson(){
    return {
      'id':id,
      'name':name,
      'species':species,
      'type':type,
      'gender':gender,
      'origin':origin,
      'location':location,
      'image':image,
      'episode':episode,
      'created':created.toIso8601String(),
    };
  }
}