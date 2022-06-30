import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rick_and_morty_app/commons/app_colors.dart';
import 'package:rick_and_morty_app/features/domain/entities/person_entity.dart';

class PersonCard extends StatelessWidget {
  final PersonEntity person;
  const PersonCard({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.cellBackground,
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Container(
            width: 166,
            height: 166,
            child: Image.network(person.image),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 12,
                ),
                Text(
                  person.name,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          color: person.status == "Alive"
                              ? Colors.green
                              : Colors.red,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: Text(
                        '${person.status} - ${person.species}',
                        style: TextStyle(
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Last known  location',
                  style: TextStyle(color: AppColors.greyColor),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  person.location.name,
                  style: TextStyle(color: Colors.white),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Origin',
                  style: TextStyle(color: AppColors.greyColor),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  person.origin.name,
                  style: TextStyle(color: Colors.white),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }
}
