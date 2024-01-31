import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._(); // bu şekilde consttructor oluşturursak bu sınıftan hiçbir şekilde nesne üretilmeyecek

  static const String title = "POKEDEX";

  static TextStyle getTitleTextStyle() {
    return TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: _calculatorFontSize(56));
  }

  static TextStyle getPokemonNameTextStyle() {
    return TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: _calculatorFontSize(40));
  }

  static TextStyle getTypeChipTextStyle() {
    return TextStyle(
        color: Colors.white, fontSize: _calculatorFontSize(30));
  }

  static _calculatorFontSize(int size){
    if(ScreenUtil().orientation == Orientation.portrait){
      return size*2.sp;
    }
    else{
      return (size*1).sp;
    }
  }
  
  // sp, telefonun ayarlarından font size büyütüldüğü zaman uygulamada da font size büyüyor bunu kontrol etmye yarıyor

  static getPokeInfoTextStyle(){
    return TextStyle(fontSize: _calculatorFontSize(16));
  }

  static getPokeInfoLableTextStyle(){
    return TextStyle(fontSize: _calculatorFontSize(20), fontWeight: FontWeight.bold);
  }
}
