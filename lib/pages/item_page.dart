
import 'package:flutter/material.dart';
import '../models/item.dart';

// ignore: must_be_immutable
class ItemDetalhesPage extends StatefulWidget {
  Item item;

  ItemDetalhesPage({super.key, required this.item});

  @override
  State<ItemDetalhesPage> createState() => _ItemDetalhesPageState();
}

class _ItemDetalhesPageState extends State<ItemDetalhesPage> {
  @override
  Widget build(BuildContext context) {
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
          title:const Text('Item da mochila',  style: TextStyle(fontSize: 20,fontFamily: 'Silkscreen',color: Colors.white70,)),
        ),
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 5),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  widget.item.nome, 
                  style: const TextStyle(
                    fontSize: 22,
                    fontFamily: 'Silkscreen',
                    color: Color.fromARGB(255, 219, 178, 27),
                  ),
                ),
              ),
             ),
            SizedBox(
              width: 250,
              height: 250,
              child: Image.asset(widget.item.icone),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
              child: ClipRRect(
                 borderRadius: const BorderRadius.all(Radius.circular(10)),
                 child: Container(
                   decoration: const BoxDecoration(
                   color: Colors.black54,
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(15.0),
                     child: Text(
                       widget.item.descricao, 
                       style: const TextStyle(
                         fontSize: 14,
                         fontFamily: 'Silkscreen',
                         color: Colors.white70,
                       ),
                     ),
                   ),
                 ),
               ),
             ),
          ],
        ),
      )
      ),
    );
  }
}