import 'package:century_cqg/Screens/Account/accnts_tabs/model/analysis_model.dart';

class AnalysisService {
  const AnalysisService();

  List<AnalysisMetric> getMetrics() {
    return const [
      AnalysisMetric(label: 'Winning Trades', value: '24'),
      AnalysisMetric(label: 'Losing Trades', value: '11'),
      AnalysisMetric(label: 'Win Rate', value: '68%'),
    ];
  }
}
