import 'package:admin_app_new/models/quickQuote_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../appColors.dart';
import '../../controller/admin_quotes_controller.dart';
import '../add_quotation_companyUser.dart';
import '../quote_pdf_view.dart';
import '../unfied_map.dart';

class QuickQuoteAdmin extends StatefulWidget {
  const QuickQuoteAdmin({super.key});

  @override
  State<QuickQuoteAdmin> createState() => _QuickQuoteAdminState();
}

class _QuickQuoteAdminState extends State<QuickQuoteAdmin> {
  final AdminQuotesController controller = Get.find<AdminQuotesController>();

  @override
  Widget build(BuildContext context) {

    return RefreshIndicator(
      onRefresh: () async{
        controller.getQuickQuote();
        controller.getSurveyQuote();
      },
      child: Column(
        children: [
          // All Quotes Tab
          Obx(() {
            if(controller.isLoading.value){
              return Expanded(child: Center(child: CircularProgressIndicator(color: AppColors.primaryBlue,)));
            }
            return controller.quickQuoteList.isEmpty
                ? Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.receipt,
                            size: 80,
                            color: AppColors.lightGrey,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No quotes yet',
                            style: TextStyle(fontSize: 18, color: AppColors.grey),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Tap the + button to add your first quote',
                            style: TextStyle(fontSize: 12, color: AppColors.grey),
                          ),
                        ],
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(12),
                      itemCount: controller.quickQuoteList.length,
                      itemBuilder: (context, index) {
                        final quote = controller.quickQuoteList[index];
                        return _buildQuoteCard(quote, false);
                      },
                    ),
                  );
          }),
        ],
      ),
    );
  }

  Widget _buildQuoteCard(QuickQuoteModel quote, bool isSurveyQuote) {
    return Stack(
      children: [
        Card(
          margin: const EdgeInsets.all(8),
          color: AppColors.white,
          surfaceTintColor: AppColors.white,
          shadowColor: AppColors.shadowGrey,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: AppColors.dividerGrey, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: InkWell(
              onTap: () {
              Get.to(()=>AddQuoteScreen(quoteId: quote.id,));
              },
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: AppColors.secondaryOrange
                                .withOpacity(0.15),
                            child: Icon(
                              Icons.solar_power,
                              size: 35,
                              color: AppColors.secondaryOrange,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    quote.name,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryBlue,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    quote.phoneNumber,
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 15),
                            if (quote.grandTotal != 0)
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 28,
                                      backgroundColor: AppColors.veryLightGrey,
                                      child: Image.network(
                                          quote.panelBrandImage,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Icon(Icons.broken_image,color: Colors.grey,);
                                        },
                                      )
                                    ),
                                     // the quick
                                     Positioned(
                                      left: 50,
                                      child: CircleAvatar(
                                        radius: 28,
                                        backgroundColor: AppColors.grey,
                                        child: Image.network(
                                          quote.inverterBrandImage,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Icon(Icons.broken_image,color: Colors.grey,);
                                          },
                                        )
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Quotation Number: #${quote.quoteNumber}",
                          style: const TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                            color: AppColors.grey,
                          ),
                        ),

                        Text(
                          quote.kitType,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Added: ${quote.createdAt}",
                        style: const TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                          color: AppColors.grey,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.secondaryOrange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '${quote.kilowatt} KW | ${quote.numberOfSolarPanel} Panels',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: AppColors.secondaryOrange,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Padding(
                    padding: EdgeInsets.only(top: 12, bottom: 12),
                    child: Divider(),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "Total Quote Amount",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: AppColors.darkGrey,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // _showQuoteDetailsDialog(context, quote);
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(0, 0),
                            ),
                            child: const Text(
                              "View Details",
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryBlue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "₹${quote.grandTotal}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.successGreen,
                            ),
                          ),
                          // agreement and order button
                          ElevatedButton(
                            onPressed: () {
                              if(!quote.agreementCompleted){
                                // agreement dialo
                                _showAgreementDialog(context,quote);

                              }else{
                                controller.createOrder(quote.id);

                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              foregroundColor: AppColors.white,
                              backgroundColor: AppColors.primaryBlue,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                            ),
                            child:  Text(
                              !quote.agreementCompleted ? 'Agreement' : 'Order',
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 5,
          child: PopupMenuButton<String>(
            color: AppColors.white,
            icon: const Icon(
              Icons.more_horiz_rounded,
              color: AppColors.black87,
            ),
            itemBuilder: (BuildContext context) {
              List<Map<String, String>> choices = [
                {"text": "Delete", "icon": "delete"},
                {"text": "View Quote", "icon": "visibility"},
              ];

              // if (isSurveyQuote) {
              //   choices.add({"text": "Edit Survey", "icon": "survey"});
              // }
              // if (true) {
              //   choices.add({"text": "Agreement", "icon": "agreement"});
              // }
              return choices.map((Map<String, String> choice) {
                IconData iconData;
                switch (choice["icon"]) {
                  case "delete":
                    iconData = Icons.delete_outline;
                    break;
                  case "visibility":
                    iconData = Icons.visibility_outlined;
                    break;
                  case "survey":
                    iconData = Icons.article_outlined;
                    break;
                  case "agreement":
                    iconData = Icons.assignment;
                    break;
                  default:
                    iconData = Icons.info_outline;
                }
                return PopupMenuItem<String>(
                  height: 38,
                  value: choice["text"],
                  child: Row(
                    children: [
                      Icon(
                        iconData,
                        size: 16,
                        color: AppColors.secondaryOrange,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        choice["text"]!,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkGrey,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList();
            },
            onSelected: (String choice) {
              if (choice == "Delete") {
              showDeleteQuotationDialog(context, quote.id);
              } else if (choice == "View Quote") {
                // quote pdf
                Get.to(()=>QuoteViewScreen(quoteNumber: quote.name,webUrl: quote.webViewUrl,pdfUrl: quote.pdfDownloadUrl,));

              } else if (choice == "Edit Survey") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UnifiedSurveyScreen(willQuote: 'no'),
                  ),
                );
              } else if (choice == "Agreement") {
                // agreement dialog
                // _showAgreementFirstDialog(context, quote);
              }
            },
          ),
        ),
      ],
    );
  }


  void _showAgreementDialog(BuildContext context, QuickQuoteModel quote) {
    bool isAgreed = false;
    WebViewController? webViewController;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.92,
                height: MediaQuery.of(context).size.height * 0.8,
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Title
                    const Text(
                      'Agreement',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // agreement webview
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: WebViewWidget(
                          controller: webViewController ??= WebViewController()
                            ..setJavaScriptMode(JavaScriptMode.unrestricted)
                            ..loadRequest(Uri.parse(quote.agreementUrl)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Checkbox + Verify button
                    Row(
                      children: [
                        Checkbox(
                          value: isAgreed,
                          onChanged: (value) => setState(() => isAgreed = value ?? false),
                          activeColor: AppColors.primaryBlue,
                        ),
                        const Expanded(
                          child: Text(
                            'I agree with this agreement',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: isAgreed
                              ? () async{
                            // Close current dialog and open OTP dialog
                            bool isValid =  await  controller.quotationAgreement(quote.id);
                            Navigator.pop(context);

                            if(isValid){
                              /// TODO : showOtpDialog
                              _showOtpDialog(context, quote);
                            }


                          }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryBlue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('Verify'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }


  void _showOtpDialog(BuildContext context, QuickQuoteModel quote) {
    List<TextEditingController> otpControllers = List.generate(6, (_) => TextEditingController());
    List<FocusNode> otpFocusNodes = List.generate(6, (_) => FocusNode());
    bool isOtpVerified = false;
    String otp = '';

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              title: const Text(
                'OTP Verification',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryBlue,
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Enter the 6‑digit OTP sent to ${quote.phoneNumber}',
                    style: const TextStyle(fontSize: 13, color: AppColors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  // 6 OTP text fields
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(6, (index) {
                      return Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: SizedBox(
                            width: 45,
                            height: 55,
                            child: TextFormField(
                              controller: otpControllers[index],
                              focusNode: otpFocusNodes[index],
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                counterText: '',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: AppColors.lightGrey,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                    color: AppColors.primaryBlue,
                                    width: 2,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                              ),
                              onChanged: (value) {
                                // Auto-focus next field
                                if (value.isNotEmpty && index < 5) {
                                  FocusScope.of(context).requestFocus(
                                    otpFocusNodes[index + 1],
                                  );
                                } else if (value.isEmpty && index > 0) {
                                  FocusScope.of(context).requestFocus(
                                    otpFocusNodes[index - 1],
                                  );
                                }
                                // Check if all 6 digits are filled
                                otp = otpControllers.map((c) => c.text).join();
                                if (otp.length == 6) {
                                  setState(() {
                                    isOtpVerified = true;
                                  });
                                } else {
                                  setState(() {
                                    isOtpVerified = false;
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 16),
                  // Resend OTP
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't receive OTP? ",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.grey,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('OTP resent successfully!'),
                              backgroundColor: AppColors.successGreen,
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(0, 0),
                        ),
                        child: Text(
                          'Resend OTP',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: AppColors.grey),
                  ),
                ),
                ElevatedButton(
                  onPressed: isOtpVerified
                      ? () async{
                    Navigator.pop(context);
                    await controller.quotationAgreementVerifyOtp(quote.id,otp);

                  }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Verify OTP'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> showDeleteQuotationDialog(BuildContext context,String quoteId) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.red, size: 28),
              SizedBox(width: 12),
              Text(
                'Delete Quotation',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: const Text(
            'Are you sure you want to delete this quotation?\n\nThis action cannot be undone.',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey.shade700,
              ),
              child: const Text('CANCEL', style: TextStyle(fontSize: 14)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
                controller.deleteQuote(quoteId);

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('DELETE', style: TextStyle(fontSize: 14)),
            ),
          ],
        );
      },
    );
  }

  void _showAgreementFirstDialog(
    BuildContext context,
    Map<String, dynamic> quote,
  ) {
    bool isAgreed = false;
    bool showOtp = false;
    bool isOtpVerified = false;
    List<TextEditingController> otpControllers = List.generate(
      6,
      (index) => TextEditingController(),
    );
    List<FocusNode> otpFocusNodes = List.generate(6, (index) => FocusNode());

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.all(24),
              child: !showOtp
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.assignment,
                                  color: AppColors.primaryBlue,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Admin Agreement',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black87,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(
                                Icons.close,
                                color: AppColors.darkGrey,
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(height: 16),

                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.veryLightGrey,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.dividerGrey),
                          ),
                          child: Column(
                            children: [
                              _buildDetailRow(
                                'Customer',
                                quote['customerName'],
                              ),
                              _buildDetailRow('Quote Number', quote['quoteNo']),
                              _buildDetailRow(
                                'System Size',
                                '${quote['kw']} KW',
                              ),
                              _buildDetailRow(
                                'Total Amount',
                                '₹${quote['grandTotal']}',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.dividerGrey),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Terms & Conditions',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black87,
                                ),
                              ),
                              const SizedBox(height: 12),
                              _buildAgreementItem(
                                '1.',
                                'Order will be confirmed within 24 hours.',
                              ),
                              _buildAgreementItem(
                                '2.',
                                'Installation will be completed within 15 days.',
                              ),
                              _buildAgreementItem(
                                '3.',
                                'Payment terms: 30% advance, 70% on completion.',
                              ),
                              _buildAgreementItem(
                                '4.',
                                'Warranty: 5 years on panels, 2 years on inverter.',
                              ),
                              _buildAgreementItem(
                                '5.',
                                'Terms and conditions apply as per company policy.',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        Row(
                          children: [
                            Checkbox(
                              value: isAgreed,
                              onChanged: (value) =>
                                  setState(() => isAgreed = value ?? false),
                              activeColor: AppColors.primaryBlue,
                            ),
                            Expanded(
                              child: Text(
                                'I have read and agree to the terms and conditions',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: isAgreed
                                      ? AppColors.primaryBlue
                                      : AppColors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: isAgreed
                                ? () {
                                    setState(() {
                                      showOtp = true;
                                    });
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryBlue,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              disabledBackgroundColor: AppColors.lightGrey,
                            ),
                            child: const Text(
                              'Next',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.security,
                                  color: AppColors.primaryBlue,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Admin Verification',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black87,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(
                                Icons.close,
                                color: AppColors.darkGrey,
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(height: 16),

                        Text(
                          'Enter OTP sent to ${quote['mobile']}',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(6, (index) {
                            return Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                child: SizedBox(
                                  width: 45,
                                  height: 55,
                                  child: TextFormField(
                                    controller: otpControllers[index],
                                    focusNode: otpFocusNodes[index],
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    maxLength: 1,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    decoration: InputDecoration(
                                      counterText: '',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                          color: AppColors.lightGrey,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                          color: AppColors.primaryBlue,
                                          width: 2,
                                        ),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            vertical: 12,
                                          ),
                                    ),
                                    onChanged: (value) {
                                      if (value.isNotEmpty && index < 5) {
                                        FocusScope.of(context).requestFocus(
                                          otpFocusNodes[index + 1],
                                        );
                                      } else if (value.isEmpty && index > 0) {
                                        FocusScope.of(context).requestFocus(
                                          otpFocusNodes[index - 1],
                                        );
                                      }

                                      String otp = otpControllers
                                          .map((c) => c.text)
                                          .join();
                                      if (otp.length == 6) {
                                        setState(() {
                                          isOtpVerified = true;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 16),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Didn't receive OTP? ",
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.grey,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('OTP resent successfully!'),
                                    backgroundColor: AppColors.successGreen,
                                  ),
                                );
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(0, 0),
                              ),
                              child: Text(
                                'Resend OTP',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryBlue,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: isOtpVerified
                                ? () {
                                    setState(() {
                                      quote['agreementCompleted'] = true;
                                    });
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Agreement signed successfully!',
                                        ),
                                        backgroundColor: AppColors.successGreen,
                                      ),
                                    );
                                    setState(() {});
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryBlue,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              disabledBackgroundColor: AppColors.lightGrey,
                            ),
                            child: const Text(
                              'Verify & Sign',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAgreementItem(String number, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 22,
            child: Text(
              number,
              style: const TextStyle(fontSize: 11, color: AppColors.darkGrey),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.darkGrey,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: AppColors.grey),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.black87,
            ),
          ),
        ],
      ),
    );
  }



  void _showEditQuoteDialog(BuildContext context, Map<String, dynamic> quote) {
    final TextEditingController customerController = TextEditingController(
      text: quote['customer'],
    );
    final TextEditingController amountController = TextEditingController(
      text: quote['amount'],
    );

    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Edit Quote',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryBlue,
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField(
                customerController,
                'Customer Name',
                Icons.business,
              ),
              const SizedBox(height: 12),
              _buildTextField(
                amountController,
                'Amount (₹)',
                Icons.currency_rupee,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: AppColors.dividerGrey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: AppColors.darkGrey),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          quote['customer'] = customerController.text;
                          quote['amount'] = amountController.text;
                          quote['grandTotal'] = amountController.text;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Quote updated successfully!'),
                            backgroundColor: AppColors.successGreen,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Update Quote'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon,
  ) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: AppColors.grey),
        prefixIcon: Icon(icon, color: AppColors.primaryBlue),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.lightGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primaryBlue),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
      ),
    );
  }
}
