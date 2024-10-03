import 'package:flutter/material.dart';
import 'package:kuis_124220116/detail_page.dart';


class pesanhotel extends StatefulWidget {
  final String imagePath;
  final String namaproduk;
  final String harga;

  const pesanhotel({
    Key? key,
    required this.imagePath,
    required this.namaproduk,
    required this.harga,
  }) : super(key: key);

  @override
  State<pesanhotel> createState() => _pesanhotelState();
}

class _pesanhotelState extends State<pesanhotel> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController totalRoomController = TextEditingController();
  final TextEditingController totalNightController = TextEditingController();

  @override
  void dispose() {
    fullnameController.dispose();
    emailController.dispose();
    totalRoomController.dispose();
    totalNightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:Color.fromARGB(255, 2, 44, 182),
        title: Text(
          ' ${widget.namaproduk}',
          style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold,),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Image.asset(widget.imagePath, width: 150, height: 150),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.namaproduk,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    widget.harga,
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Center(
                child: Text(
                  'Booking Information',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: fullnameController,
              decoration: const InputDecoration(hintText: 'Fullname'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: totalRoomController,
              decoration: const InputDecoration(hintText: 'Total room'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: totalNightController,
              decoration: const InputDecoration(hintText: 'Total night'),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        fullname: fullnameController.text,
                        email: emailController.text,
                        totalRoom: totalRoomController.text,
                        totalNight: totalNightController.text,
                      ),
                    ),
                  );
                },
                child: const Text('Beli bangg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
