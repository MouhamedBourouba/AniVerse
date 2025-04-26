import 'package:flutter/material.dart';

class AnimeSearchPage extends StatelessWidget {
  const AnimeSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: 'Search...', // no verticly centered
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {},
            ),
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.search),
            ),
            title: Text('Search Result ${index + 1}'),
            subtitle: Text('Description for result ${index + 1}'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          );
        },
      ),
    );
  }
}
