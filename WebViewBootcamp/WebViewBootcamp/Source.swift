//
//  Source.swift
//  WebViewBootcamp
//
//  Created by Artem on 16.10.2023.
//

import Foundation

enum Source {
    static let htmlString = """
<!-- TradingView Widget BEGIN -->
<div class="tradingview-widget-container" style="height:100%;width:100%">
  <div id="tradingview_3e8f5" style="height:calc(100% - 32px);width:100%"></div>
  <div class="tradingview-widget-copyright"><a href="https://www.tradingview.com/" rel="noopener nofollow" target="_blank"><span class="blue-text">Track all markets on TradingView</span></a></div>
  <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
  <script type="text/javascript">
  new TradingView.widget(
  {
  "autosize": true,
  "symbol": "BINANCE:BUSDRUB",
  "interval": "60",
  "timezone": "Etc/UTC",
  "theme": "dark",
  "style": "1",
  "locale": "en",
  "enable_publishing": false,
  "backgroundColor": "rgba(0, 0, 0, 1)",
  "gridColor": "rgba(66, 66, 66, 0.56)",
  "hide_top_toolbar": true,
  "hide_legend": true,
  "save_image": false,
  "hide_volume": true,
  "container_id": "tradingview_3e8f5"
}
  );
  </script>
</div>
<!-- TradingView Widget END -->
"""
}
