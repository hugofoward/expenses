import 'package:expenses/components/chart.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  // Como é um componente Stateless colocaremos final.
  final String label;
  final double value;
  final double percentage;

  // as chaves são utilizadas para passar parâmetros nomeados.
  ChartBar({
    this.label,
    this.value,
    this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // FittedBox faz com que o texto diminua de tamanho para não quebrar a linha e caber dentro do espaço definido.
        Container(
          height: 20,
          child: FittedBox(
            // toStringAsFixed é utilizado para garantir que terão apenas duas casas após a vírgula.
            child: Text('${value.toStringAsFixed(2)}'),
          ),
        ),
        SizedBox(height: 5),
        Container(
          height: 60,
          width: 10,
          // o stack permite colocar um elemento sobre o outro( um widget sobre o outro)
          child: Stack(
            // alinha todos os elementos no bottom do elemento(widget) Stack
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  color: Color.fromRGBO(220, 200, 220, 1),
                  // deixa a borda circular do box decoration
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                  heightFactor: percentage,
                  child: Container(
                    decoration: BoxDecoration(
                      // recupera a cor a partir do tema
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ))
            ],
          ),
        ),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}
