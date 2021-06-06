import 'dart:convert';
import 'package:http/http.dart';
import 'package:fortnite_stats/model/Profile.dart';

class ProfileService{

  String name;

  Profile profile = new Profile();

  Future<void> getData() async {

    try{
      print(name);
      Response response = await get(Uri.parse('https://fortnite-api.com/v1/stats/br/v2?name=$name'));
      Map data = jsonDecode(utf8.decode(response.bodyBytes));
      profile.username = data['data']['account']['name'];
      profile.level = data['data']['battlePass']['level'];
      profile.wins = data['data']['stats']['all']['overall']['wins'];
      profile.winRate = data['data']['stats']['all']['overall']['winRate'];
      profile.minutes = data['data']['stats']['all']['overall']['minutesPlayed'];
      profile.kpm = data['data']['stats']['all']['overall']['killsPerMatch'];
      int minutos = profile.minutes;
      int horas = minutos ~/ 60;
      profile.minutes = horas;
    }
    catch(e){
      print('caught error $e');
      profile.username ='not founded';
      profile.level = 0;
      profile.wins =0;
      profile.winRate = 0;
      profile.minutes = 0;
      profile.kpm =0;
    }

  }
}