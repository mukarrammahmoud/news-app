import 'package:flutter/material.dart';

class ComponentsBottomSheet extends StatelessWidget {
  const ComponentsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: const BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            child: Icon(Icons.facebook_outlined),
          ),
          CircleAvatar(
            child: Icon(Icons.bluetooth),
          ),
          CircleAvatar(
            child: Icon(Icons.wifi),
          ),
        ],
      ),
    );
  }
}
