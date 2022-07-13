import 'package:drawer/Screens/tela_a.dart';
import 'package:drawer/Screens/tela_b.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 1;

  _onSelectedItem(int index) {
    setState(() {
      selectedIndex = index;
    });
    //fechando o Drawer
    Navigator.of(context).pop();
  }

  getTela(int ops) {
    switch (ops) {
      case 1:
        return TelaA();
        break;
      case 2:
        return TelaB();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: getTela(selectedIndex),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Center(
                child: Text("Seja Bem Vindo ao APP"),
              )),
          ListTile(
            title: Text("Tela A"),
            onTap: _onSelectedItem(1),
          ),
          ListTile(
            title: Text("Tela B"),
            onTap: _onSelectedItem(2),
          )
        ],
      )),
    );
  }
}
