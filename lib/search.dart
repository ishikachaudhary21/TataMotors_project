import 'package:flutter/material.dart';
import 'package:tatamotors/API_services.dart';
import 'UserModel.dart';
class SearchUser extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () {
        query = "";
      },
        icon: Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {
      Navigator.pop(context);
    },
      icon: Icon(Icons.arrow_back),
    );
  }

  FetchUser _userList = FetchUser();

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Userlist>>(
          future: _userList.getUserList(query: query),
          builder: (context, snapshot) {
            var data = snapshot.data;
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: data?.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Row(
                      children: [
                        Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child:
                              Text('${data?[index].id}', style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),),
                            )
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${data?[index].name}',
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            Text('${data?[index].email}'),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('search user'),
    );
  }
}