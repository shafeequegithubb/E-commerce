import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_spinecode/feature/products/data/models/card_model.dart';
import 'package:flutter/widgets.dart';

class CartServices with ChangeNotifier {
  Future<void> addCard(CartItem cart) async {
    await FirebaseFirestore.instance.collection("cart").add(cart.toMap());
  }
}
