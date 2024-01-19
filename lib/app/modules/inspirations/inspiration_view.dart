import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teste_lojong/app/core/ui/app_fonts.dart';
import 'package:teste_lojong/app/core/widgets/tab_bar_view_articles.dart';
import 'package:teste_lojong/app/core/widgets/tab_bar_view_quotes.dart';
import 'package:teste_lojong/app/core/widgets/tab_bar_view_videos.dart';
import 'package:teste_lojong/app/modules/inspirations/inspiration_view_model.dart';

class InspirationView extends StatefulWidget {
  final InspirationViewModel inspirationViewModel;

  const InspirationView({
    super.key,
    required this.inspirationViewModel,
  });

  @override
  State<InspirationView> createState() => _InspirationViewState();
}

class _InspirationViewState extends State<InspirationView> {
  InspirationViewModel get inspirationViewModel => widget.inspirationViewModel;

  @override
  void initState() {
    inspirationViewModel.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            inspirationViewModel.tabSelected = tabController.index;
          }
        });
        return Scaffold(
          appBar: AppBar(
            leading: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset('assets/icons/arrow-back.svg'),
              ),
            ),
            backgroundColor: Colors.transparent,
            title: Text(
              'INSPIRAÇÕES',
              style: AppFonts.appBarTitle,
            ),
            centerTitle: true,
          ),
          body: Observer(builder: (_) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
                  child: Container(
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(56),
                    ),
                    child: TabBar(
                      indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(56),
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding: const EdgeInsets.all(4),
                      dividerColor: Colors.transparent,
                      tabs: [
                        Text(
                          'VÍDEOS',
                          style: inspirationViewModel.tabSelected == 0
                              ? AppFonts.tabBarTitleSelected
                              : AppFonts.tabBarTitleUnselected,
                        ),
                        Text(
                          'ARTIGOS',
                          style: inspirationViewModel.tabSelected == 1
                              ? AppFonts.tabBarTitleSelected
                              : AppFonts.tabBarTitleUnselected,
                        ),
                        Text(
                          'CITAÇÕES',
                          style: inspirationViewModel.tabSelected == 2
                              ? AppFonts.tabBarTitleSelected
                              : AppFonts.tabBarTitleUnselected,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      TabBarViewVideos(
                        isLoading: inspirationViewModel.isLoading,
                        onTap: (index) {},
                        videoList: inspirationViewModel.videos,
                        errorType: inspirationViewModel.error,
                        errorMessage: inspirationViewModel.errorMessage,
                        onPressed: inspirationViewModel.refreshPages,
                        svgPictures: inspirationViewModel.svgPictures,
                      ),
                      TabBarViewArticles(
                        isLoading: inspirationViewModel.isLoading,
                        articles: inspirationViewModel.articlesList,
                        onTapContent: (index) =>
                            Modular.to.pushNamed('/detail-article/$index'),
                        errorType: inspirationViewModel.error,
                        errorMessage: inspirationViewModel.errorMessage,
                        onPressed: inspirationViewModel.refreshPages,
                        loadMoreArticlesData:
                            inspirationViewModel.loadMoreArticlesData,
                      ),
                      TabBarViewQuotes(
                        quotesList: inspirationViewModel.quotesList,
                        gradients: inspirationViewModel.gradients,
                        backgroundColor: inspirationViewModel.backgroundColor,
                        textStyle: inspirationViewModel.textStyle,
                        textStyleAuthor: inspirationViewModel.textStyleAuthor,
                        isLoading: inspirationViewModel.isLoading,
                        errorType: inspirationViewModel.error,
                        errorMessage: inspirationViewModel.errorMessage,
                        onPressed: inspirationViewModel.refreshPages,
                        loadMoreQuotesData:
                            inspirationViewModel.loadMoreQuotesData,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        );
      }),
    );
  }
}
