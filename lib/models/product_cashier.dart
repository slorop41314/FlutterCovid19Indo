import 'package:flutter/material.dart';

class ProductCashier {
  final String productName;
  final double productPrice;
  final bool productManagement;
  final double productStock;

  ProductCashier({
    @required this.productManagement,
    @required this.productPrice,
    @required this.productName,
    @required this.productStock,
  });
}
