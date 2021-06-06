import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fortnite_stats/services/Profile%20Service.dart';

class ProfileDetail extends StatefulWidget {
  final username;
  const ProfileDetail({this.username});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileDetail> {

  static var username;
  int level = 0;
  int wins = 0;
  double kpm = 0;
  double winRate = 0;
  int minutes = 0;
  bool loading=true;

  ProfileService service = new ProfileService();



  void assignData(){
    setState(() {
      username = service.profile.username;
      level = service.profile.level;
      wins = service.profile.wins;
      kpm = service.profile.kpm;
      winRate = service.profile.winRate;
      minutes = service.profile.minutes;
    });
    loading = false;

  }

  void getData() async {
    await service.getData();
    assignData();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    username = widget.username;
    service.name = widget.username;
    getData();
  }

  @override
  Widget build(BuildContext context) {

    return loading? Loading() : SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF3069E4),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color:  Color(0xFF3069E4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  width: MediaQuery.of(context).size.width,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back,color: Colors.white, size: 50, ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
                CircleAvatar(backgroundImage: AssetImage('assets/user.png'), radius: 60,),
                SizedBox(height: 10,),
                Text(username, style: TextStyle(color: Colors.white, fontSize: 30),),
                Divider(height: 40, color: Color(0xFF0A1128), thickness: 2,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('level', style: TextStyle(color: Color(0xFF0A1128), fontSize: 20),),
                      Text(level.toString(), style: TextStyle(color: Colors.white, fontSize: 40),),
                      SizedBox(height: 15,),
                      Text('wins', style: TextStyle(color: Color(0xFF0A1128), fontSize: 20),),
                      Text(wins.toString(), style: TextStyle(color: Colors.white, fontSize: 40),),
                      SizedBox(height: 15,),
                      Text('win rate', style: TextStyle(color: Color(0xFF0A1128), fontSize: 20),),
                      Text(winRate.toString(), style: TextStyle(color: Colors.white, fontSize: 40),),
                      SizedBox(height: 15,),
                      Text('Kills per match', style: TextStyle(color: Color(0xFF0A1128), fontSize: 20),),
                      Text(kpm.toString(), style: TextStyle(color: Colors.white, fontSize: 40),),
                      SizedBox(height: 15,),
                      Text('hours played', style: TextStyle(color: Color(0xFF0A1128), fontSize: 20),),
                      Text(minutes.toString(), style: TextStyle(color: Colors.white, fontSize: 40),),
                      SizedBox(height: 15,),
                    ],
                  ),

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: SpinKitRotatingCircle(
            size: 45,
            duration: Duration(milliseconds: 700),
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(5, 5),
                      ),
                    ]
                ),
              );
            },
          )
      ),
    );
  }
}

