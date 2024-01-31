import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_app/constants/constants.dart';
import 'package:pokedex_app/constants/ui_helper.dart';
import 'package:pokedex_app/model/pokemon_model.dart';
import 'package:pokedex_app/widgets/detail_page.dart';
import 'package:pokedex_app/widgets/poke_image_and_ball.dart';

class PokelistItem extends StatelessWidget {
  final PokemonModel pokemon;
  PokelistItem({required this.pokemon, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(pokemon: pokemon),));
      },
      child: Card(
        color: UIHelper.getColorFromType(pokemon.type![0]),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
        elevation: 3,
        shadowColor: Colors.white,
        child: Padding(
          padding: UIHelper.getDefaultPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pokemon.name ?? "N/A",
                style: Constants.getPokemonNameTextStyle(),
              ), // ?? eğer null değilse N/A yazdır demek
              Chip(
                  label: Text(pokemon.type![0]),
                  labelStyle: Constants.getTypeChipTextStyle(),
                  shape: StadiumBorder(side: BorderSide(width: 0))),
              Expanded(child: PokeImageAndBall(pokemon: pokemon)),    
            ],
          ),
        ),
      ),
    );
  }
}
