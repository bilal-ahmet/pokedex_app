// internetten çektiğimiz verileri burada işleyerek kod okunurluğu sağlıyoruz. 

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex_app/model/pokemon_model.dart';

class PokeApi {
  static const String _url = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";


  static Future<List<PokemonModel>> getPokemonData() async{
    List<PokemonModel> _tumPokemonlar = [];                    // geri döndürülecek liste local olarak tanımlandı

    var result = await Dio().get(_url);
    var pokeList = jsonDecode(result.data)["pokemon"];        // ["pokemon"] denmesindeki sebep json dosyasından pokemon verilerini 
                                                              // çekerken direkt result.data dersek pokemon map yapısını alıyoruz 
                                                              // ["pokemon"] diyerek pokemon listesinin elemanlarına ulaşıyoruz. 
    
    _tumPokemonlar = (pokeList as List).map((e) => PokemonModel.fromMap(e)).toList();       // aşağıya gerek yok çünkü pokeList'in
                                                                                            // liste olduğunu biliyoruz

    /*if(pokeList is List){
      _tumPokemonlar = pokeList.map((e) => PokemonModel.fromMap(e)).toList();
    }
    else{
      return [];
    }
    */
    
    //debugPrint(_tumPokemonlar[0].toString());


    return _tumPokemonlar;
  }



}
