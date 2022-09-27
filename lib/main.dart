import 'package:flutter/material.dart';
import "package:english_words/english_words.dart";
import 'package:untitled/widgets/inputDemo.dart';
import 'package:untitled/widgets/layout.dart';
import 'package:untitled/widgets/product.dart';
import 'package:untitled/widgets/router.dart';
// void main()=> runApp(const MyApp());
void main()=> runApp(
  MaterialApp(
    home: Scaffold(
      body: ContainerDemo(),
    ) ,
  )
);


class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fultte App",
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home:  const RandomWords(),
    );
  }
}

//RandowWordsState类，该类持有RandomWOrds Widget的状态
class RandomWordsState extends State<RandomWords>{
  //列表保存单词对
  final _suggestions = <WordPair>[];
  //变量来增大字体大小
  final _biggerFont = const TextStyle(fontSize: 18.0);

  final _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar:  AppBar(
       title: const Text('Startup Name Generator'),
       actions: <Widget>[
          IconButton(onPressed: _pushSaved, icon:  const Icon(Icons.list))
       ],
     ),
     body: _buildSuggestions(),
   );
  }


  void _pushSaved() {
    Navigator.of(context).push(
       MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map((pair) => ListTile(
            title: Text(
              pair.asPascalCase,
              style: _biggerFont,
            ),
          ));
          final divided = ListTile.divideTiles(context: context, tiles: tiles).toList();
          return  Scaffold(
            appBar:  AppBar(
              title: Text("saved Suggestions"),
            ),
            body:  ListView(children: divided)
          );
        },
      )
    );
  }
  
  Widget _buildSuggestions() {
    return  ListView.builder(
      padding: const EdgeInsets.all(16.0),
      //对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile中
      itemBuilder: (context, i ) {
        //在每一列之前添加一个1像素高的风格先 divider
        if(i.isOdd) return const Divider();

        final index = i ~/ 2;
        if(index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      }
    );
  }

  Widget _buildRow(WordPair pair) {
    //检查pair是否在_saved收藏夹中
    final alreadySaved = _saved.contains(pair);
    return  ListTile(
      title:  Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      //icon
      trailing:  Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if(alreadySaved) {
            _saved.remove(pair);
          }else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}

//有状态的RandowWords widget, RandowWords widget 除了创建State类之外没有其他任何东西
class RandomWords extends StatefulWidget{
  const RandomWords({super.key});

  @override
  State<StatefulWidget> createState() {
    return  RandomWordsState();
  }
}