import 'package:flutter/material.dart';
import 'package:flutter_app/store/counter.dart';
import 'package:flutter_app/store/state.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {


    final counter = Provider.of<CounterNotifier>(context);
    final state = Provider.of<StateNotifier>(context);


    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counter.count}',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text("点击"),
              onPressed: () async{
               int a = await counter.getCount();
               print(a);
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          counter.increment();
          print(state.flag);
        },
        tooltip: "increment",
        child: const Icon(Icons.add),
      ),
    );
  }
}