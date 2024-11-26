import 'package:flutter/material.dart';

import '../models/champion_model.dart';
import '../services/api_service.dart';
import '../widgets/search_bar.dart' as custom;
import 'champion_detail_screen.dart';

class ChampionListScreen extends StatefulWidget {
  @override
  _ChampionListScreenState createState() => _ChampionListScreenState();
}

class _ChampionListScreenState extends State<ChampionListScreen> {
  late Future<List<Champion>> futureChampions;
  final ApiService apiService = ApiService();
  List<Champion> _filteredChampions = [];
  List<Champion> _allChampions = [];

  @override
  void initState() {
    super.initState();
    futureChampions = apiService.fetchChampions();
    futureChampions.then((champions) {
      setState(() {
        _allChampions = champions;
        _filteredChampions = champions;
      });
    });
  }

  void _filterChampions(String text) {
    setState(() {
      _filteredChampions = _allChampions
          .where((champion) =>
              champion.name.toLowerCase().contains(text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Campeões')),
      body: Column(
        children: [
          custom.SearchBar(onChanged: _filterChampions, hintText: 'Buscar Campeão...'),
          Expanded(
            child: FutureBuilder<List<Champion>>(
              future: futureChampions,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Erro: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Nenhum campeão disponível'));
                } else {
                  return ListView.builder(
                    itemCount: _filteredChampions.length,
                    itemBuilder: (context, index) {
                      final champion = _filteredChampions[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(champion.imageUrl),
                        ),
                        title: Text(champion.name),
                        subtitle: Text(champion.title),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ChampionDetailScreen(champion: champion),
                            ),
                          );
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
