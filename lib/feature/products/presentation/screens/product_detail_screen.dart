import 'package:ecommerce_spinecode/core%20/constant/color_constant.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_spinecode/feature/products/data/models/produc_models.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductElement product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.mainwhite,
      appBar: AppBar(
        backgroundColor: ColorConstants.mainwhite,
        title: Text(product.title ?? "Product Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 250,
                child: PageView.builder(
                  itemCount: product.images?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Image.network(
                      product.images![index],
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              SizedBox(height: 16),

              Text(
                product.title ?? "",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),

              Text(
                "\$${product.price?.toStringAsFixed(2) ?? ''}",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),

              Text(
                product.availabilityStatus == AvailabilityStatus.IN_STOCK
                    ? "In Stock"
                    : "Low Stock",
                style: TextStyle(
                  fontSize: 16,
                  color:
                      product.availabilityStatus == AvailabilityStatus.IN_STOCK
                      ? Colors.green
                      : Colors.red,
                ),
              ),
              SizedBox(height: 16),

              Text(
                "Description",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(product.description ?? "", style: TextStyle(fontSize: 16)),
              SizedBox(height: 16),

              Row(
                children: [
                  Text(
                    "Category: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    product.category != null
                        ? product.category.toString().split('.').last
                        : "N/A",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Add to Cart Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.green,
                  ),
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
