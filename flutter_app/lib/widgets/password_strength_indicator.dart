import 'package:flutter/material.dart';
class PasswordStrengthIndicator extends StatelessWidget {
  final String password;

  const PasswordStrengthIndicator({
    super.key,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    if (password.isEmpty) {
      return const SizedBox.shrink();
    }
    // Calculate password strength
    int strength = 0;
  
    // Firebase requirements
    if (password.length >= 6) {
      strength++;
    }
    
    // Additional recommendations for strong passwords
    if (password.contains(RegExp(r'[A-Z]'))) {
      strength++;
    }
    
    if (password.contains(RegExp(r'[a-z]'))) {
      strength++;
    }
    
    if (password.contains(RegExp(r'[0-9]'))) {
      strength++;
    }
    
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      strength++;
    }
    
    // Determine color and label
    Color strengthColor;
    String strengthLabel;
    
    if (strength <= 1) {
      strengthColor = Colors.red;
      strengthLabel = 'Weak';
    } else if (strength <= 3) {
      strengthColor = Colors.orange;
      strengthLabel = 'Fair';
    } else if (strength <= 4) {
      strengthColor = Colors.yellow.shade700;
      strengthLabel = 'Good';
    } else {
      strengthColor = Colors.green;
      strengthLabel = 'Strong';
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Strength bar
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: strength / 5,
            backgroundColor: Colors.grey.shade300,
            valueColor: AlwaysStoppedAnimation<Color>(strengthColor),
            minHeight: 6,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          strengthLabel,
          style: TextStyle(
            color: strengthColor,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

// const SizedBox(height: 8),
//   // Requirements checklist
//   ...requirements.entries.map((entry) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 4),
//       child: Row(
//         children: [
//           Icon(
//             entry.value ? Icons.check_circle : Icons.cancel,
//             size: 16,
//             color: entry.value ? Colors.green : Colors.grey,
//           ),
//           const SizedBox(width: 4),
//           Text(
//             entry.key,
//             style: TextStyle(
//               fontSize: 12,
//               color: entry.value ? Colors.green : Colors.grey,
//             ),
//           ),
//         ],
//       ),
//     );
//   }).toList(),
