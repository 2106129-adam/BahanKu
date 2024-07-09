import 'package:BahanBaku/stok_saya_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BahanBaku',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    StokSayaPage(),
    TentangAplikasiPage(),
  ];

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('BahanBaku', style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: const Color.fromARGB(255, 158, 0, 34),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.storage),
            label: 'Stok Saya',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Tentang Aplikasi',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 158, 0, 34),
        onTap: _onItemTapped,
      ),
    );
  }
}

class TentangAplikasiPage extends StatelessWidget {
  const TentangAplikasiPage({super.key});

  void _launchURL() async {
    const url = 'https://github.com/2106129-adam';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Dibuat oleh Adam Abdul Wahid\nNim 2106129',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color.fromARGB(255, 158, 0, 34),
              fontSize: 16,
            ),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 158, 0, 34),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: _launchURL,
            icon: const FaIcon(FontAwesomeIcons.github, color: Colors.white),
            label: const Text(
              'Kunjungi GitHub',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
