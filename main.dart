import 'package:flutter/material.dart';
import 'package:untitled33/ProductDetailsPage.dart';


void main() {
  runApp(MyApp());
}

final List<String> ImageContent = [
  'https://static.re-store.ru/upload/resize_cache/iblock/81c/100500_800_140cd750bba9870f18aada2478b24840a/81c9dec4a635089a852179fec11c8c4e.jpg',
  'https://static.re-store.ru/upload/resize_cache/iblock/de9/100500_800_140cd750bba9870f18aada2478b24840a/de95c2cd619ee8c849b14717d9074110.jpg',
  'https://static.re-store.ru/upload/resize_cache/iblock/dbb/100500_800_140cd750bba9870f18aada2478b24840a/rgg3oswbof2f1i4ox1x7ociautmnyzu2.jpg',
  'https://static.re-store.ru/upload/resize_cache/iblock/571/100500_800_140cd750bba9870f18aada2478b24840a/y3bk2sn2r9f6vgj5uxothtp3qgbeenlu.png',
  'https://static.re-store.ru/upload/resize_cache/iblock/d76/100500_800_140cd750bba9870f18aada2478b24840a/d7687c4047344a6ebd92a158b08ea272.jpg',
];

final List<String> TextContent = [
  'iPhone 13 Mini',
  'AirPods Max',
  'Apple Watch Ultra 2 GPS + Cellular',
  'MacBook Air 15',
  'iPad Pro (2022)',
];

final List<double> PriceContent = [79990, 74990, 119990, 189990, 103990,];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('DOV1HSOP'),
          backgroundColor: Colors.purple,
        ),
        backgroundColor: Colors.deepPurple,
        body: ProductGrid(),
      ),
    );
  }
}


class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      children: List.generate(ImageContent.length, (index) {
        return ProductCard(
          imageUrl: ImageContent[index],
          productName: TextContent[index],
          ProductPrice: PriceContent[index],
        );
      }),
    );
  }
}


class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final double ProductPrice;

  ProductCard({required this.imageUrl, required this.productName, required this.ProductPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children:[
            Image.network(
              imageUrl,
              width: 75,
              height: 75,
            ),
            Text('\₽${ProductPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(productName),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsPage(
                      ImageContent: imageUrl,
                      TextContent: productName,
                    ),
                  ),
                );
              },
              child: Text('Купить'),
            )
          ],
        ),
      ),
    );
  }
}


// class ProductDetailsPage extends StatelessWidget{
//   final String ImageContent;
//   final String TextContent;
//
//   ProductDetailsPage({required this.ImageContent, required this.TextContent});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(TextContent),
//       ),
//       body: Column(
//         children: [
//           Image.network(ImageContent
