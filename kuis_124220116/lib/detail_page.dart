import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String fullname;
  final String email;
  final String totalRoom;
  final String totalNight;
  final int pricePerNight = 500000;

  const DetailPage({
    Key? key,
    required this.fullname,
    required this.email,
    required this.totalRoom,
    required this.totalNight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int totalNights = int.tryParse(totalNight) ?? 0;
    int totalPrice = totalNights * pricePerNight;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF022CB6),
        title: const Text(
          'Payment',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
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
            Center(
              child: const Text(
              'Booking Details',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF022CB6),
              ),
            ),
            ),
            const SizedBox(height: 20),
            Text(
              'Fullname: $fullname',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 10),
            Text(
              'Email: $email',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 10),
            Text(
              'Total Room: $totalRoom',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 10),
            Text(
              'Total Night: $totalNight',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),
            const Divider(thickness: 2),
            const SizedBox(height: 20),
            Text(
              'Total Price: Rp$totalPrice',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Pembayaran berhasil!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: const Text(
                  'Konfirmasi Pembayaran',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
