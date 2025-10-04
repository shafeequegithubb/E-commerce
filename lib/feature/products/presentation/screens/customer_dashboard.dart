import 'package:ecommerce_spinecode/core%20/constant/color_constant.dart';
import 'package:ecommerce_spinecode/feature/products/domain/api_services/api_services.dart';
import 'package:ecommerce_spinecode/feature/products/presentation/screens/product_detail_screen.dart';
import 'package:ecommerce_spinecode/feature/products/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerDashboard extends StatefulWidget {
  const CustomerDashboard({super.key});

  @override
  State<CustomerDashboard> createState() => _CustomerDashboardState();
}

class _CustomerDashboardState extends State<CustomerDashboard> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ApiServices>().fetchData();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final apiServices = context.watch<ApiServices>();
    return Scaffold(
      backgroundColor: ColorConstants.mainwhite,
      appBar: AppBar(
        backgroundColor: ColorConstants.primerygreen,
        centerTitle: true,
        title: Text(
          "Spine Cart",
          style: TextStyle(
            color: ColorConstants.mainwhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(apiServices.products?.products?.length ?? 0, (
                index,
              ) {
                final product = apiServices.products!.products![index];
                return product_card(
                  productName: product.title ?? "unknnow tilte",
                  productDescription: product.description ?? "unknowndesc",
                  price: product.price ?? 0,
                  imageUrl: product.thumbnail ?? "",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailScreen(product: product),
                      ),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
