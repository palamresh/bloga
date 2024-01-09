import 'package:bloga/provider/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyFavouriteExample extends StatefulWidget {
  const MyFavouriteExample({super.key});

  @override
  State<MyFavouriteExample> createState() => _MyFavouriteExampleState();
}

class _MyFavouriteExampleState extends State<MyFavouriteExample> {
  @override
  Widget build(BuildContext context) {
    final favouriteprovider =
        Provider.of<FavourtieProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('SelectItem Here'),
      ),
      body: ListView.builder(
          itemCount: favouriteprovider.selectItem.length,
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
