import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern_example/bloc_provider.dart';
import 'package:flutter_bloc_pattern_example/increment_bloc.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Streams Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<IncrementBloc>(
        bloc: IncrementBloc(),
        child: CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IncrementBloc bloc = BlocProvider.of<IncrementBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Flutter BLoC Pattern Demo')),
      body: Center(
        child: StreamBuilder<int>(
          stream: bloc.outCounter,
          initialData: 0,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Text('You hit me: ${snapshot.data} times');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          bloc.incrementCounter.add(null);
        },
      ),
    );
  }
}
