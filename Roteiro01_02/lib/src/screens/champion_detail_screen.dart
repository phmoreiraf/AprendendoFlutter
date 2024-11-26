import 'package:flutter/material.dart';
import '../models/champion_model.dart';

class ChampionDetailScreen extends StatelessWidget {
  final Champion champion;
  ChampionDetailScreen({required this.champion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(champion.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                champion.imageUrl,
                width: 150,
                height: 150,
              ),
            ),
            SizedBox(height: 16),
            Text(
              champion.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Descrição:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              champion.blurb,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
