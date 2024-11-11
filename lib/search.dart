import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.tealAccent.shade400.withOpacity(0.0),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 32, right: 32),
            child: SearchBar(
              backgroundColor:
                  MaterialStatePropertyAll(Colors.tealAccent.shade400),
              hintText: 'Search here',
              textStyle: MaterialStatePropertyAll(TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary)),
            ),
          ),
        ),
      ),
    );
  }
}
