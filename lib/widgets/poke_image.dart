import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokemon/constants/constants.dart';
import 'package:pokemon/constants/ui_helper.dart';
import 'package:pokemon/models/pokemon_model.dart';

class PokeImage extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeImage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pokemonImage = pokemon.img!;
    double imageSize = UIHelper.calculatePokeUIamgeSize();
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            Constatns.pokeBallImagePath,
            fit: BoxFit.fitHeight,
            height: imageSize,
            width: imageSize,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemon.id!,
            child: CachedNetworkImage(
              height: imageSize,
              width: imageSize,
              imageUrl: pokemonImage,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              placeholder: (context, string) {
                return CircularProgressIndicator(
                  color: UIHelper.getColorFromType(pokemon.type![0]),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
