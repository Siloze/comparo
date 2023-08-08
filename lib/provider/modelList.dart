import 'package:comparo/class/product.dart';
import 'package:flutter/material.dart';

class ModelListProvider extends ChangeNotifier {
  List<Product> modelList = [];
  List<Product> get productList => modelList;

  ModelListProvider()
  {
    modelList.add(Product(name: "Tournevice bosh", description: "Test", price: 0.0, image: "https://picsum.photos/200/300"));
    modelList.add(Product(name: "Vice jul 3mn", description: "Test2", price: 1.0, image: "https://picsum.photos/100/300"));
    modelList.add(Product(name: "Montre avec bracelet cuir", description: "Test3", price: 2.0, image: "https://picsum.photos/300/300"));
    modelList.add(Product(name: "ecrou en verre 2mn", description: "Test4", price: 3.0, image: "https://picsum.photos/200/200"));
    modelList.add(Product(name: "voiture toute cassé", description: "Test5", price: 4.0, image: "https://picsum.photos/200/100"));
  }

  void addModel(Product product) {
    modelList.add(product);
    notifyListeners();
  }

  Product getModel(int index) {
    return modelList[index];
  }

  List<Product> getModelsFromInput(String input) {
    List<Product> products = [];
    List<String> inputList = input.split(" ");

    for (Product product in modelList) {
      for (String input in inputList) {
        if (input.isNotEmpty && product.name.toLowerCase().contains(input.toLowerCase())) {
          if (!products.contains(product))
          {
            products.add(product);
          }
        }
      }
    }
    return products;
  }


}
