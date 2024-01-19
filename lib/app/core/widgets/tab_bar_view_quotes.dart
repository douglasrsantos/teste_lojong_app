import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_lojong/app/core/ui/app_colors.dart';
import 'package:teste_lojong/app/core/ui/app_fonts.dart';
import 'package:teste_lojong/app/core/widgets/error_data_or_network_widget.dart';
import 'package:teste_lojong/app/core/widgets/share_button.dart';
import 'package:teste_lojong/app/models/quote_model.dart';
import 'package:teste_lojong/app/modules/inspirations/inspiration_view_model.dart';

class TabBarViewQuotes extends StatefulWidget {
  final List<QuoteModel>? quotesList;
  final List<Gradient> gradients;
  final List<Color> backgroundColor;
  final List<TextStyle> textStyle;
  final List<TextStyle> textStyleAuthor;
  final bool isLoading;
  final ERRORTYPE? errorType;
  final String? errorMessage;
  final Function()? onPressed;
  final Function()? loadMoreQuotesData;

  const TabBarViewQuotes({
    super.key,
    required this.quotesList,
    required this.gradients,
    required this.backgroundColor,
    required this.textStyle,
    required this.textStyleAuthor,
    required this.isLoading,
    this.errorType,
    this.errorMessage,
    this.onPressed,
    this.loadMoreQuotesData,
  });

  @override
  State<TabBarViewQuotes> createState() => _TabBarViewQuotesState();
}

class _TabBarViewQuotesState extends State<TabBarViewQuotes> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        widget.loadMoreQuotesData!();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Observer(builder: (_) {
        if (widget.isLoading) {
          Center(
            child: CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation(AppColors.backgrounColor),
            ),
          );
        }

        if (widget.errorType == ERRORTYPE.socket) {
          return ErrorDataOrNetworkWidget(
            content:
                'Não foi possivel conectar ao servidor, verifique se está conectado a internet.',
            onPressed: widget.onPressed,
          );
        }

        return ListView.separated(
          controller: _scrollController,
          separatorBuilder: (_, index) => const SizedBox(height: 12),
          itemCount: widget.quotesList?.length ?? 0,
          itemBuilder: (_, index) {
            final quote = widget.quotesList?[index];

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 1,
              margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: widget.gradients[index % widget.gradients.length],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 36, 20, 14),
                          child: Text(
                            quote?.text ?? '',
                            style: widget
                                .textStyle[index % widget.textStyle.length],
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                          quote?.author ?? '',
                          style: widget.textStyleAuthor[
                              index % widget.textStyleAuthor.length],
                        ),
                        const SizedBox(height: 16),
                        ShareButton(
                          backgroundColor: widget.backgroundColor[
                              index % widget.backgroundColor.length],
                          iconColor: Colors.white,
                          style: AppFonts.quotesCardTextButton,
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
