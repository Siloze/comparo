import 'package:comparo/widget/productCard.dart';
import 'package:flutter/material.dart';

class CardRow extends StatefulWidget {
  final List<ProductCard> cards;
  final String name;
  final double height;
  final double padding;
  final double distanceBetweenCards = 10;
  const CardRow({super.key, this.name = "default", this.cards = const [], this.height = 200, this.padding = 5});

  @override
  State<CardRow> createState() => _CardRowState();
}

class _CardRowState extends State<CardRow> {
  @override
  Widget build(BuildContext context) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildName(),
        SizedBox(height: widget.padding),
        SizedBox(
          height: widget.height,
          child: buildList()
        )
      ],
    );
  }

  Widget buildList()
  {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.cards.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(left: index != 0 ? widget.distanceBetweenCards : 0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            padding: EdgeInsets.all(widget.padding),
            child: widget.cards[index],
          )
        );
      },
    );
  }

  Widget buildName()
  {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        widget.name,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.grey[800]
        ),
      ),
    );
  }

  
}