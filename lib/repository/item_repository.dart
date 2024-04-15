import 'package:uncanny_woods/models/item.dart';

class ItemRepository {
  final List<Item> _item = [];

 get item => _item;

  
  ItemRepository(){
    _item.addAll([
      Item(
        icone: 'assets/nota_icone.png', 
        nome: 'Pequena nota', 
        descricao: 'Uma pequena nota que estava em seu bolso assim que acordou, é difícil ler o que está escrito pelo dano que o papel sofreu mas você consegue ler vagamente a frase "...cuidado com a escuridão da floresta, não os deixe ver o teu rosto pois o conh..i .."',
        nivel: 0,
      ),
      Item(
        icone: 'assets/quebrada_icone.png', 
        nome: 'Máscara quebrada', 
        descricao: 'Resquícios de uma máscara estilhaçada, durante todo o caminho percorido você encontrou diversas máscaras quebradas pelo chão mas, estranhamente, você não se questiona o porque.',
        nivel: 3,
      ),
      Item(
        icone: 'assets/cracha_icone.png', 
        nome: 'Cracha de trabalho', 
        descricao: '"Esse é.... o meu crachá?". O seu crachá do seu primeiro trabalho, ao ver isso você não sabe o que mais te intriga, se é o porque de você encontrar isto aqui ou de como você saiu sorrindo na foto de um lugar tão ruim pra você.',
        nivel: 6,
      ),
      Item(
        icone: 'assets/pendente_icone.png', 
        nome: 'Pendente esquecido', 
        descricao: 'O pendente de uma pessoa que você nutri o sentimento mais puro de amor, carinho e saudades. Mesmo não conseguindo lembrar quem é essa pessoa, você sente o seu corpo pesar com uma sensação nostálgica. Isso te fortalece...',
        nivel: 9,
      ),
      Item(
        icone: 'assets/boneco_icone.png', 
        nome: 'Boneco antigo', 
        descricao: 'Um boneco de pelúcia antigo e muito surrado, seus olhos pretos de botão refletem a quase não existencia de luz dentro da floresta. Estranhamente você não se sente mais sozinho.',
        nivel: 12,
      ),
    ]
    );
  }
}