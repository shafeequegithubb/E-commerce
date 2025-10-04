import 'package:flutter/material.dart';

class product_card extends StatelessWidget {
  final String productName;
  final String productDescription;
  final double price;
  final String imageUrl;
  final void Function()? onTap;

  const product_card({
    super.key,
    required this.productName,
    required this.productDescription,
    required this.price,
    required this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey.shade500),
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade100,
        ),
        margin: EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
                color: Colors.grey.shade200,
              ),
              height: 80,
              width: 80,
            ),
            SizedBox(width: 20),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: 5),

                  Text(
                    productDescription,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14),
                  ),

                  SizedBox(height: 5),

                  Text(
                    "Price: \$${price.toStringAsFixed(2)}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
