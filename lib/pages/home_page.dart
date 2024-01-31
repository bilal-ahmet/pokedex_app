import 'package:flutter/material.dart';
import 'package:pokedex_app/widgets/app_title.dart';
import 'package:pokedex_app/widgets/pokemon_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(                 // orientationBuilder kullanmakta ki amaç, pokemonList sınıfında gridViewBuilder da
        builder: (context, orientation) {       // crossaxiscount sayısı ekran dikse 2 yataysa 3 olarak ayarlandığı zaman direkt çalışmaz
          return const Column(                  // burayı oriantationBuilder ile yazınca tetikleniyor
          children: [
            AppTitle(),
            Expanded(child: PokemonList()),
          ],
        );
        },
      ),
    );
  }
}
