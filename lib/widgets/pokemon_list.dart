import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_app/model/pokemon_model.dart';
import 'package:pokedex_app/services/pokedex_api.dart';
import 'package:pokedex_app/widgets/pokelist_item.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokemonListFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pokemonListFuture = PokeApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _pokemonListFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> _listem = snapshot.data!;

          return GridView.builder(
            itemCount: _listem.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: ScreenUtil().orientation == Orientation.portrait ? 2 : 3),
            itemBuilder: (context, index) {
              return PokelistItem(pokemon: _listem[index]);
            },
          );
        } else if (snapshot.hasError) {
          return Center();
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
