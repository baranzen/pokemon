import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/models/pokemon_model.dart';
import 'package:pokemon/services/pokedex_api.dart';
import 'package:pokemon/widgets/poke_gird_items.dart';

class PokemonGrid extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  PokemonGrid({Key? key}) : super(key: key);

  @override
  State<PokemonGrid> createState() => _PokemonGridState();
}

class _PokemonGridState extends State<PokemonGrid> {
  late Future<List<PokemonModel>> _pokemonGrid;
  @override
  void initState() {
    super.initState();
    _pokemonGrid = PokeApi.getPokemenData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: _pokemonGrid,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          debugPrint('g');
          List<PokemonModel> _listem = snapshot.data!;

          return GridView.builder(
            itemCount: _listem.length,
            padding: const EdgeInsets.all(0),
            //! padding i sıfıra çektim kaymıştı aşşağıya az app titile ile arasında boşuk vardı
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: getCrossAxisCount(),
            ),
            itemBuilder: (context, index) => PokemonGridItem(
              pokemon: _listem[index],
            ),
          );
        } else if (snapshot.hasError) {
          debugPrint('f');
          return const Center(
            child: Text('veri gelmedi'),
          );
        } else {
          debugPrint('h');
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  int getCrossAxisCount() {
    if (ScreenUtil().orientation == Orientation.landscape) {
      return 3;
    } else {
      return 2;
    }
  }
}
