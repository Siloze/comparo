import 'package:comparo/class/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String name;
  final String description;
  final double price;
  final String image;
  final double scale;
  final double widthRatio;
  final double borderRadius;
  const ProductCard({super.key, this.name = "default", this.description = "default", this.price = 0.0, this.image = "", this.scale = 1.0, this.widthRatio = 0.8, this.borderRadius = 15});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  double width = 0;
  double height = 0;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height * (widget.scale / 2);
    width = height * widget.widthRatio;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
        child: buildStack()
    );
  }

  Widget buildStack() {
    return Stack(
      alignment: Alignment.center,
      children: [
        buildGradient(),
        buildContent(),
      ],
    );
  }

  Widget buildGradient() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.8),
          ],
        ),
      ),
    );
  }

  Widget buildContent() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          buildPrice(),
          buildName(),
          const SizedBox(height: 10),
          buildButtonRow(),
        ],
      )
    );
  }

  Widget buildName() {
    return Text(
      widget.name,
      style: TextStyle(
        color: Colors.white,
        fontSize: widget.scale * 15,
        fontWeight: FontWeight.bold
      ),
    );
  }


  Widget buildPrice() {
    return Text(
      widget.price.toString() + "€",
      style: TextStyle(
        color: Colors.white,
        fontSize: 25 * widget.scale,
        fontWeight: FontWeight.bold
      ),
    );
  }

  Widget buildButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildButton("Je fonce", Colors.purple,() {}, Icons.favorite),
        buildButton("WishList",Colors.black, () {}, Icons.favorite_border),
      ],
    );
  }

  Widget buildButton(String text, Color color, Function() onPressed, IconData icon) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Text(text, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15 * widget.scale)),
          Icon(icon, color: Colors.white, size: 15 * widget.scale),
        ],
      ),
    );
  }
}