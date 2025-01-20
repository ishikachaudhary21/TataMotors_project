import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tatamotors/API_services.dart';
import 'package:tatamotors/UserModel.dart';
import 'package:tatamotors/search.dart';
import 'NavBar.dart';

void main() async {
 /* WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); */
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}): super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}): super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
FetchUser _userList = FetchUser();


  @override
  Widget build(BuildContext context) {
    var arrNames = ['RBT-TBC', 'CMS', 'PAINT SHOP', 'SUPPLY QUALITY'];
    
    return SafeArea(
      child: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: Text('Tata Motors'),
          centerTitle: true,
          actions: <Widget>[
            /*IconButton(
              icon: const Icon(Icons.menu),
              onPressed: (){},
            ),*/
            IconButton(onPressed: (){
              showSearch(
                context: context,
                delegate: SearchUser(),
              );
            },
              icon: Icon(Icons.search),
            ),
          ],
          backgroundColor: Colors.blue,
        ),
        body: Container(
          child: FutureBuilder<List<Userlist>>(
            future: _userList.getUserList(),
            builder: (context, snapshot) {
               var data = snapshot.data;
               if(!snapshot.hasData){
                 return Center(
                   child: CircularProgressIndicator(),
                 );
               }
              return ListView.builder(
                itemCount: data?.length,
                itemBuilder: (context, index){
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
                              Text('${data?[index].id}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
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
                } ,
              );
            }
          ),
        )
        /*
          ListView.separated(itemBuilder: (context, index) {
          return ListTile(
            leading: Text('${index+1}'),
            title: Text(arrNames[index]),
            trailing: Icon(Icons.circle_outlined),
          );
        },
          itemCount: arrNames.length,
          separatorBuilder: (context, index){
            return Divider(height: 20, thickness: 1,);
          },
        ), */
      ),
    );
  }
}

/* class CustomSearchDelegate extends SearchDelegate{
  List<String> searchTerms = [
    'tata',
    'motors',
    'cms',
    'tcf',
    'supply management',
    'quality',
    'maintenance',
    'repair',
    'water',
    'plant',
    'drainage',
    'production',
    'monitoring',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: (){
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      close(context, null);
    },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for(var items in searchTerms){
      if (items.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(items);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
        itemBuilder: (context, index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
    },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for(var items in searchTerms){
      if (items.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(items);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
  
}
*/