import 'package:flutter/material.dart';
import 'package:uncanny_woods/pages/item_page.dart';
import 'package:uncanny_woods/repository/item_repository.dart';
import 'package:uncanny_woods/models/item.dart';
import 'package:provider/provider.dart';
import 'package:uncanny_woods/configs/app_settings.dart';

// ignore: use_key_in_widget_constructors
class BackpackPage extends StatefulWidget {
  @override
  State<BackpackPage> createState() => _BackpackPageState();
}

class _BackpackPageState extends State<BackpackPage> {
  late Map<String,int> sec;
  var controller = ItemRepository();
  final int _highScore = 5;


  readNumberFormat(){
    sec = context.watch<AppSetings>().locale;
  }

  mostrarDetalhes(Item item){
    Navigator.push(
      context, MaterialPageRoute(
        builder: (_) => ItemDetalhesPage(item: item),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    readNumberFormat();
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/fundo_mascara.png'
          ),
            fit: BoxFit.cover,
        ),
      ),
    child: Scaffold(
      appBar: AppBar(
        iconTheme:const IconThemeData(color: Color.fromARGB(255, 219, 178, 27)),
        backgroundColor: Colors.black54,
        title: const Text('Mochila', style: TextStyle(fontSize: 20,fontFamily: 'Silkscreen',color: Colors.white70,)),
      ),
      backgroundColor: Colors.transparent,
      body: ListView.separated(
        itemCount: _highScore, 
        itemBuilder: (BuildContext contexto, int i){
          final item = controller.item;
          return Container(
            height: 100,
            color: Colors.black45,
            child: Center(
              child: ListTile(
                leading: Image.asset(item[i].icone, width: 60,),
                title: Text(
                  item[i].nome, 
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Silkscreen',
                    color: Colors.white70,
                  ),
                ),
                trailing: Text(
                  item[i].nivel.toString(), 
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Silkscreen',
                    color: Colors.white70,
                  ),
                ),
              onTap: () => mostrarDetalhes(item[i]),
              ),
            ),
          );
        }, 
          separatorBuilder: (_, __) => const Divider(),
          padding: const EdgeInsets.all(12), 
        ),
      ),
    );
  }
}