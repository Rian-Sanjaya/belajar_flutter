import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Belajar Flutter", // title navbar
      home: 
        HomeScreen(),
        debugShowCheckedModeBanner: false, // menghilangkan teks debug
    );
  }
}

class HomeScreen extends StatefulWidget{

  @override
  FormState createState() => FormState();
}

class FormState extends State<HomeScreen>{
  // deklarasi myController
  final myController = TextEditingController();
  @override
  void dispose(){
    myController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Belajar Flutterrr"),
        backgroundColor: Colors.green,

        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.add_to_queue, color: Colors.white),
            onPressed: (){
              // navigate to second screen
              Navigator.push(context, MaterialPageRoute
                (builder: (context) => SecondScreen()) // kita akan membuat class SecondScreen
              );
            },
          )
        ],
      ),

      // menampilkan textfield
      body: Padding(padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
        ),
      ),

      // menambahkan floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          return showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                content: Text(myController.text),
              );
            }
          );
        },
        tooltip: "Menampilkan value text",
        child: Icon(Icons.text_fields),
      ),
    );

  }
}

class SecondScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Second Screen'),
        backgroundColor: Colors.red,
      ),

      // body: Image.asset('assets/images/brutus.png'),

      // create grid
      body: 
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(Icons.apps, color: Colors.green, size: 40.0),
                new Text('Apps')
              ],
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(Icons.apps, color: Colors.green, size: 40.0),
                new Text('Galery')
              ],
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new IconButton(
                  icon: Icon(Icons.alarm),
                  color: Colors.green,
                  onPressed: (){
                    Fluttertoast.showToast(
                      msg: "ini alarm",
                      toastLength: Toast.LENGTH_LONG,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      timeInSecForIos: 1,
                      gravity: ToastGravity.CENTER
                    );
                  },
                ),
                new Text('Alarm')
              ],
            ),
          ],
        ),

      // bottom menu
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: new Text('Massage'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: new Text('Profile'),
          ),
        ],
      ),
    );
  }
}