import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/material.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/global/widgets/text_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../provider/payment_provider.dart';


class PurchaseHistory extends StatefulWidget {
  static const String id = "/purchaseHistory";
  const PurchaseHistory({Key? key}) : super(key: key);

  @override
  State<PurchaseHistory> createState() => _PurchaseHistoryState();
}

class _PurchaseHistoryState extends State<PurchaseHistory> {
  //final List<GlobalKey> printKey = [GlobalKey()];
  List<GlobalKey> printKey = List<GlobalKey>.generate(100, (index) => GlobalKey(debugLabel: 'key_$index'),growable: false);
  final doc = pw.Document();



  // ========== Funtion() for widget to pdf ============
  void _printScreen(int index) {
    Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
      final doc = pw.Document();

      final image = await WidgetWraper.fromKey(
        key: printKey[index],
        pixelRatio: 2.0,
      );

      doc.addPage(pw.Page(
          pageFormat: format,
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Expanded(
                child: pw.Image(image),
              ),
            );
          }));

      return doc.save();
    });
  }
  //!=========================

  @override
  void initState() {
    super.initState();
    
    Provider.of<PaymentProvider>(context, listen: false).paymentHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: dashboardAppBar(context, getTranslated("purchase_history", context),),
      body: Consumer<PaymentProvider>(builder: (context, paymentProvider, child) {
        return paymentProvider.paymentHistoryModel.data?.paymentDetails != null && paymentProvider.paymentHistoryModel.data!.paymentDetails!.isNotEmpty 
        ? ListView.builder(
          itemCount: paymentProvider.paymentHistoryModel.data?.paymentDetails?.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: RepaintBoundary(
                key: printKey[index],
                child: Container(
                  height: 290.h,
                  padding: EdgeInsets.all(8.sp),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Images.invoiceBg),
                      filterQuality: FilterQuality.high,
                      opacity: 2,
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 25.h),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          getTranslated("one-on-one-coaching-session", context),
                          style: TextStyles.normalBoldTextStyle(context),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(getTranslated("payment_amount", context)),
                          Text(paymentProvider.paymentHistoryModel.data?.paymentDetails?[index].amount ?? '0')
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(getTranslated("payment_date", context)),
                          Text(paymentProvider.paymentHistoryModel.data?.paymentDetails?[index].createdAt ?? '')
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(getTranslated("payment_method", context)),
                          Flexible(child: Text(paymentProvider.paymentHistoryModel.data?.paymentDetails?[index].paymentMethod ?? ''))
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(getTranslated("confirmation_no", context)),
                          Text(paymentProvider.paymentHistoryModel.data?.paymentDetails?[index].transactionId ?? '')
                        ],
                      ),
                      SizedBox(height: 35.h),
                      Align(
                        alignment: Alignment.center,
                        child: TextBtn(
                          title: getTranslated("download_invoice", context),
                          onPressed: () {
                            _printScreen(index);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ) : Card(child: SizedBox(height: 150.h, child: const Center(child: Text("No data found"))));
      
      },
      ),
    );
  }
}
