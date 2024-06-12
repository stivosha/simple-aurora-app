import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/domain/deal.dart';
import 'package:todo/presentation/pages/addDealPage.dart';

import '../../data/repository.dart';
import '../ui/todoCard.dart';
import 'dart:convert';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Repository repository = Repository();
  List data = [];

  @override
  void initState() {
    super.initState();
    _loadDeals();
  }

  void _loadDeals() async {
    List<Deal> items = await repository.getDeals();
    setState(() {
      data = items;
    });
  }

  void _saveDeals() async {
    repository.saveDeals(data);
  }

  void _addDeal() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddHabitPage(),
      ),
    ).then((value) {
      if ((value != null) && (value is Deal)) {
        setState(() {
          data.add(value);
          _saveDeals();
        });
      }
    });
  }

  void _editDeal(index, deal) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddHabitPage(deal: deal),
      ),
    ).then((value) {
      if ((value != null) && (value is Deal)) {
        setState(() {
          data[index] = value;
          _saveDeals();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoCard(
            title: data[index].title,
            description: data[index].description,
            onDelete: () {
              setState(() {
                data.removeAt(index);
                _saveDeals();
              });
            },
            onTap: () {
              _editDeal(index, data[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addDeal,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
