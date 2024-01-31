import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_app/constants/ui_helper.dart';
import 'package:pokedex_app/model/pokemon_model.dart';
import 'package:pokedex_app/widgets/poke_information.dart';
import 'package:pokedex_app/widgets/poke_type_name.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({required this.pokemon, super.key});

  @override
  Widget build(BuildContext context) {
    String pokeballImageUrl = "images/pokeball.png";
    return ScreenUtil().orientation == Orientation.portrait
        ? _buildPortraitBody(context, pokeballImageUrl)
        : _buildLandscapeBody(context, pokeballImageUrl);
  }

  Scaffold _buildPortraitBody(BuildContext context, String pokeballImageUrl) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getIconPadding(),
              child: IconButton(
                  iconSize: 48.w,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios)),
            ),
            PokeNameType(pokemon: pokemon),
            SizedBox(
              height: 50.h,
            ),
            Expanded(
                child: Stack(
              children: [
                Positioned(
                  right: 0,
                  child: Image.asset(pokeballImageUrl),
                  height: 0.15.sh,
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: 0.12.sh,
                    child: PokeInformation(pokemon: pokemon)),
                Align(
                  alignment: Alignment.topCenter,
                  child: Hero(
                    tag: pokemon.id!,
                    child: CachedNetworkImage(
                        height: 0.25.sh,
                        fit: BoxFit.fitHeight,
                        imageUrl: pokemon.img!),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Scaffold _buildLandscapeBody(BuildContext context, String pokeballImageUrl) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getIconPadding(),
              child: IconButton(
                  iconSize: 48.w,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios)),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PokeNameType(pokemon: pokemon),
                      Hero(
                        tag: pokemon.id!,
                        child: CachedNetworkImage(
                            height: 0.25.sw,
                            fit: BoxFit.fitHeight,
                            imageUrl: pokemon.img!),
                      ),
                    ],
                  ),
                ),
                Expanded(flex: 4, child: Padding(padding: UIHelper.getDefaultPadding(), child: PokeInformation(pokemon: pokemon)))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
