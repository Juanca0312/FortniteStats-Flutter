import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fortnite_stats/profile.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'LuckiestGuy'),
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Text('Fortnite Stats', style: TextStyle(fontSize: 40),),
              ),
              Positioned(
                top: 305,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF3069E4),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(35), topLeft: Radius.circular(35))
                  ),
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 220,),
                      Text('Ingrese username', style: TextStyle(letterSpacing: 1, fontSize: 19),),
                      Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: usernameController,
                            decoration: InputDecoration(
                              hintText: '  ej: GUM',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfileDetail(username: usernameController.text,)),
                          );
                        },
                        child: Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFF0A1128),
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Center(child: Text('Buscar', style: TextStyle(color: Colors.white, fontSize: 16, letterSpacing: 1),))
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 35,
                top: 70,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/skin.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 400,
                  width: 300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

