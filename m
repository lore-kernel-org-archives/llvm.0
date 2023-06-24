Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0666112;
	Sat, 24 Jun 2023 16:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687624093; x=1719160093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WM+qcpxsR3PFHPvkRND5BlX69ug52YMdQVhgZ0xOjLo=;
  b=hrZhLtf9F7xuXvVJm0+PH8OQ7y1q1PdlmDkIBcYb2gsABSNQ2JZt1lwj
   s/bKVFuVY+JQGMvsxi+YZrQ6S0kpMsD3QMxP+kiM4n/gXGHd+naopFwCy
   LW5AO+5vlvIE4iEvucu+JD7rqZ/sCHA3heKSJ87xAxqi5a97OHQxKb8XY
   U01S+zRN3KYJWCfSPL2sIIYJZR75071W6qVn/P5cbnbtlb2NP5VcyyRKM
   cbs5NOzUm+zKgZcbL38E1vOA3zp5sgdctGH/4F1/Zo3ykqJqDwuSYld0E
   x5XR1zDy7fxEUK54wk01XBke9ocoHe8KYErKcJCrtbc8hMy7VsfxE/amI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="363509348"
X-IronPort-AV: E=Sophos;i="6.01,155,1684825200"; 
   d="scan'208";a="363509348"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2023 09:28:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="860208952"
X-IronPort-AV: E=Sophos;i="6.01,155,1684825200"; 
   d="scan'208";a="860208952"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Jun 2023 09:28:10 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qD67N-0009DC-2l;
	Sat, 24 Jun 2023 16:28:09 +0000
Date: Sun, 25 Jun 2023 00:28:05 +0800
From: kernel test robot <lkp@intel.com>
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: [linux-next:master 5324/12162]
 drivers/cpufreq/cpufreq-dt-platdev.c:18:34: warning: unused variable
 'allowlist'
Message-ID: <202306250025.savpMM8L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8d2be868b42c08290509c60515865f4de24ea704
commit: 3b062a086984d35a3c6d3a1c7841d0aa73aa76af [5324/12162] cpufreq: dt-platdev: Support building as module
config: i386-randconfig-r035-20230624 (https://download.01.org/0day-ci/archive/20230625/202306250025.savpMM8L-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230625/202306250025.savpMM8L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306250025.savpMM8L-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpufreq/cpufreq-dt-platdev.c:18:34: warning: unused variable 'allowlist' [-Wunused-const-variable]
   static const struct of_device_id allowlist[] __initconst = {
                                    ^
>> drivers/cpufreq/cpufreq-dt-platdev.c:105:34: warning: unused variable 'blocklist' [-Wunused-const-variable]
   static const struct of_device_id blocklist[] __initconst = {
                                    ^
   2 warnings generated.


vim +/allowlist +18 drivers/cpufreq/cpufreq-dt-platdev.c

297a66221d2bed Viresh Kumar               2016-09-09   13  
edeec420de2407 Viresh Kumar               2017-08-16   14  /*
edeec420de2407 Viresh Kumar               2017-08-16   15   * Machines for which the cpufreq device is *always* created, mostly used for
edeec420de2407 Viresh Kumar               2017-08-16   16   * platforms using "operating-points" (V1) property.
edeec420de2407 Viresh Kumar               2017-08-16   17   */
4814d9c5d3b956 Viresh Kumar               2021-05-20  @18  static const struct of_device_id allowlist[] __initconst = {
117d4f59affa86 Viresh Kumar               2016-04-22   19  	{ .compatible = "allwinner,sun4i-a10", },
117d4f59affa86 Viresh Kumar               2016-04-22   20  	{ .compatible = "allwinner,sun5i-a10s", },
117d4f59affa86 Viresh Kumar               2016-04-22   21  	{ .compatible = "allwinner,sun5i-a13", },
117d4f59affa86 Viresh Kumar               2016-04-22   22  	{ .compatible = "allwinner,sun5i-r8", },
117d4f59affa86 Viresh Kumar               2016-04-22   23  	{ .compatible = "allwinner,sun6i-a31", },
117d4f59affa86 Viresh Kumar               2016-04-22   24  	{ .compatible = "allwinner,sun6i-a31s", },
117d4f59affa86 Viresh Kumar               2016-04-22   25  	{ .compatible = "allwinner,sun7i-a20", },
117d4f59affa86 Viresh Kumar               2016-04-22   26  	{ .compatible = "allwinner,sun8i-a23", },
117d4f59affa86 Viresh Kumar               2016-04-22   27  	{ .compatible = "allwinner,sun8i-a83t", },
117d4f59affa86 Viresh Kumar               2016-04-22   28  	{ .compatible = "allwinner,sun8i-h3", },
117d4f59affa86 Viresh Kumar               2016-04-22   29  
e11b6293a8fcd3 Hoan Tran                  2016-12-15   30  	{ .compatible = "apm,xgene-shadowcat", },
e11b6293a8fcd3 Hoan Tran                  2016-12-15   31  
650ec6cfe32331 Linus Walleij              2016-10-25   32  	{ .compatible = "arm,integrator-ap", },
650ec6cfe32331 Linus Walleij              2016-10-25   33  	{ .compatible = "arm,integrator-cp", },
650ec6cfe32331 Linus Walleij              2016-10-25   34  
a0df77348ab376 Tao Wang                   2017-05-23   35  	{ .compatible = "hisilicon,hi3660", },
3920be471ce7f6 Viresh Kumar               2016-04-22   36  
7ead83f6df2b10 Viresh Kumar               2016-04-22   37  	{ .compatible = "fsl,imx27", },
7ead83f6df2b10 Viresh Kumar               2016-04-22   38  	{ .compatible = "fsl,imx51", },
7ead83f6df2b10 Viresh Kumar               2016-04-22   39  	{ .compatible = "fsl,imx53", },
7ead83f6df2b10 Viresh Kumar               2016-04-22   40  
a59511d1daa640 Viresh Kumar               2016-04-22   41  	{ .compatible = "marvell,berlin", },
dcd2ea410d8780 Robert Jarzmik             2016-10-31   42  	{ .compatible = "marvell,pxa250", },
dcd2ea410d8780 Robert Jarzmik             2016-10-31   43  	{ .compatible = "marvell,pxa270", },
a59511d1daa640 Viresh Kumar               2016-04-22   44  
2249c00a0bf854 Viresh Kumar               2016-03-30   45  	{ .compatible = "samsung,exynos3250", },
2249c00a0bf854 Viresh Kumar               2016-03-30   46  	{ .compatible = "samsung,exynos4210", },
2249c00a0bf854 Viresh Kumar               2016-03-30   47  	{ .compatible = "samsung,exynos5250", },
2249c00a0bf854 Viresh Kumar               2016-03-30   48  #ifndef CONFIG_BL_SWITCHER
2249c00a0bf854 Viresh Kumar               2016-03-30   49  	{ .compatible = "samsung,exynos5800", },
2249c00a0bf854 Viresh Kumar               2016-03-30   50  #endif
7694ca6e1d6f01 Viresh Kumar               2016-04-22   51  
a399dc9fc50053 Viresh Kumar               2016-04-22   52  	{ .compatible = "renesas,emev2", },
a399dc9fc50053 Viresh Kumar               2016-04-22   53  	{ .compatible = "renesas,r7s72100", },
a399dc9fc50053 Viresh Kumar               2016-04-22   54  	{ .compatible = "renesas,r8a73a4", },
a399dc9fc50053 Viresh Kumar               2016-04-22   55  	{ .compatible = "renesas,r8a7740", },
a6d1bfa05545b0 Lad Prabhakar              2020-04-27   56  	{ .compatible = "renesas,r8a7742", },
f0da898b464953 Geert Uytterhoeven         2016-11-16   57  	{ .compatible = "renesas,r8a7743", },
d1e1303173d7fe Biju Das                   2018-09-11   58  	{ .compatible = "renesas,r8a7744", },
f0da898b464953 Geert Uytterhoeven         2016-11-16   59  	{ .compatible = "renesas,r8a7745", },
a399dc9fc50053 Viresh Kumar               2016-04-22   60  	{ .compatible = "renesas,r8a7778", },
a399dc9fc50053 Viresh Kumar               2016-04-22   61  	{ .compatible = "renesas,r8a7779", },
a399dc9fc50053 Viresh Kumar               2016-04-22   62  	{ .compatible = "renesas,r8a7790", },
a399dc9fc50053 Viresh Kumar               2016-04-22   63  	{ .compatible = "renesas,r8a7791", },
ffdf8b867b922d Geert Uytterhoeven         2016-09-06   64  	{ .compatible = "renesas,r8a7792", },
a399dc9fc50053 Viresh Kumar               2016-04-22   65  	{ .compatible = "renesas,r8a7793", },
a399dc9fc50053 Viresh Kumar               2016-04-22   66  	{ .compatible = "renesas,r8a7794", },
a399dc9fc50053 Viresh Kumar               2016-04-22   67  	{ .compatible = "renesas,sh73a0", },
a399dc9fc50053 Viresh Kumar               2016-04-22   68  
014400c127be35 Finley Xiao                2016-04-22   69  	{ .compatible = "rockchip,rk2928", },
014400c127be35 Finley Xiao                2016-04-22   70  	{ .compatible = "rockchip,rk3036", },
014400c127be35 Finley Xiao                2016-04-22   71  	{ .compatible = "rockchip,rk3066a", },
014400c127be35 Finley Xiao                2016-04-22   72  	{ .compatible = "rockchip,rk3066b", },
014400c127be35 Finley Xiao                2016-04-22   73  	{ .compatible = "rockchip,rk3188", },
014400c127be35 Finley Xiao                2016-04-22   74  	{ .compatible = "rockchip,rk3228", },
014400c127be35 Finley Xiao                2016-04-22   75  	{ .compatible = "rockchip,rk3288", },
319af40a0053fe Finley Xiao                2017-08-04   76  	{ .compatible = "rockchip,rk3328", },
014400c127be35 Finley Xiao                2016-04-22   77  	{ .compatible = "rockchip,rk3366", },
014400c127be35 Finley Xiao                2016-04-22   78  	{ .compatible = "rockchip,rk3368", },
9d21d33cab2dd5 Dmitry Torokhov            2018-10-05   79  	{ .compatible = "rockchip,rk3399",
9d21d33cab2dd5 Dmitry Torokhov            2018-10-05   80  	  .data = &(struct cpufreq_dt_platform_data)
9d21d33cab2dd5 Dmitry Torokhov            2018-10-05   81  		{ .have_governor_per_policy = true, },
9d21d33cab2dd5 Dmitry Torokhov            2018-10-05   82  	},
014400c127be35 Finley Xiao                2016-04-22   83  
ff6c349f74218e Linus Walleij              2017-08-16   84  	{ .compatible = "st-ericsson,u8500", },
ff6c349f74218e Linus Walleij              2017-08-16   85  	{ .compatible = "st-ericsson,u8540", },
ff6c349f74218e Linus Walleij              2017-08-16   86  	{ .compatible = "st-ericsson,u9500", },
ff6c349f74218e Linus Walleij              2017-08-16   87  	{ .compatible = "st-ericsson,u9540", },
ff6c349f74218e Linus Walleij              2017-08-16   88  
4b4c0d37164c29 Mason Huo                  2023-04-21   89  	{ .compatible = "starfive,jh7110", },
4b4c0d37164c29 Mason Huo                  2023-04-21   90  
7694ca6e1d6f01 Viresh Kumar               2016-04-22   91  	{ .compatible = "ti,omap2", },
7694ca6e1d6f01 Viresh Kumar               2016-04-22   92  	{ .compatible = "ti,omap4", },
7694ca6e1d6f01 Viresh Kumar               2016-04-22   93  	{ .compatible = "ti,omap5", },
5e4249c6d9e596 Viresh Kumar               2016-04-22   94  
5e4249c6d9e596 Viresh Kumar               2016-04-22   95  	{ .compatible = "xlnx,zynq-7000", },
a5685781dfe9e7 Shubhrajyoti Datta         2017-07-13   96  	{ .compatible = "xlnx,zynqmp", },
bd37e022e33475 Wei Yongjun                2016-08-21   97  
bd37e022e33475 Wei Yongjun                2016-08-21   98  	{ }
f56aad1d98f1c0 Viresh Kumar               2016-03-30   99  };
f56aad1d98f1c0 Viresh Kumar               2016-03-30  100  
edeec420de2407 Viresh Kumar               2017-08-16  101  /*
edeec420de2407 Viresh Kumar               2017-08-16  102   * Machines for which the cpufreq device is *not* created, mostly used for
edeec420de2407 Viresh Kumar               2017-08-16  103   * platforms using "operating-points-v2" property.
edeec420de2407 Viresh Kumar               2017-08-16  104   */
4814d9c5d3b956 Viresh Kumar               2021-05-20 @105  static const struct of_device_id blocklist[] __initconst = {
f328584f7bff86 Yangtao Li                 2019-06-12  106  	{ .compatible = "allwinner,sun50i-h6", },
f328584f7bff86 Yangtao Li                 2019-06-12  107  
6286bbb40576ff Hector Martin              2022-11-28  108  	{ .compatible = "apple,arm-platform", },
6286bbb40576ff Hector Martin              2022-11-28  109  
fbb31cb805fd35 Sudeep Holla               2021-02-18  110  	{ .compatible = "arm,vexpress", },
fbb31cb805fd35 Sudeep Holla               2021-02-18  111  
ff76898c0a14a4 Viresh Kumar               2017-09-19  112  	{ .compatible = "calxeda,highbank", },
ff76898c0a14a4 Viresh Kumar               2017-09-19  113  	{ .compatible = "calxeda,ecx-2000", },
ff76898c0a14a4 Viresh Kumar               2017-09-19  114  
a08e1b6c2d0b9a Peng Fan                   2020-04-20  115  	{ .compatible = "fsl,imx7ulp", },
e6abacabb5acb6 Leonard Crestez            2019-06-05  116  	{ .compatible = "fsl,imx7d", },
bc8b0c271bbf1e Stefan Agner               2022-01-24  117  	{ .compatible = "fsl,imx7s", },
4d28ba1d62c48d Leonard Crestez            2019-05-13  118  	{ .compatible = "fsl,imx8mq", },
4d28ba1d62c48d Leonard Crestez            2019-05-13  119  	{ .compatible = "fsl,imx8mm", },
8ec5035039c743 Anson Huang                2019-08-18  120  	{ .compatible = "fsl,imx8mn", },
24f371f77e101c Anson Huang                2019-12-26  121  	{ .compatible = "fsl,imx8mp", },
4d28ba1d62c48d Leonard Crestez            2019-05-13  122  
ff76898c0a14a4 Viresh Kumar               2017-09-19  123  	{ .compatible = "marvell,armadaxp", },
ff76898c0a14a4 Viresh Kumar               2017-09-19  124  
6066998cbd2b10 Andrew-sh Cheng            2017-12-08  125  	{ .compatible = "mediatek,mt2701", },
6066998cbd2b10 Andrew-sh Cheng            2017-12-08  126  	{ .compatible = "mediatek,mt2712", },
6066998cbd2b10 Andrew-sh Cheng            2017-12-08  127  	{ .compatible = "mediatek,mt7622", },
6066998cbd2b10 Andrew-sh Cheng            2017-12-08  128  	{ .compatible = "mediatek,mt7623", },
de4ca30958676f Fabien Parent              2020-10-13  129  	{ .compatible = "mediatek,mt8167", },
6066998cbd2b10 Andrew-sh Cheng            2017-12-08  130  	{ .compatible = "mediatek,mt817x", },
6066998cbd2b10 Andrew-sh Cheng            2017-12-08  131  	{ .compatible = "mediatek,mt8173", },
6066998cbd2b10 Andrew-sh Cheng            2017-12-08  132  	{ .compatible = "mediatek,mt8176", },
9176b425bf8ff9 Andrew-sh.Cheng            2019-08-13  133  	{ .compatible = "mediatek,mt8183", },
be4b61ec45b3ef AngeloGioacchino Del Regno 2022-06-17  134  	{ .compatible = "mediatek,mt8186", },
70d99a8f0442bb Fabien Parent              2021-05-19  135  	{ .compatible = "mediatek,mt8365", },
75118c8ef9d16e Fabien Parent              2020-10-13  136  	{ .compatible = "mediatek,mt8516", },
6066998cbd2b10 Andrew-sh Cheng            2017-12-08  137  
26a7a47510ed12 Dmitry Osipenko            2019-11-18  138  	{ .compatible = "nvidia,tegra20", },
26a7a47510ed12 Dmitry Osipenko            2019-11-18  139  	{ .compatible = "nvidia,tegra30", },
ff76898c0a14a4 Viresh Kumar               2017-09-19  140  	{ .compatible = "nvidia,tegra124", },
43c36002b86d60 Joseph Lo                  2019-01-04  141  	{ .compatible = "nvidia,tegra210", },
01c5bb0cc2a39f Sumit Gupta                2022-12-20  142  	{ .compatible = "nvidia,tegra234", },
ff76898c0a14a4 Viresh Kumar               2017-09-19  143  
46e2856b8e1889 Ilia Lin                   2018-05-30  144  	{ .compatible = "qcom,apq8096", },
46e2856b8e1889 Ilia Lin                   2018-05-30  145  	{ .compatible = "qcom,msm8996", },
248b5f297cf809 Jorge Ramirez-Ortiz        2019-07-25  146  	{ .compatible = "qcom,qcs404", },
5e79d6d9ea00c2 Bjorn Andersson            2021-08-20  147  	{ .compatible = "qcom,sa8155p" },
72951a77c00fb2 Bjorn Andersson            2022-02-24  148  	{ .compatible = "qcom,sa8540p" },
fb091802d793e8 Sibi Sankar                2020-06-22  149  	{ .compatible = "qcom,sc7180", },
17a8b0b6dde67f Sibi Sankar                2021-05-12  150  	{ .compatible = "qcom,sc7280", },
d66cd5dea551e9 Bjorn Andersson            2021-07-24  151  	{ .compatible = "qcom,sc8180x", },
72951a77c00fb2 Bjorn Andersson            2022-02-24  152  	{ .compatible = "qcom,sc8280xp", },
49ef12215f112d Sibi Sankar                2020-06-22  153  	{ .compatible = "qcom,sdm845", },
0612d928b7ff8c Adam Skladowski            2022-08-15  154  	{ .compatible = "qcom,sm6115", },
5e79d6d9ea00c2 Bjorn Andersson            2021-08-20  155  	{ .compatible = "qcom,sm6350", },
faf28e240dd118 Konrad Dybcio              2023-01-03  156  	{ .compatible = "qcom,sm6375", },
417598f998520b Luca Weiss                 2023-03-24  157  	{ .compatible = "qcom,sm7225", },
5d79e5ce5489b4 Thara Gopinath             2021-08-04  158  	{ .compatible = "qcom,sm8150", },
5e79d6d9ea00c2 Bjorn Andersson            2021-08-20  159  	{ .compatible = "qcom,sm8250", },
5e79d6d9ea00c2 Bjorn Andersson            2021-08-20  160  	{ .compatible = "qcom,sm8350", },
46e2856b8e1889 Ilia Lin                   2018-05-30  161  
ff76898c0a14a4 Viresh Kumar               2017-09-19  162  	{ .compatible = "st,stih407", },
ff76898c0a14a4 Viresh Kumar               2017-09-19  163  	{ .compatible = "st,stih410", },
305accf3b53ae6 Alain Volmat               2020-08-31  164  	{ .compatible = "st,stih418", },
ff76898c0a14a4 Viresh Kumar               2017-09-19  165  
d477bf3af1e88f Suniel Mahesh              2017-09-21  166  	{ .compatible = "ti,am33xx", },
d477bf3af1e88f Suniel Mahesh              2017-09-21  167  	{ .compatible = "ti,am43", },
d477bf3af1e88f Suniel Mahesh              2017-09-21  168  	{ .compatible = "ti,dra7", },
b7dbe349e1eb5a H. Nikolaus Schaller       2019-09-11  169  	{ .compatible = "ti,omap3", },
e66e20d71d79e6 Dave Gerlach               2022-11-01  170  	{ .compatible = "ti,am625", },
b2b2029eb17888 Vibhore Vardhan            2023-05-26  171  	{ .compatible = "ti,am62a7", },
d477bf3af1e88f Suniel Mahesh              2017-09-21  172  
a8811ec764f95a Christian Marangi          2020-03-13  173  	{ .compatible = "qcom,ipq8064", },
a8811ec764f95a Christian Marangi          2020-03-13  174  	{ .compatible = "qcom,apq8064", },
a8811ec764f95a Christian Marangi          2020-03-13  175  	{ .compatible = "qcom,msm8974", },
a8811ec764f95a Christian Marangi          2020-03-13  176  	{ .compatible = "qcom,msm8960", },
a8811ec764f95a Christian Marangi          2020-03-13  177  
edeec420de2407 Viresh Kumar               2017-08-16  178  	{ }
edeec420de2407 Viresh Kumar               2017-08-16  179  };
edeec420de2407 Viresh Kumar               2017-08-16  180  

:::::: The code at line 18 was first introduced by commit
:::::: 4814d9c5d3b956c5a8f47acbb6b98fdd4dfe334f cpufreq: dt: Rename black/white-lists

:::::: TO: Viresh Kumar <viresh.kumar@linaro.org>
:::::: CC: Viresh Kumar <viresh.kumar@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
