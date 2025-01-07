import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReelsPage extends ConsumerWidget {
  const ReelsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return ReelItem(index: index);
      },
    );
  }
}

class ReelItem extends StatelessWidget {
  final int index;

  const ReelItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          'https://picsum.photos/seed/${index + 200}/400/800',
          fit: BoxFit.cover,
          height: double.infinity,
        ),
        Positioned(
          right: 16,
          bottom: 100,
          child: Column(
            children: [
              IconButton(
                icon: const Icon(Icons.favorite_border, color: Colors.white),
                onPressed: () {},
              ),
              const Text('1.2K', style: TextStyle(color: Colors.white)),
              const SizedBox(height: 16),
              IconButton(
                icon: const Icon(Icons.comment_outlined, color: Colors.white),
                onPressed: () {},
              ),
              const Text('234', style: TextStyle(color: Colors.white)),
              const SizedBox(height: 16),
              IconButton(
                icon: const Icon(Icons.share, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}