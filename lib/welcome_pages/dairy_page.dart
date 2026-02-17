import 'package:flutter/material.dart';
import 'cart_model.dart';

class DairyPage extends StatefulWidget {
  const DairyPage({super.key});

  @override
  State<DairyPage> createState() => _DairyPageState();
}

class _DairyPageState extends State<DairyPage> {
  final List<Map<String, String>> products = [
    {
      'image': 'assets/images/eggs.jpg',
      'name': 'Eggs',
      'price': '₹60',
      'weight': '12 pcs',
      'offer': '10% OFF',
      'mrp': '₹67',
    },
    {
      'image': 'assets/images/tomato.jpg',
      'name': 'Tomato',
      'price': '₹30',
      'weight': '1 kg',
      'offer': '20% OFF',
      'mrp': '₹38',
    },
    {
      'image': 'assets/images/potato.jpg',
      'name': 'Potato',
      'price': '₹25',
      'weight': '1 kg',
      'offer': '15% OFF',
      'mrp': '₹30',
    },
    {
      'image': 'assets/images/onion.jpg',
      'name': 'Onion',
      'price': '₹28',
      'weight': '1 kg',
      'offer': '12% OFF',
      'mrp': '₹32',
    },
    {
      'image': 'assets/images/paneer.jpg',
      'name': 'Paneer',
      'price': '₹80',
      'weight': '200 gm',
      'offer': '8% OFF',
      'mrp': '₹87',
    },
    {
      'image': 'assets/images/milk.jpg',
      'name': 'Milk',
      'price': '₹50',
      'weight': '1 L',
      'offer': '5% OFF',
      'mrp': '₹53',
    },
    {
      'image': 'assets/images/curd.jpg',
      'name': 'Curd',
      'price': '₹40',
      'weight': '500 gm',
      'offer': '7% OFF',
      'mrp': '₹43',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vegetables & Dairy'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.68,
          children: products.map((product) {
            return ProductCard(
              image: product['image']!,
              name: product['name']!,
              price: product['price']!,
              weight: product['weight']!,
              offer: product['offer']!,
              mrp: product['mrp']!,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final String image;
  final String name;
  final String price;
  final String weight;
  final String offer;
  final String mrp;

  const ProductCard({
    required this.image,
    required this.name,
    required this.price,
    required this.weight,
    required this.offer,
    required this.mrp,
    super.key,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool addedToCart = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.07),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Expanded image fills available space above details
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.asset(
                widget.image,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image, size: 60, color: Colors.grey),
              ),
            ),
          ),
          // Weight and Favorite
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text(
                  widget.weight,
                  style: const TextStyle(fontSize: 13, color: Colors.black87),
                ),
                const Spacer(),
                Icon(Icons.favorite_border, color: Colors.grey[400], size: 18),
              ],
            ),
          ),
          const SizedBox(height: 4),
          // Name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.name,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 2),
          // Offer and Price
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text(
                  widget.offer,
                  style: const TextStyle(
                      color: Color(0xFF2ECC71),
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                const SizedBox(width: 8),
                Text(
                  widget.price,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(width: 4),
                Text(
                  widget.mrp,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      decoration: TextDecoration.lineThrough),
                ),
              ],
            ),
          ),
          // Add Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: addedToCart ? Colors.grey[300] : const Color(0xFF2ECC71),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
                onPressed: () {
                  setState(() {
                    addedToCart = !addedToCart;
                  });
                  if (addedToCart) {
                    CartModel().add(CartItem(
                      image: widget.image,
                      name: widget.name,
                      price: widget.price,
                    ));
                  } else {
                    CartModel().remove(CartItem(
                      image: widget.image,
                      name: widget.name,
                      price: widget.price,
                    ));
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        addedToCart ? 'Added to cart!' : 'Removed from cart!',
                      ),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                child: Text(
                  addedToCart ? 'ADDED' : 'ADD',
                  style: TextStyle(
                    color: addedToCart ? Colors.black54 : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
