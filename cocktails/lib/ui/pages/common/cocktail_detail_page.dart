// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cocktails/services/services.dart';
import 'package:flutter/material.dart';

import 'package:cocktails/models/cocktail.dart';

class CocktailDetailPage extends StatefulWidget {
  final Cocktail cocktail;
  const CocktailDetailPage({super.key, required this.cocktail});

  @override
  State<CocktailDetailPage> createState() => _CocktailDetailPageState();
}

class _CocktailDetailPageState extends State<CocktailDetailPage>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.cocktail.name!),
          centerTitle: true,
        ),
        body: FutureBuilder<Cocktail>(
          future: CocktailServices().fetchCocktailById(widget.cocktail.id!),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            Cocktail cocktail = snapshot.data!;
            return SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Image.network(cocktail.urlImage!),
                  ),
                  Column(
                    children: [
                      Text(
                        "Category:",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        cocktail.category!,
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  instructions(cocktail),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget instructions(Cocktail cocktail) {
    return Column(
      children: [
        Text(
          "Instructions:",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.90,
          child: Card(
            child: Column(
              children: [
                TabBar(
                  controller: _controller,
                  tabs: [
                    Tab(text: 'EN'),
                    Tab(text: 'DE'),
                    Tab(text: 'IT'),
                  ],
                ),
                SizedBox(
                  height: 90,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TabBarView(
                      controller: _controller,
                      children: <Widget>[
                        Center(
                          child: Text(
                            cocktail.instructionsEN!,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Center(
                          child: Text(
                            cocktail.instructionsDE!,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Center(
                          child: Text(
                            cocktail.instructionsIT!,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
