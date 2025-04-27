import 'package:flutter/material.dart';

class Trip {
  final String title;
  final String date;
  final String image;

  Trip({required this.title, required this.date, required this.image});
}


class TripListScreen extends StatefulWidget {
  const TripListScreen({super.key});

  @override
  State<TripListScreen> createState() => _TripListScreenState();
}

class _TripListScreenState extends State<TripListScreen> {

  late List<Trip> trips = [
      Trip(
        title: 'My first travel with my wife and kids',
        date: '08.08.2023 - 30.08.2023',
        image: 'trip1.png',
      ),
      Trip(
        title: 'My second travel with my wife and kids',
        date: '08.08.2023 - 30.08.2023',
        image: 'trip2.png',
      ),
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: trips.length,
        itemBuilder: (BuildContext context, int index) {
          final trip = trips[index];
          return Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: const Color.fromARGB(255, 240, 240, 242),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: SizedBox(
                        width: 70,
                        height: 70,
                        child: AspectRatio(
                          aspectRatio: 2.0,
                          child: Image.asset(
                            trip.image,
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                  
                        children: [
                          Text(
                            trip.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            trip.date,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
    );
  }
}