import 'package:flutter/material.dart';
import 'package:kuis_124220116/pesan_hotel.dart';
import 'package:url_launcher/url_launcher.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url); 
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:Color.fromARGB(255, 2, 44, 182),
        title: Text('BLUE DOORZ', style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold,),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color:Colors.white),
          onPressed: () {
          
          },
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [

            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(5.0),
                child: Image.asset('bluedoorz.png',
                width: 100.0,
                height: 100.0,)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                padding: EdgeInsets.all(8.0),
                child: Text('Welcome To Blue Doorz                        '),
              ),
              ElevatedButton(
                onPressed: () {
                  String url = 'https://traveloka.com';
                    _launchURL(url);
                },
                child: const Text('about us'),
              ),
                ],
              )
            ],
            
          ),
          Expanded(
            child: _grid(),
          ),
        ],
      ),
    );
  }

  Widget _grid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 2 / 3,
      ),
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return _buildGridItem(
              imagePath: 'assets/hotel.jpg',
              color: Colors.blueAccent,
              text: 'Blue Lagoon',
              harga: 'Rp500.000/night');
        } else if (index == 1) {
          return _buildGridItem(
              imagePath: 'assets/hotel.jpg',
              color: Colors.blueAccent,
              text: 'Blue Lagoon',
              harga: 'Rp500.000/night');
        } else if (index == 2) {
          return _buildGridItem(
            imagePath: 'assets/hotel.jpg',
              color: Colors.blueAccent,
              text: 'Blue Lagoon',
              harga: 'Rp500.000/night');
        } else {
          return _buildGridItem(
              imagePath: 'assets/hotel.jpg',
              color: Colors.blueAccent,
              text: 'Blue Lagoon',
              harga: 'Rp500.000/night');
        }
      },
    );
  }

  Widget _buildGridItem({
    required String imagePath,
    required Color color,
    required String text,
    required String harga,
  }) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2), 
          spreadRadius: 1, 
          blurRadius: 5,   
          offset: Offset(0, 3),
        ),
      ],
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                right: 20.0, left: 20.0, top: 10.0, bottom: 70.0),
            child: Center(
              child: Image.asset(
                imagePath,
                width: 150.0,
                height: 150.0,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  harga,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                  Navigator.push(
                      context as BuildContext, MaterialPageRoute(
                        builder: (context) => pesanhotel(
                          imagePath: imagePath,
                          namaproduk: text,
                          harga: harga,
                      
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Book now'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}