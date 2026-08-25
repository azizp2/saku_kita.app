// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class WalletDetailPage extends GetView<WalletDetailController> {
//   const WalletDetailPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF8FAF9),

//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         surfaceTintColor: Colors.white,
//         elevation: 0,

//         leading: IconButton(
//           onPressed: Get.back,
//           icon: const Icon(
//             Icons.arrow_back_ios_new,
//             size: 20,
//             color: Color(0xFF202522),
//           ),
//         ),

//         title: Obx(
//           () => Text(
//             controller.walletName.value,
//             style: const TextStyle(
//               color: Color(0xFF202522),
//               fontSize: 20,
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//         ),

//         actions: [
//           IconButton(
//             onPressed: () {
//               Get.bottomSheet(
//                 WalletMenuSheet(
//                   onEdit: controller.editWallet,
//                   onDelete: controller.deleteWallet,
//                 ),
//               );
//             },
//             icon: const Icon(Icons.more_vert, color: Color(0xFF202522)),
//           ),
//         ],
//       ),

//       body: ListView(
//         padding: const EdgeInsets.fromLTRB(20, 12, 20, 100),
//         children: [
//           WalletDetailBalance(controller: controller),

//           const SizedBox(height: 24),

//           const Text(
//             'Ringkasan Bulan Ini',
//             style: TextStyle(
//               fontSize: 17,
//               fontWeight: FontWeight.w700,
//               color: Color(0xFF202522),
//             ),
//           ),

//           const SizedBox(height: 12),

//           _buildSummary(),

//           const SizedBox(height: 28),

//           _buildTransactionHeader(),

//           const SizedBox(height: 8),

//           _buildTransactionSection(
//             title: 'Hari ini',
//             transactions: _todayTransactions,
//           ),

//           const SizedBox(height: 20),

//           _buildTransactionSection(
//             title: 'Kemarin',
//             transactions: _yesterdayTransactions,
//           ),
//         ],
//       ),

//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: controller.addTransaction,
//         backgroundColor: const Color(0xFF20A98E),
//         foregroundColor: Colors.white,
//         elevation: 3,
//         icon: const Icon(Icons.add),
//         label: const Text(
//           'Transaksi',
//           style: TextStyle(fontWeight: FontWeight.w600),
//         ),
//       ),
//     );
//   }

//   Widget _buildSummary() {
//     return Row(
//       children: [
//         Expanded(
//           child: WalletSummaryCard(
//             title: 'Pemasukan',
//             amount: 5000000,
//             icon: Icons.arrow_downward_rounded,
//             iconColor: const Color(0xFF20A98E),
//             backgroundColor: const Color(0xFFE7F8F3),
//           ),
//         ),

//         const SizedBox(width: 12),

//         Expanded(
//           child: WalletSummaryCard(
//             title: 'Pengeluaran',
//             amount: 300000,
//             icon: Icons.arrow_upward_rounded,
//             iconColor: const Color(0xFFE86F55),
//             backgroundColor: const Color(0xFFFFEEEA),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildTransactionHeader() {
//     return Row(
//       children: [
//         const Expanded(
//           child: Text(
//             'Transaksi',
//             style: TextStyle(
//               fontSize: 17,
//               fontWeight: FontWeight.w700,
//               color: Color(0xFF202522),
//             ),
//           ),
//         ),

//         TextButton(
//           onPressed: controller.showAllTransactions,
//           child: const Text(
//             'Lihat semua',
//             style: TextStyle(
//               color: Color(0xFF20A98E),
//               fontSize: 13,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildTransactionSection({
//     required String title,
//     required List<WalletTransactionData> transactions,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(
//             color: Color(0xFF858B88),
//             fontSize: 13,
//             fontWeight: FontWeight.w600,
//           ),
//         ),

//         const SizedBox(height: 8),

//         Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Column(
//             children: transactions
//                 .map((transaction) => WalletTransactionItem(data: transaction))
//                 .toList(),
//           ),
//         ),
//       ],
//     );
//   }
// }

// final List<WalletTransactionData> _todayTransactions = [
//   WalletTransactionData(
//     title: 'Belanja Bulanan',
//     category: 'Kebutuhan Rumah',
//     amount: -150000,
//     time: '10:32',
//     icon: Icons.shopping_cart_outlined,
//     iconColor: Color(0xFFFF8B5A),
//     iconBackground: Color(0xFFFFEEE8),
//   ),
//   WalletTransactionData(
//     title: 'Makan Siang',
//     category: 'Makanan',
//     amount: -50000,
//     time: '13:15',
//     icon: Icons.restaurant_outlined,
//     iconColor: Color(0xFFE6A23C),
//     iconBackground: Color(0xFFFFF5DF),
//   ),
// ];

// final List<WalletTransactionData> _yesterdayTransactions = [
//   WalletTransactionData(
//     title: 'Isi Bensin',
//     category: 'Transportasi',
//     amount: -100000,
//     time: '18:20',
//     icon: Icons.local_gas_station_outlined,
//     iconColor: Color(0xFF5C8DFF),
//     iconBackground: Color(0xFFEAF0FF),
//   ),
//   WalletTransactionData(
//     title: 'Gaji',
//     category: 'Pendapatan',
//     amount: 5000000,
//     time: '08:00',
//     icon: Icons.account_balance_wallet_outlined,
//     iconColor: Color(0xFF20A98E),
//     iconBackground: Color(0xFFE7F8F3),
//   ),
// ];
