import 'package:comparo/class/product.dart';
import 'package:comparo/provider/modelList.dart';
import 'package:comparo/screen/modelPage.dart';
import 'package:comparo/widget/cardRow.dart';
import 'package:comparo/widget/productCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double padding = 10;
  bool isSearching = false;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold is a widget that implements the basic material design visual layout structure.
      body: SafeArea( // SafeArea is a widget that insets its child by sufficient padding to avoid intrusions by the operating system. (e.g. the topbar on the iPhone X)
        child : SingleChildScrollView(
        child: Column(
          children: [
            buildTopBar(),
            buildSearchBar(),
            isSearching ? buildModelSearch() : buildContent(),
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
        controller: controller,
        onChanged: (value) {
          setState(() {
            isSearching = value.isNotEmpty;
          });
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          hintText: 'Rechercher...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              controller.clear();
              setState(() {
                isSearching = false;
              });
            },            
          ),
        ),
      ),
    );
  }

  Widget buildModelSearch()
  {
    List<Product> products = Provider.of<ModelListProvider>(context).getModelsFromInput(controller.text);
    return Container(
      padding: EdgeInsets.all(padding),
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
            title: Text(products[index].name, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            leading: Container(
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.width * 0.1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(products[index].image),
                  fit: BoxFit.fill
                ),
                borderRadius: BorderRadius.circular(10)
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ModelPage(product: products[index])),
              );
            },
          );
        },
      )
      );
  }

  Widget buildContent() {

  List<ProductCard> providersCard = Provider.of<ModelListProvider>(context).productList.map((e) => ProductCard(
    name: e.name,
    description: e.description,
    price: e.price,
    image: e.image,
    scale: 0.3,
  )).toList();
  
    return Column(
      children: [
        const ProductCard(
          name: "Tournevice bosh",
          description: "Test",
          price: 0.0,
          image: "https://picsum.photos/200/300",
          widthRatio: 0.8,
          borderRadius: 20,
        ),
        const SizedBox(height: 20),
        CardRow(
          name: "Les plus populaires",
          cards: providersCard,
        ),
        const SizedBox(height: 20),
        CardRow(
          name: "Les plus proches",
          cards: providersCard,
        ),
        const SizedBox(height: 20),
        CardRow(
          name: "Les moins chers",
          cards: providersCard,
        ),
      ]
    );
  }

}