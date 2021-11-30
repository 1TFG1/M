
import 'package:flutter/material.dart';
import 'package:medicos_app/page/Vista_detalle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ObjectSquares extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    return Row(
      children: <Widget>[
        
        Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 65)),
        Container(
          
          child: Image.asset(
            'assets/img/splash.jpg',
            width: 150,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        
        FlatButton(
          
            onPressed: () {
              //print('I got clicked');
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Detalle(),
              ));
            },
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: 20.0,
                  height: 10,
                ),
                Text("Dr.Example"),
                SizedBox(
                  width: 20.0,
                  height: 10,
                ),
                Text("ubicacion"),
              ],
            )),
      ],
    );
  }
  
}

class NoteList extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('medicos').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return ListView(
              children: snapshot.data!.docs.map((doc) {
                return Card(
                  child: ListTile(
                    
                    title: Text(doc.data()['title']),
                  ),
                );
              }).toList(),
            );
        },
      ),
    );
  }
}
