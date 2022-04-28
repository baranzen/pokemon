import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/constants/constants.dart';
import 'package:pokemon/constants/ui_helper.dart';
import 'package:pokemon/models/pokemon_model.dart';
import 'package:pokemon/widgets/detail_page/poke_inf.dart';
import 'package:pokemon/widgets/detail_page/poke_type_name.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //! mainAxisAlignment: MainAxisAlignment.spaceBetween, //! yeni bak tyt
        children: [
          SizedBox(height: 20.h),
          top(context),
          SizedBox(height: 20.h),
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter, //! top stardi duzelttim
              children: [
                pokeBall(),
                pokeInf(),
                pokeInfImage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Positioned pokeBall() {
    return Positioned(
      top: -30,
      height: 0.25.sh,
      child: Image.asset(
        Constatns.pokeBallImagePath,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Positioned pokeInf() {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      top: 0.16.sh,
      child: PokeInf(pokemon: pokemon),
    );
  }

  Padding pokeInfImage() {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Align(
        alignment: Alignment.topCenter,
        child: Hero(
          tag: pokemon.id!,
          child: CachedNetworkImage(
            imageUrl: pokemon.img!,
            height: ScreenUtil().orientation == Orientation.portrait
                ? 0.22.sh
                : 0.25.sw,
            fit: BoxFit.fitHeight, //!!!
          ),
        ),
      ),
    );
  }

  Widget top(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            iconSize:
                ScreenUtil().orientation == Orientation.portrait ? 24.w : 12.w,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          PokeNameType(
            pokemon: pokemon,
          ),
        ],
      ),
    );
  }
}
