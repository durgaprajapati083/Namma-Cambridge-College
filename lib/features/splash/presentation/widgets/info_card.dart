import 'package:flutter/material.dart';

import 'glass_container.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? mainText;
  final String? footerText;
  final String? actionButtonText;
  final IconData icon;
  final String imagePath;

  const InfoCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.imagePath,
    this.mainText,
    this.footerText,
    this.actionButtonText,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: Colors.blue[900]),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Color(0xFF1A237E),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          Text(
            subtitle,
            style: const TextStyle(fontSize: 10, color: Colors.blueAccent),
          ),

          const SizedBox(height: 10),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  imagePath,
                  width: 45,
                  height: 60,
                  fit: BoxFit.cover,

                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 45,
                    height: 60,
                    color: Colors.blue.shade50,
                    child: const Icon(
                      Icons.book,
                      size: 20,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (mainText != null)
                      Text(
                        mainText!,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    const SizedBox(height: 4),
                    if (footerText != null)
                      Text(
                        footerText!,
                        style: const TextStyle(
                          fontSize: 9,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),

          if (actionButtonText != null)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5C79FF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      actionButtonText!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
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
