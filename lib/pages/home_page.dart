import 'package:flutter/material.dart';
import 'package:pokemon/constants/constants.dart';
import 'package:pokemon/services/pokedex_api.dart';
import 'package:pokemon/widgets/app_title.dart';
import 'package:pokemon/widgets/pokemon_grid.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PokeApi.getPokemenData();
    return Scaffold(
      backgroundColor: Constatns.backgroundColour,
      body: body(),
    );
  }

  OrientationBuilder body() {
    return OrientationBuilder(
      //! kontrol ettim print app title
      builder: (context, orientation) => Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // ignore: prefer_const_constructors
          AppTitle(), //! constu kaldır yoksa Orientation değişice tekrar çizlmez
          const SizedBox(height: 10),
          // ignore: prefer_const_constructors
          Expanded(
            // ignore: prefer_const_constructors
            child:
                PokemonGrid(), //! constu kaldır yoksa Orientation değişice tekrar çizlmez
          ),
        ],
      ),
    );
  }
}
