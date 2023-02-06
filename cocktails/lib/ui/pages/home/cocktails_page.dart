// ignore_for_file: prefer_const_constructors

import 'package:cocktails/models/models.dart';
import 'package:cocktails/services/cocktail_services.dart';
import 'package:cocktails/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CocktailsPage extends StatefulWidget {
  const CocktailsPage({super.key});

  @override
  State<CocktailsPage> createState() => _CocktailsPageState();
}

class _CocktailsPageState extends State<CocktailsPage> {
  String _search = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //!Search
          Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Buscar...',
                  ),
                  onChanged: (val) {
                    setState(() {
                      _search = val;
                    });
                  },
                ),
              ),
            ),
          ),
          //!Lista
          Expanded(
            child: FutureBuilder<List<Cocktail>>(
              future: CocktailServices().fetchCocktailsByName(_search),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Cocktail cocktail = snapshot.data![index];
                    if (_search.isEmpty ||
                        cocktail.name!
                            .toLowerCase()
                            .contains(_search.toLowerCase())) {
                      return CocktailListItem(
                        cocktail: cocktail,
                      );
                    }
                    return SizedBox.shrink();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
