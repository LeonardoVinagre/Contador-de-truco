import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(app());
}

class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: 'Truco', home: new Truco());
  }
}

class Truco extends StatefulWidget {
  const Truco({Key? key}) : super(key: key);

  @override
  State<Truco> createState() => _TrucoState();
}

class _TrucoState extends State<Truco> {
  Object? teamOne = 0; //valor atual do Radio do time 1
  Object? teamTwo = 0; //valor atual do Radio do time 2
  int truco = 0; // valor de pontos acumulados atual do truco

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        //background color
        body: SingleChildScrollView(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      //Botao de somar pontos do time preto
                      onTap: () => score('teamOne', truco),
                      child: Container(
                        child: SvgPicture.asset(
                          'assets/paus.svg',
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),
                    GestureDetector(
                      //Botao de diminuir pontos do time preto
                      onTap: () => removeScore('teamOne'),
                      child: Container(
                        child: SvgPicture.asset(
                          'assets/espada.svg',
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 120,
                  child: conter(teamOne,
                      1), //Fun????o geradora dos radio button do time preto
                ),
                Column(
                  //Texto central
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'T',
                      style: TextStyle(fontSize: 40),
                    ),
                    Text(
                      "R",
                      style: TextStyle(fontSize: 40),
                    ),
                    Text(
                      "U",
                      style: TextStyle(fontSize: 40),
                    ),
                    Text(
                      "C",
                      style: TextStyle(fontSize: 40),
                    ),
                    Text(
                      "O",
                      style: TextStyle(fontSize: 40),
                    )
                  ],
                ),
                SizedBox(
                  width: 120,
                  child: conter(teamTwo,
                      2), //Fun????o geradora dos radio button do time vermlho
                ),
                Column(
                  children: [
                    GestureDetector(
                      //Bot??o de somar pontos do time vermelho
                      onTap: () => score('teamTwo', truco),
                      child: Container(
                        child: SvgPicture.asset(
                          'assets/copas.svg',
                          color: Colors.red,
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),
                    GestureDetector(
                      //Bot??o de diminuir pontos do time vermelho
                      onTap: () => removeScore('teamTwo'),
                      child: Container(
                        child: SvgPicture.asset(
                          'assets/ouro.svg',
                          color: Colors.red,
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    //Bot??o de incrementar a pontua????o da rodada TRUCO!
                    padding: EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(100, 30)),
                        child: Text('TRUCO!' + '(' + truco.toString() + ')'),
                        onPressed: () {
                          if (teamOne as int >= 11 || teamTwo as int >= 11) {
                            elevenPointsError();
                          } else if (truco == 12) {
                            maxPointError();
                          } else {
                            setState(() {
                              truco = truco + 3;
                            });
                          }
                        })),
                Container(
                  //Bot??o para fugir do TRUCO! e resetar o valor da rodada
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(100, 30)),
                    child: Text('FUGIR!'),
                    onPressed: () {
                      setState(() {
                        truco = 0;
                      });
                    },
                  ),
                )
              ],
            )
          ]),
        ));
  }

  AppBar buildAppBar() { //Barra superior
    return AppBar(
      title: Text('Marcador de truco'),
      backgroundColor: Colors.brown,
      centerTitle: true,
    );
  }

  Padding conter(Object? team, int op) {
    //Retorna o Widget contendo os Radio buttons referente ao time
    var columnn = Column(
      children: [],
    );

    for (var i = 1; i < 12; i++) {
      var radio = RadioListTile(
        dense: true,
        title: Text(i.toString()),
        value: i,
        groupValue: team,
        onChanged: (value) {
          if (op == 1) {
            setState(() {
              teamOne = value;
            });
          } else {
            setState(() {
              teamTwo = value;
            });
          }
        },
      );

      columnn.children.add(radio);
    }

    var padding = Padding(
      padding: EdgeInsets.all(0),
      child: Transform.scale(
        scale: 0.9,
        child: columnn,
      ),
    );
    return padding;
  }

  void score(String team, int point) {
    //Fun????o de pontua????o da rodada
    if (team == 'teamOne') {
      setState(() {
        if (point > 0) {
          teamOne = ((teamOne as int) + point);
        } else {
          teamOne = ((teamOne as int) + 1);
        }
      });
    } else {
      setState(() {
        if (point > 0) {
          teamTwo = ((teamTwo as int) + point);
        } else {
          teamTwo = ((teamTwo as int) + 1);
        }
      });
    }
    checkScore();
    newRound();
  }

  void removeScore(String team) {
    //Fun????o de remo????o de pontos
    if (team == 'teamOne' && teamOne as int > 0) {
      setState(() {
        teamOne = (teamOne as int) - 1;
      });
    } else if (team == 'teamTwo' && teamTwo as int > 0) {
      setState(() {
        teamTwo = (teamTwo as int) - 1;
      });
    }
  }

  void newRound() {
    //Nova rodada da mesma partida o contador de truco ?? zerado
    setState(() {
      truco = 0;
    });
  }

  void checkScore() {
    //Verifica algum vencedor
    if (teamOne as int == 12) {
      winningMessage(1);
      newGame();
    } else if (teamTwo as int == 12) {
      winningMessage(2);
      newGame();
    }
  }

  void winningMessage(int num) {
    //Menssagem para o vencedor da partida
    switch (num) {
      case 1:
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: new Text('Parabens!'),
                content: new Text('Time preto VENCEU!'),
              );
            });
        break;
      case 2:
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: new Text('Parabens!'),
                content: new Text('Time vermelho VENCEU!'),
              );
            });
        break;
    }
  }

  void newGame() {
    //Quando alguem vencer o jogo ?? resetado
    setState(() {
      teamOne = 0;
      teamTwo = 0;
      newRound();
    });
  }

  void elevenPointsError() {
    //Erro de chamar truco na m??o de onze
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('M??O DE ONZE!'),
            content: new Text('N??o pode chamar truco em m??o de onze!'),
          );
        });
  }

  void maxPointError() {
    //Erro de chamar truco alem de 12 pontos
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('Maximo de pontos'),
            content: new Text('Truco n??o pode ultrapassar de 12 pontos!'),
          );
        });
  }
}
