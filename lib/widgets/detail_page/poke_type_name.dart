import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/constants/constants.dart';
import 'package:pokemon/models/pokemon_model.dart';

class PokeNameType extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeNameType({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pokeName(),
          SizedBox(height: 0.02.sh),
          chip(),
        ],
      ),
    );
  }

  Row pokeName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          pokemon.name!,
          style: Constatns.getPokemonNameTextStyle(),
        ),
        Text(
          '#${pokemon.num}',
          style: Constatns.getPokemonNameTextStyle(),
        )
      ],
    );
  }

  Chip chip() {
    return Chip(
      backgroundColor: Constatns.backgroundColour.withOpacity(0.9),
      label: Text(
        pokemon.type?.join(' , ') ?? '',
        style: Constatns.getTypeChipTextStyle(),
      ),
    );
  }
}
