import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn_2/module/new_data.dart';
import 'package:provider_learn_2/module/newscard.dart';

class StoriesPage extends StatelessWidget {
  const StoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<NewsData>().fetchData;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Stories -CBS News'),
        elevation: 0,
        backgroundColor: Colors.orange[700],
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: Center(
          child: Consumer<NewsData>(
            builder: (context, value, child) {
              return value.map.isEmpty && !value.error
                  ? const CircularProgressIndicator()
                  : value.error
                      ? Text(
                          'Oops Something went wrong. ${value.errormessage}',
                          textAlign: TextAlign.center,
                        )
                      : ListView.builder(
                          itemCount: value.map['stories'].length,
                          itemBuilder: (context, index) {
                            return NewsCard(
                              map: value.map['stories'][index],
                            );
                          },
                        );
            },
          ),
        ),
      ),
    );
  }
}
