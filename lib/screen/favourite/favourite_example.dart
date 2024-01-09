import 'package:bloga/provider/favourite_provider.dart';
import 'package:bloga/screen/favourite/myfavourite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteExample extends StatefulWidget {
  const FavouriteExample({super.key});

  @override
  State<FavouriteExample> createState() => _FavouriteExampleState();
}

class _FavouriteExampleState extends State<FavouriteExample> {
  @override
  Widget build(BuildContext context) {
    final favouriteprovider =
        Provider.of<FavourtieProvider>(context, listen: false);
    print('build method');
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyFavouriteExample()));
              },
              icon: Icon(Icons.favorite))
        ],
        title: Text("Favourtie Example"),
      ),
      body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return Consumer<FavourtieProvider>(
                builder: (context, value, child) {
              return ListTile(
                onTap: () {
                  if (value.selectItem.contains(index)) {
                    value.removeItem(index);
                  } else {
                    value.addItem(index);
                  }
                },
                title: Text("item $index"),
                trailing: value.selectItem.contains(index)
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_outline_rounded),
              );
            });
          }),
    );
  }
}
