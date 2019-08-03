import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../bloc/contact_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ContactList extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),home: new MyContactList(title: "CONTACTS"),
    );
  }
}

class MyContactList extends StatefulWidget {
   MyContactList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyContactListState createState() => new _MyContactListState();
}     

class _MyContactListState extends State<MyContactList> {

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllContact();
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: Text('CONTACTS'),
      ),

      floatingActionButton: new FloatingActionButton(
          onPressed: null,
          backgroundColor: Colors.blue,
          //if you set mini to true then it will make your floating button small
          mini: false,
          child: new Icon(Icons.add),
      ),

      body: StreamBuilder(
        stream: bloc.allContact,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.data.length,

        itemBuilder: (BuildContext context, int index) {
          return new Slidable(
            actionPane: new SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            child: new Container(
              height: 85,
              child: Row(children: <Widget>[  
                Image.network(snapshot.data.data[index].avatar),
                Expanded(
                    child: Column (
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(snapshot.data.data[index].first_name+' '+snapshot.data.data[index].last_name,
                          textAlign: TextAlign.center),
                        Text(snapshot.data.data[index].email),
                ],),),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                  size: 30.0,
                )
              ],)
            ),
            secondaryActions: <Widget>[
              new IconSlideAction(
                //caption: 'Phone',
                color: Colors.blue,
                icon: Icons.phone,
                onTap: () => null,
              ),
              new IconSlideAction(
                //caption: 'Message',
                color: Colors.indigo,
                icon: Icons.message,
                onTap: () => null,
              ),
            ],
          );
        });
  }
}
