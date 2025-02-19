import 'package:flutter/material.dart';
import 'package:money_mate/constant/constant.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: SizeApp.h36,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.email),
          Gap.w12,
          Expanded(
            // Menggunakan Expanded agar TextField mengisi sisa ruang
            child: TextField(
              decoration: InputDecoration(
                border:
                    InputBorder.none, // Menghilangkan border bawaan TextField
                isDense: true, // Mengurangi padding default
              ),
            ),
          ),
        ],
      ),
    );
  }
}
