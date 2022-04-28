import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/models/pokemon_model.dart';
import 'package:pokemon/constants/constants.dart';

class PokeInf extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeInf({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bottomControl();
  }

  Widget _bildInformationRow(String label, dynamic value) {
    return Padding(
      padding: EdgeInsets.all(8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Constatns.getPokeInfoLabelTextStyle()),
          if (value is List && value.isNotEmpty)
            Text(
              value.join(' , '),
              style: Constatns.getPokeInfoTextStyle(),
            )
          else if (value == null)
            Text(
              'Not available',
              style: Constatns.getPokeInfoTextStyle(),
            )
          else
            Text(
              value,
              style: Constatns.getPokeInfoTextStyle(),
            ),
        ],
      ),
    );
  }

  Widget bottomControl() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.w),
            topRight: Radius.circular(10.w),
          ),
          /*    color: Colors.transparent, //! */
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _bildInformationRow('Name', pokemon.name),
              _bildInformationRow('Height', pokemon.height),
              _bildInformationRow('Weight', pokemon.weight),
              _bildInformationRow('Spawn Time', pokemon.spawnTime),
              _bildInformationRow('Spawn Time', pokemon.spawnTime),
              _bildInformationRow('Weakness', pokemon.weaknesses),
              _bildInformationRow('Pre Evolution', pokemon.prevEvolution),
              _bildInformationRow('Next Evolution', pokemon.nextEvolution),
            ],
          ),
        ),
      );
    } else {
      return SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.w),
              topRight: Radius.circular(10.w),
            ),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _bildInformationRow('Name', pokemon.name),
                _bildInformationRow('Height', pokemon.height),
                _bildInformationRow('Weight', pokemon.weight),
                _bildInformationRow('Spawn Time', pokemon.spawnTime),
                _bildInformationRow('Spawn Time', pokemon.spawnTime),
                _bildInformationRow('Weakness', pokemon.weaknesses),
                _bildInformationRow('Pre Evolution', pokemon.prevEvolution),
                _bildInformationRow('Next Evolution', pokemon.nextEvolution),
              ],
            ),
          ),
        ),
      );
    }
  }
}
