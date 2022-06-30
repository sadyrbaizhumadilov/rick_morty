import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/features/domain/entities/person_entity.dart';
import 'package:rick_and_morty_app/features/presentation/bloc/person_list_cubit.dart/person_list_cubit.dart';
import 'package:rick_and_morty_app/features/presentation/bloc/person_list_cubit.dart/person_list_state.dart';
import 'package:rick_and_morty_app/features/presentation/widgets/person_card_widget.dart';

class PersonList extends StatelessWidget {
  const PersonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonListCubit, PersonState>(builder: (context, state) {
      List<PersonEntity> persons = [];
      if (state is PersonLoading && state.isFirstFetch) {
        return _loadingindicator();
      } else if (state is PersonLoaded) {
        persons = state.personsList;
      }
      return ListView.separated(
          itemBuilder: (context, index) {
            return PersonCard(person: persons[index]);
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.grey[400],
            );
          },
          itemCount: persons.length);
    });
  }

  Widget _loadingindicator() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
