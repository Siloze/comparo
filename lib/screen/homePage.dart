import 'package:comparo/widget/cardRow.dart';
import 'package:comparo/widget/productCard.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double padding = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold is a widget that implements the basic material design visual layout structure.
      body: SafeArea( // SafeArea is a widget that insets its child by sufficient padding to avoid intrusions by the operating system. (e.g. the topbar on the iPhone X)
        child : SingleChildScrollView(
        child: Column(
          children: [
            buildTopBar(),
            buildSearchBar(),
            buildContent(),
          ],
        )
      )
      )
    );
  }

  Widget buildTopBar() { 
    return Container(
      padding: EdgeInsets.only(left: padding, right: padding, bottom: padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Aligns the children along the main axis (horizontally in this case). (e.g. the children have the available space between them.)
        children: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {},
          ),
          const Text("Comparo", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      )
    );
  }

  Widget buildSearchBar() {
    return Container(
      padding: EdgeInsets.all(padding),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          hintText: 'Rechercher...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: const Icon(Icons.filter_alt),
            onPressed: () {},            
          ),
        ),
      ),
    );
  }

  Widget buildContent() {

  List<ProductCard> providersCard = [];

  for (int i = 0; i < 5; i++)
  {
    providersCard.add(
      const ProductCard(
        name: "Test",
        description: "Test",
        price: 0.0,
        image: "https://picsum.photos/200/300",
        scale: 0.5,
        borderRadius: 8,
      )
    );
  }
    return Column(
      children: [ 
        const ProductCard(
          name: "Test",
          description: "Test",
          price: 0.0,
          image: "https://picsum.photos/200/300",
        ),
        const SizedBox(height: 30),
        CardRow(
          name: "Fournisseurs",
          cards: providersCard,
          height: MediaQuery.of(context).size.height * 0.3,
        ),
        const SizedBox(height: 30),
        CardRow(
          name: "Produits",
          cards: providersCard,
          height: MediaQuery.of(context).size.height * 0.3,
        ),
      ]
    );
  }

}