import 'package:flutter/material.dart';
import 'cart_model.dart';

class SnacksPage extends StatefulWidget {
  const SnacksPage({super.key});

  @override
  State<SnacksPage> createState() => _SnacksPageState();
}

class _SnacksPageState extends State<SnacksPage> {
  final List<Map<String, String>> products = [
    {
      'image': 'assets/images/lays.jpg',
      'name': 'Lays',
      'price': '₹49',
    },
    {
      'image': 'assets/images/biscuit.jpg',
      'name': 'Biscuit',
      'price': '₹30',
    },
    {
      'image': 'assets/images/chocolate.jpg',
      'name': 'Chocolate',
      'price': '₹60',
    },
    {
      'image': 'assets/images/kurkure.png',
      'name': 'Kurkure',
      'price': '₹35',
    },
    {
      'image': 'assets/images/crax.png',
      'name': 'Crax',
      'price': '₹25',
    },
    {
      'image': 'assets/images/haldirams.jpg',
      'name': 'Haldiram',
      'price': '₹40',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snacks'),
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
            return SnacksProductCard(
              image: product['image']!,
              name: product['name']!,
              price: product['price']!,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class SnacksProductCard extends StatefulWidget {
  final String image;
  final String price;
  final String name;
  const SnacksProductCard({
    required this.image,
    required this.price,
    required this.name,
    super.key,
  });

  @override
  State<SnacksProductCard> createState() => _SnacksProductCardState();
}

class _SnacksProductCardState extends State<SnacksProductCard> {
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
          // Expanded image fills available space
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
          // Name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Text(
              widget.name,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // Price (moved below image and name)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.price,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2ECC71),
              ),
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
