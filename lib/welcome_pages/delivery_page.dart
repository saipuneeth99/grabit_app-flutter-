import 'package:flutter/material.dart';

class DeliveryPage extends StatelessWidget {
  const DeliveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const SizedBox(height: 16),
            const Text(
              'Order on the Way!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            // Status
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _StatusRow(
                  icon: Icons.check_circle,
                  color: Color(0xFF2ECC71),
                  text: 'Order Confirmed',
                  isDone: true,
                ),
                _DashedLine(),
                _StatusRow(
                  icon: Icons.check_circle,
                  color: Color(0xFF2ECC71),
                  text: 'Packed',
                  isDone: true,
                ),
                _DashedLine(),
                _StatusRow(
                  icon: Icons.radio_button_checked,
                  color: Color(0xFF2ECC71),
                  text: 'Out for Delivery',
                  isDone: true,
                ),
                _DashedLine(),
                Row(
                  children: const [
                    Icon(Icons.access_time, color: Colors.grey, size: 22),
                    SizedBox(width: 8),
                    Text(
                      'Arriving in: ',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    Text(
                      '15 mins',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 28),
            // Delivery Person
            Row(
              children: [
                const CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage('assets/images/delivery_boy.png'), // Replace with your asset
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Ravi Kumar',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        SizedBox(width: 4),
                        Text('4.8', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                OutlinedButton(
                  onPressed: () {},
                  child: Text('Call'),
                ),
                SizedBox(width: 8),
                OutlinedButton(
                  onPressed: () {},
                  child: Text('Message'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Map Placeholder
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/map_placeholder.png', // Replace with your map asset
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),
            // Address
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  Icon(Icons.person, size: 32, color: Colors.black54),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'sai puneeth',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '23, 4th Cross Road,\nRajaji Nagar, Bengaluru',
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ],
                    ),
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

class _StatusRow extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final bool isDone;
  const _StatusRow({
    required this.icon,
    required this.color,
    required this.text,
    required this.isDone,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 22),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: isDone ? Colors.black : Colors.black54,
            fontWeight: isDone ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

class _DashedLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      margin: const EdgeInsets.only(left: 10),
      child: Row(
        children: List.generate(
          10,
          (index) => Expanded(
            child: Container(
              height: 2,
              color: index.isEven ? Colors.grey[300] : Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}