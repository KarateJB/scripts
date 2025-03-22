<div id="videoContainer"></div>

<script type="text/javascript">
  // List of video IDs
  const videoIds = ['Tn62WJHuV7I', 't4rXCvImxdw', 'Edw7iJYRjVk', 'zZg_YZK0HNo', 'yOCTcEvLtbU', 'z-cAahinPqo', 'YHtP2QB58pc', 'zVo2cirxVG8', 'oxky6LcFGtU', 'WG_mpFJjFdA', 'RfERaclPGCs', 'bRRA6cjVq0o', 'SvaBT6wwvPg', 'yTnXWLuFaj8', 'mIitkGrB16E', 'Hc6vWmQUnUs', '6Dhobsw5RHQ', 'tW-8ou2tzg0', 'xMWwQYaR918', '2DtQTdAfTf8', 'OyHPeB4gDVM', 'jMGIxK2t10E', 'LUrD04NZIJE', 'qvienk3TDW4', 'cpGAoUbnbPI', '_yebhB8jZng', 'AWohxclAtlw', 'hHkgO41oc38', 'XMmHOQbBmRI', 'VpmXwhGxvPE', 'cdUQ9uFbq-U', 'vS2bv5Re5Sg', 'EOkacxpccgI', 'VWKcb_KfgqU', 'nKKHBppFElw', 'o879IUwlDnA', 'XKYY2oV_jY4'];

  const archivedIds = [];

  // Select a random video ID
  const randomVideoId = videoIds[Math.floor(Math.random() * videoIds.length)];

  // Create iframe element with the random video ID
  const iframe = document.createElement('iframe');
  iframe.width = "300";
  iframe.height = "400";
  iframe.src = `https://www.youtube.com/embed/${randomVideoId}?mute=1`;
  iframe.title = "Random Video";
  iframe.frameBorder = "0";
  iframe.allow = "accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share";
  iframe.allowFullscreen = true;

  // Append iframe to the container div
  document.getElementById('videoContainer').appendChild(iframe);
</script>
