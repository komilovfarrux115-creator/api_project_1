import 'package:flutter/material.dart';
import 'package:networking_request/model/post_model.dart';
import 'package:networking_request/service/networking_service.dart';

import 'model/todos/todos_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TodosModel> items = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    apiPostList();
  }

  void apiPostList() async {
    setState(() {
      isLoading = true;
    });
    var response = await NetworkingService.GET(
      NetworkingService.API_POSTS,
      NetworkingService.paramsEmpty(),
    );
    if (response != null) {
      setState(() {
        isLoading = false;

        items = NetworkingService.parsePostList(response);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (ctx, index) {
                return Card(
                  child: ListTile(
                    leading: Text(
                      "${index + 1}",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    title: Text(
                      items[index].title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
