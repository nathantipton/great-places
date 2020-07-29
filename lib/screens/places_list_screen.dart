import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Your Places'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, AddPlaceScreen.routeName);
              },
            ),
          ],
        ),
        body: Consumer<GreatPlaces>(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  children: [
                    Text('No places yet...'),
                    FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            AddPlaceScreen.routeName,
                          );
                        },
                        child: Text(
                          'Add a place',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 14),
                        ))
                  ],
                ),
              ),
            ],
          ),
          builder: (ctx, greatPlaces, child) => greatPlaces.items.length <= 0
              ? child
              : ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                FileImage(greatPlaces.items[index].image),
                          ),
                          title: Text(
                            greatPlaces.items[index].title,
                          ),
                          onTap: () {},
                        ),
                        Divider(),
                      ],
                    );
                  },
                  itemCount: greatPlaces.items.length,
                ),
        ),
      ),
    );
  }
}
