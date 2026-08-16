import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../controllers/financial_goal_controller.dart';

class FinancialGoalCard extends StatelessWidget {
  final FinancialGoalModel goal;
  final FinancialGoalController controller;
  final VoidCallback? onTap;

  const FinancialGoalCard({
    super.key,
    required this.goal,
    required this.controller,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFF0F1F2)),
          boxShadow: const [
            BoxShadow(
              color: Color(0x08000000),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _GoalIcon(goal: goal),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          goal.title,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            color: AppColors.text,
                          ),
                        ),
                      ),

                      const SizedBox(width: 8),

                      Text(
                        '${goal.percentage}%',
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF4B5563),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  Text(
                    '${controller.formatCurrency(goal.collected)} / ${controller.formatCurrency(goal.target)}',
                    style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF6B7280),
                    ),
                  ),

                  const SizedBox(height: 7),

                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: goal.progress,
                            minHeight: 6,
                            backgroundColor: const Color(0xFFE8EBEC),
                            color: AppColors.primary,
                          ),
                        ),
                      ),

                      const SizedBox(width: 14),

                      SizedBox(
                        width: 20,
                        child: Text(
                          '${goal.percentage}%',
                          style: const TextStyle(
                            fontSize: 9,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  Text(
                    'Target: ${controller.formatDate(goal.targetDate)}',
                    style: const TextStyle(
                      fontSize: 9,
                      color: Color(0xFF9CA3AF),
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

class _GoalIcon extends StatelessWidget {
  final FinancialGoalModel goal;

  const _GoalIcon({required this.goal});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46,
      height: 46,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: goal.color.withValues(alpha: 0.10),
        shape: BoxShape.circle,
      ),
      child: Icon(goal.icon, size: 27, color: goal.color),
    );
  }
}
