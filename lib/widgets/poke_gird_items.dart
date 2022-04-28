import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/constants/constants.dart';
import 'package:pokemon/constants/ui_helper.dart';
import 'package:pokemon/models/pokemon_model.dart';
import 'package:pokemon/pages/detail_page.dart';
import 'package:pokemon/widgets/poke_image.dart';

// ignore: must_be_immutable
class PokemonGridItem extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonGridItem({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.w),
          ),
          elevation: 2,
          shadowColor: Colors.white,
          color: UIHelper.getColorFromType(pokemon.type![0]),
          /* color: const Color.fromARGB(210, 162, 141, 222), */
          child: Padding(
            padding: UIHelper.getDefaultPadding(),
            child: Column(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      pokemon.name ?? 'N/A',
                      style: Constatns.getPokemonNameTextStyle(),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Chip(
                      backgroundColor:
                          Constatns.backgroundColour.withOpacity(0.9),
                      elevation: 3,
                      label: Text(
                        //! align centerverince withi olmadağı için neye göre ortalayağını bilmiyor parent a göre ortalıyor contaienerdan önce
                        pokemon.type![0],
                        style: Constatns.getTypeChipTextStyle(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: PokeImage(pokemon: pokemon),
                  ),
                ),
                /*            Expanded(
                  child: Image(
                    image: NetworkImage(pokemon.img!),
                    fit: BoxFit.cover,
                  ),
                ), */
              ],
            ),
          ),
        ),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(pokemon: pokemon),
          ),
        ),
      ),
    );
  }

/*   findCardColor() {
    switch (pokemon.type![0]) {
      case 'Grass':
        return const Color.fromARGB(210, 162, 141, 222);
      case 'Fire':
        return const Color.fromARGB(222, 112, 89, 175);
      default:
        return const Color.fromARGB(168, 100, 63, 200);
    }
  } */
}
