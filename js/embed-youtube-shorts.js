<div id="videoContainer"></div>

<script type="text/javascript">
  // List of video IDs
  const videoIds = ['2z9Km7xotJ4', 'fOYAvl_plVg', 'yWjJ01sWq_o', 'PoeM1rX6o3g', 'g6X_bvZpgj0', 'v-ZDtw27X0g', 'lpQ9Y-rUiDo', 'D5086x2y6Wo', '80sg1HT3NMY', 'qTi4ioDbJ2Q', 'DpKQNciLuzM', 'OeVLnIjEVv4', 'Ve9rnYFZlGU', '4lYPIkWzrW4', 'nXPtGYdiPnE', '0LsSOTG9YiU', 'EXDt8xJHPaQ', 't-Q7mnuBUF8', 'nufj6Ta7SBs', 'zNFK1lNFW8s', 'hkEKcmqdoiE', 'Uf5KNhGL_MM', 'wTbGz8GhMnI', 'KVftwG7pXhQ', 'BOxi1DivqFA', 'DwCm-_ydOpE', 'w845juBR0SE', 'SF7uZayMtck', 'i3u9AsQajuY', 'x5djGqUvXNk', '3SKu-GU8ncw', 'jeZpnGyTvb0', 'EtI1-InX4SY', 'm3qCzZ4cKMc', '3SKRsdE31k8', 'MdydhumNthk', 'zAQSJwFymfQ', 'HvwXj8kTPJM', 'CR0yENzSMX8', 'kIr1BenU68A', '1PyktfzoGf4', 'jQEG__stTYE', 'ynzSZVZDG_c', 'DdasqGZWoF0', 'Sx0-1msKP3Q', 'NDcB3wlcC5k', 'cSnDYH5xk0U'];

  const archivedIds = ['wNy3nfE1MFQ', 'OXFhYuZsJMU', 'Tn62WJHuV7I', 't4rXCvImxdw', 'Edw7iJYRjVk', 'zZg_YZK0HNo', 'yOCTcEvLtbU', 'z-cAahinPqo', 'YHtP2QB58pc', 'zVo2cirxVG8', 'oxky6LcFGtU', 'WG_mpFJjFdA', 'RfERaclPGCs', 'bRRA6cjVq0o', 'SvaBT6wwvPg', 'yTnXWLuFaj8', 'mIitkGrB16E', 'Hc6vWmQUnUs', '6Dhobsw5RHQ', 'tW-8ou2tzg0', 'xMWwQYaR918', '2DtQTdAfTf8', 'OyHPeB4gDVM', 'jMGIxK2t10E', 'LUrD04NZIJE', 'qvienk3TDW4', 'cpGAoUbnbPI', '_yebhB8jZng', 'AWohxclAtlw', 'hHkgO41oc38', 'XMmHOQbBmRI', 'VpmXwhGxvPE', 'cdUQ9uFbq-U', 'vS2bv5Re5Sg', 'EOkacxpccgI', 'VWKcb_KfgqU', 'nKKHBppFElw', 'o879IUwlDnA', 'XKYY2oV_jY4'];

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
