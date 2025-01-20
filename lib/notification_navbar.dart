import 'package:flutter/material.dart';

class notification_nav extends StatelessWidget{
  var page = '0';

  final List<Map<String, String>> data1 =  [
    {
      'ids': '1',
      'dept': 'TCF-IB',
      'flag' : '0',
    },
    {
      'ids': '2',
      'dept': 'TCF-2C',
      'flag' : '0',
    },
    {
      'ids': '3',
      'dept': 'CMS',
      'flag' : '0',
    },
    {
      'ids': '4',
      'dept': 'SCM',
      'flag' : '0',
    },
    {
      'ids': '5',
      'dept': 'CMS-FRAME',
      'flag' : '0',
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('notifications'
        ),
      ),
      body:  ListView.builder(
        itemCount: data1.length,
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
                        Text('${index+1}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      )
                  ),
                 /* Container(
                    if('${data1['flag']}'=='0') {
                      print("hello");
                   }
                  ), */
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${data1[index]['dept']}',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      //Text('email'),
                    ],
                  )
                ],
              ),
            ),
          );
        } ,
      )
    );
  }
}