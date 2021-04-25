import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/TodOProvider.dart';
import 'package:todoapp/views/addDataWidget.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    Provider.of<TodoProvider>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => addData(context),
        ),
        appBar: new AppBar(
          title: Text("TodoApp"),
          centerTitle: true,
        ),
        body: Container(
          child: Consumer<TodoProvider>(
            builder: (context, model, _) => FutureBuilder(
              builder: (context, snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemBuilder: (context, index) => ListTile(
                            onTap: () {
                              updateDataWidget(
                                context,
                                model.todoData[index]['_id'],
                              );
                            },
                            onLongPress: () {
                              print(model.todoData[index]['_id']);
                              model.deleteData(model.todoData[index]['_id']);
                            },
                            title: model.todoData[index]['title'] != null
                                ? Text(model.todoData[index]['title'])
                                : Text("data"),
                            subtitle: model.todoData[index]['title'] != null
                                ? Text(model.todoData[index]['description'])
                                : Text("data"),
                          ),
                          itemCount: model.todoData.length,
                        ),
              future: model.fetchData(),
            ),
          ),
        ),
      ),
    );
  }
}
