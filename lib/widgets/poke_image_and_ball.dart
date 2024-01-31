import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/constants/ui_helper.dart';
import 'package:pokedex_app/model/pokemon_model.dart';

class PokeImageAndBall extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeImageAndBall({required this.pokemon, super.key});

  @override
  Widget build(BuildContext context) {
    String pokeballImageUrl = "images/pokeball.png";
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            pokeballImageUrl,
            width: UIHelper.calculatePkeIamgeAndBall(),
            height: UIHelper.calculatePkeIamgeAndBall(),
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemon.id!,
            child: CachedNetworkImage(
              errorWidget: (context, url, error) => Text(""),
              imageUrl: pokemon.img!,
              width: UIHelper.calculatePkeIamgeAndBall(),
              height: UIHelper.calculatePkeIamgeAndBall(),
              fit: BoxFit.fitHeight,
              placeholder: (context, url) => CircularProgressIndicator(),
            ),
          ),
        )
      ],
    );
  }
}
