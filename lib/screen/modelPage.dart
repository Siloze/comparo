import 'package:comparo/class/product.dart';
import 'package:flutter/material.dart';

class ModelPage extends StatefulWidget {
  final Product product;
  
  const ModelPage({super.key, required this.product});

  @override
  State<ModelPage> createState() => _ModelPageState();
}

class _ModelPageState extends State<ModelPage> {
  final Color backgroundColor = Color.fromARGB(255, 50, 47, 47);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            buildImage(),
            buildProductContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildProductInfos(),
                  const SizedBox(height: 100),
                  const Center(child: Text("Autour de vous", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))),
                  const SizedBox(height: 20),
                  buildMap()
                ],
              )
            )
          ],
        )
        )
    );
  }

  Widget buildImage()
  {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("https://picsum.photos/200/300"),
          fit: BoxFit.fill
        )
      ),
    );
  }

  Widget buildProductInfos()
  {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text("${widget.product.price}\$", style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white)),
        Text(widget.product.name, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
        const SizedBox(height: 10),
        const Text("Description", style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
        Text(widget.product.description, style: const TextStyle(fontSize: 15, color: Colors.white)),
      ],
      )
    );
  }

  Widget buildProductContainer({required Widget child})
  {
    return SingleChildScrollView(
      child: Transform.translate(
        offset: Offset(0, -MediaQuery.of(context).size.height * 0.1),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color:  backgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40)
            ),
          ),
          child: Container(padding: EdgeInsets.all(15),  child: child)
          ),
        ),
      );
  }

  Widget buildMap()
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 500,
      decoration: const BoxDecoration(
        color:  Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30)
        ),
      ),
    );
  }
}