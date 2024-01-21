import 'package:flutter/material.dart';

class FAQsScreen extends StatefulWidget {
  const FAQsScreen({super.key});

  @override
  State<FAQsScreen> createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  bool _customTileExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FAQs')),
      body: ListView(
        children: [
          ExpansionTile(
            title: const Text('ExpansionTile 2'),
            subtitle: const Text('Custom expansion arrow icon'),
            trailing: Icon(Icons.arrow_drop_down_circle),
            children: const <Widget>[
              ListTile(title: Text('This is tile number 2')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
          ),
          ExpansionTile(
            title: const Text('ExpansionTile 2'),
            subtitle: const Text('Custom expansion arrow icon'),
            trailing: Icon(Icons.arrow_drop_down_circle),
            children: const <Widget>[
              ListTile(title: Text('This is tile number 2')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
          ),
          ExpansionTile(
            title: const Text('ExpansionTile 2'),
            subtitle: const Text('Custom expansion arrow icon'),
            trailing: Icon(Icons.arrow_drop_down_circle),
            children: const <Widget>[
              ListTile(title: Text('This is tile number 2')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
          ),
          ExpansionTile(
            title: const Text('ExpansionTile 2'),
            subtitle: const Text('Custom expansion arrow icon'),
            trailing: Icon(Icons.arrow_drop_down_circle),
            children: const <Widget>[
              ListTile(title: Text('This is tile number 2')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
          ),
          ExpansionTile(
            title: const Text('ExpansionTile 2'),
            subtitle: const Text('Custom expansion arrow icon'),
            trailing: Icon(Icons.arrow_drop_down_circle),
            children: const <Widget>[
              ListTile(title: Text('This is tile number 2')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
          ),
          ExpansionTile(
            title: const Text('ExpansionTile 2'),
            subtitle: const Text('Custom expansion arrow icon'),
            trailing: Icon(Icons.arrow_drop_down_circle),
            children: const <Widget>[
              ListTile(title: Text('This is tile number 2')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
          ),
          ExpansionTile(
            title: const Text('ExpansionTile 2'),
            subtitle: const Text('Custom expansion arrow icon'),
            trailing: Icon(Icons.arrow_drop_down_circle),
            children: const <Widget>[
              ListTile(title: Text('This is tile number 2')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
          ),
          ExpansionTile(
            title: const Text('ExpansionTile 2'),
            subtitle: const Text('Custom expansion arrow icon'),
            trailing: Icon(Icons.arrow_drop_down_circle),
            children: const <Widget>[
              ListTile(title: Text('This is tile number 2')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
          ),
          ExpansionTile(
            title: const Text('ExpansionTile 2'),
            subtitle: const Text('Custom expansion arrow icon'),
            trailing: Icon(Icons.arrow_drop_down_circle),
            children: const <Widget>[
              ListTile(title: Text('This is tile number 2')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
          ),
          ExpansionTile(
            title: const Text('ExpansionTile 2'),
            subtitle: const Text('Custom expansion arrow icon'),
            trailing: Icon(Icons.arrow_drop_down_circle),
            children: const <Widget>[
              ListTile(title: Text('This is tile number 2')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
          ),
          ExpansionTile(
            title: const Text('ExpansionTile 2'),
            subtitle: const Text('Custom expansion arrow icon'),
            trailing: Icon(Icons.arrow_drop_down_circle),
            children: const <Widget>[
              ListTile(title: Text('This is tile number 2')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
          ),
          ExpansionTile(
            title: const Text('ExpansionTile 2'),
            subtitle: const Text('Custom expansion arrow icon'),
            trailing: Icon(Icons.arrow_drop_down_circle),
            children: const <Widget>[
              ListTile(title: Text('This is tile number 2')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
          ),
          ExpansionTile(
            title: const Text('ExpansionTile 2'),
            subtitle: const Text('Custom expansion arrow icon'),
            trailing: Icon(Icons.arrow_drop_down_circle),
            children: const <Widget>[
              ListTile(title: Text('This is tile number 2')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
          ),
        ],
      ),
    );
  }
}
