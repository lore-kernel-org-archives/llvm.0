Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4F279F6;
	Mon, 15 May 2023 07:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684134704; x=1715670704;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bJHSp0WXB11M54i3/wTaBuclhEyO5UkgeEXC01EVxsY=;
  b=H9rIo3Cy19aIiZuUeqFCV4esLSVIg5mzirNsMsmBdLtgxUIfBRA4Mc2U
   BAHfm33xyLnrMZasXFb+VnlrVjZpPQsSbsPfHlWV4PUqyzT1rhgciCHxL
   YgwfjSt+8xbE7Wyz5E87JvO9KJdKms3FWGhwf6E7URZn1xS5se1MpdvcW
   9cGQsENtqQ6AmApzPQZ8nCONIBDfA3G8oGVj5/QttE2X2sQ01gZMkEuTk
   zX++pxrJO+jzswqI2VVhCoFPGvKS3rTxnQfba4L0XXbTKMLkzUWGya/rG
   xWJ7+/4Ms482SpB5ny/IBT6qSFB+i6OiU0P28YBg+3i9MAZsxoP04FmIZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="353400896"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200"; 
   d="scan'208";a="353400896"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 00:11:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="770494088"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200"; 
   d="scan'208";a="770494088"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 15 May 2023 00:11:42 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pySMv-0006Eg-2O;
	Mon, 15 May 2023 07:11:41 +0000
Date: Mon, 15 May 2023 15:11:23 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:v4_20230510_trevor_wu_asoc_mediatek_mt8188_revise_afe_driver
 24/33] sound/soc/amd/yc/acp6x-mach.c:328:2: error: expected '}'
Message-ID: <202305151513.CfBvMJFT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v4_20230510_trevor_wu_asoc_mediatek_mt8188_revise_afe_driver
head:   1c9bed62309e9ab8127a4cdeb92237af6f53ba7e
commit: af233bd2931b1a6598be38713d69cd42aa5e7e26 [24/33] ASoC: Merge up fixes for CI
config: i386-buildonly-randconfig-r001-20230515 (https://download.01.org/0day-ci/archive/20230515/202305151513.CfBvMJFT-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/commit/?id=af233bd2931b1a6598be38713d69cd42aa5e7e26
        git remote add broonie-ci https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git
        git fetch --no-tags broonie-ci v4_20230510_trevor_wu_asoc_mediatek_mt8188_revise_afe_driver
        git checkout af233bd2931b1a6598be38713d69cd42aa5e7e26
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash sound/soc/amd/yc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305151513.CfBvMJFT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/amd/yc/acp6x-mach.c:328:2: error: expected '}'
   };
    ^
   sound/soc/amd/yc/acp6x-mach.c:47:58: note: to match this '{'
   static const struct dmi_system_id yc_acp_quirk_table[] = {
                                                            ^
   1 error generated.


vim +328 sound/soc/amd/yc/acp6x-mach.c

fa991481b8b22a Vijendar Mukunda    2021-10-18   46  
fa991481b8b22a Vijendar Mukunda    2021-10-18   47  static const struct dmi_system_id yc_acp_quirk_table[] = {
faf15233e59052 Cem Kaya            2023-04-10   48  	{
faf15233e59052 Cem Kaya            2023-04-10   49  		.driver_data = &acp6x_card,
faf15233e59052 Cem Kaya            2023-04-10   50  		.matches = {
faf15233e59052 Cem Kaya            2023-04-10   51  			DMI_MATCH(DMI_BOARD_VENDOR, "Dell Inc."),
faf15233e59052 Cem Kaya            2023-04-10   52  			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5525"),
faf15233e59052 Cem Kaya            2023-04-10   53  		}
faf15233e59052 Cem Kaya            2023-04-10   54  	},
a450b5c8739248 linkt               2022-10-11   55  	{
a450b5c8739248 linkt               2022-10-11   56  		.driver_data = &acp6x_card,
a450b5c8739248 linkt               2022-10-11   57  		.matches = {
a450b5c8739248 linkt               2022-10-11   58  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
a450b5c8739248 linkt               2022-10-11   59  			DMI_MATCH(DMI_PRODUCT_NAME, "21D0"),
a450b5c8739248 linkt               2022-10-11   60  		}
a450b5c8739248 linkt               2022-10-11   61  	},
a75481fa00cc06 Leohearts           2022-10-21   62  	{
a75481fa00cc06 Leohearts           2022-10-21   63  		.driver_data = &acp6x_card,
a75481fa00cc06 Leohearts           2022-10-21   64  		.matches = {
a75481fa00cc06 Leohearts           2022-10-21   65  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
a75481fa00cc06 Leohearts           2022-10-21   66  			DMI_MATCH(DMI_PRODUCT_NAME, "21D0"),
a75481fa00cc06 Leohearts           2022-10-21   67  		}
a75481fa00cc06 Leohearts           2022-10-21   68  	},
a450b5c8739248 linkt               2022-10-11   69  	{
a450b5c8739248 linkt               2022-10-11   70  		.driver_data = &acp6x_card,
a450b5c8739248 linkt               2022-10-11   71  		.matches = {
a450b5c8739248 linkt               2022-10-11   72  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
a450b5c8739248 linkt               2022-10-11   73  			DMI_MATCH(DMI_PRODUCT_NAME, "21D1"),
a450b5c8739248 linkt               2022-10-11   74  		}
a450b5c8739248 linkt               2022-10-11   75  	},
fa991481b8b22a Vijendar Mukunda    2021-10-18   76  	{
e521f087780d07 Mario Limonciello   2022-04-11   77  		.driver_data = &acp6x_card,
fa991481b8b22a Vijendar Mukunda    2021-10-18   78  		.matches = {
fa991481b8b22a Vijendar Mukunda    2021-10-18   79  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
fa991481b8b22a Vijendar Mukunda    2021-10-18   80  			DMI_MATCH(DMI_PRODUCT_NAME, "21D2"),
fa991481b8b22a Vijendar Mukunda    2021-10-18   81  		}
fa991481b8b22a Vijendar Mukunda    2021-10-18   82  	},
fa991481b8b22a Vijendar Mukunda    2021-10-18   83  	{
e521f087780d07 Mario Limonciello   2022-04-11   84  		.driver_data = &acp6x_card,
fa991481b8b22a Vijendar Mukunda    2021-10-18   85  		.matches = {
fa991481b8b22a Vijendar Mukunda    2021-10-18   86  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
fa991481b8b22a Vijendar Mukunda    2021-10-18   87  			DMI_MATCH(DMI_PRODUCT_NAME, "21D3"),
fa991481b8b22a Vijendar Mukunda    2021-10-18   88  		}
fa991481b8b22a Vijendar Mukunda    2021-10-18   89  	},
fa991481b8b22a Vijendar Mukunda    2021-10-18   90  	{
e521f087780d07 Mario Limonciello   2022-04-11   91  		.driver_data = &acp6x_card,
fa991481b8b22a Vijendar Mukunda    2021-10-18   92  		.matches = {
fa991481b8b22a Vijendar Mukunda    2021-10-18   93  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
fa991481b8b22a Vijendar Mukunda    2021-10-18   94  			DMI_MATCH(DMI_PRODUCT_NAME, "21D4"),
fa991481b8b22a Vijendar Mukunda    2021-10-18   95  		}
fa991481b8b22a Vijendar Mukunda    2021-10-18   96  	},
fa991481b8b22a Vijendar Mukunda    2021-10-18   97  	{
e521f087780d07 Mario Limonciello   2022-04-11   98  		.driver_data = &acp6x_card,
fa991481b8b22a Vijendar Mukunda    2021-10-18   99  		.matches = {
fa991481b8b22a Vijendar Mukunda    2021-10-18  100  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  101  			DMI_MATCH(DMI_PRODUCT_NAME, "21D5"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  102  		}
fa991481b8b22a Vijendar Mukunda    2021-10-18  103  	},
fa991481b8b22a Vijendar Mukunda    2021-10-18  104  	{
e521f087780d07 Mario Limonciello   2022-04-11  105  		.driver_data = &acp6x_card,
fa991481b8b22a Vijendar Mukunda    2021-10-18  106  		.matches = {
fa991481b8b22a Vijendar Mukunda    2021-10-18  107  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  108  			DMI_MATCH(DMI_PRODUCT_NAME, "21CF"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  109  		}
fa991481b8b22a Vijendar Mukunda    2021-10-18  110  	},
fa991481b8b22a Vijendar Mukunda    2021-10-18  111  	{
e521f087780d07 Mario Limonciello   2022-04-11  112  		.driver_data = &acp6x_card,
fa991481b8b22a Vijendar Mukunda    2021-10-18  113  		.matches = {
fa991481b8b22a Vijendar Mukunda    2021-10-18  114  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  115  			DMI_MATCH(DMI_PRODUCT_NAME, "21CG"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  116  		}
fa991481b8b22a Vijendar Mukunda    2021-10-18  117  	},
fa991481b8b22a Vijendar Mukunda    2021-10-18  118  	{
e521f087780d07 Mario Limonciello   2022-04-11  119  		.driver_data = &acp6x_card,
fa991481b8b22a Vijendar Mukunda    2021-10-18  120  		.matches = {
fa991481b8b22a Vijendar Mukunda    2021-10-18  121  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  122  			DMI_MATCH(DMI_PRODUCT_NAME, "21CQ"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  123  		}
fa991481b8b22a Vijendar Mukunda    2021-10-18  124  	},
fa991481b8b22a Vijendar Mukunda    2021-10-18  125  	{
e521f087780d07 Mario Limonciello   2022-04-11  126  		.driver_data = &acp6x_card,
fa991481b8b22a Vijendar Mukunda    2021-10-18  127  		.matches = {
fa991481b8b22a Vijendar Mukunda    2021-10-18  128  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  129  			DMI_MATCH(DMI_PRODUCT_NAME, "21CR"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  130  		}
fa991481b8b22a Vijendar Mukunda    2021-10-18  131  	},
fa991481b8b22a Vijendar Mukunda    2021-10-18  132  	{
e521f087780d07 Mario Limonciello   2022-04-11  133  		.driver_data = &acp6x_card,
fa991481b8b22a Vijendar Mukunda    2021-10-18  134  		.matches = {
fa991481b8b22a Vijendar Mukunda    2021-10-18  135  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
be0aa8d4b0fcb4 syed sabakareem     2022-07-22  136  			DMI_MATCH(DMI_PRODUCT_NAME, "21CM"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  137  		}
fa991481b8b22a Vijendar Mukunda    2021-10-18  138  	},
fa991481b8b22a Vijendar Mukunda    2021-10-18  139  	{
e521f087780d07 Mario Limonciello   2022-04-11  140  		.driver_data = &acp6x_card,
fa991481b8b22a Vijendar Mukunda    2021-10-18  141  		.matches = {
fa991481b8b22a Vijendar Mukunda    2021-10-18  142  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
be0aa8d4b0fcb4 syed sabakareem     2022-07-22  143  			DMI_MATCH(DMI_PRODUCT_NAME, "21CN"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  144  		}
fa991481b8b22a Vijendar Mukunda    2021-10-18  145  	},
fa991481b8b22a Vijendar Mukunda    2021-10-18  146  	{
e521f087780d07 Mario Limonciello   2022-04-11  147  		.driver_data = &acp6x_card,
fa991481b8b22a Vijendar Mukunda    2021-10-18  148  		.matches = {
fa991481b8b22a Vijendar Mukunda    2021-10-18  149  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  150  			DMI_MATCH(DMI_PRODUCT_NAME, "21CH"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  151  		}
fa991481b8b22a Vijendar Mukunda    2021-10-18  152  	},
fa991481b8b22a Vijendar Mukunda    2021-10-18  153  	{
e521f087780d07 Mario Limonciello   2022-04-11  154  		.driver_data = &acp6x_card,
fa991481b8b22a Vijendar Mukunda    2021-10-18  155  		.matches = {
fa991481b8b22a Vijendar Mukunda    2021-10-18  156  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  157  			DMI_MATCH(DMI_PRODUCT_NAME, "21CJ"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  158  		}
fa991481b8b22a Vijendar Mukunda    2021-10-18  159  	},
fa991481b8b22a Vijendar Mukunda    2021-10-18  160  	{
e521f087780d07 Mario Limonciello   2022-04-11  161  		.driver_data = &acp6x_card,
fa991481b8b22a Vijendar Mukunda    2021-10-18  162  		.matches = {
fa991481b8b22a Vijendar Mukunda    2021-10-18  163  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  164  			DMI_MATCH(DMI_PRODUCT_NAME, "21CK"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  165  		}
fa991481b8b22a Vijendar Mukunda    2021-10-18  166  	},
fa991481b8b22a Vijendar Mukunda    2021-10-18  167  	{
e521f087780d07 Mario Limonciello   2022-04-11  168  		.driver_data = &acp6x_card,
fa991481b8b22a Vijendar Mukunda    2021-10-18  169  		.matches = {
fa991481b8b22a Vijendar Mukunda    2021-10-18  170  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  171  			DMI_MATCH(DMI_PRODUCT_NAME, "21CL"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  172  		}
fa991481b8b22a Vijendar Mukunda    2021-10-18  173  	},
c0fc96fed7ffa3 syed sabakareem     2022-08-02  174  	{
c0fc96fed7ffa3 syed sabakareem     2022-08-02  175  		.driver_data = &acp6x_card,
c0fc96fed7ffa3 syed sabakareem     2022-08-02  176  		.matches = {
c0fc96fed7ffa3 syed sabakareem     2022-08-02  177  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
c0fc96fed7ffa3 syed sabakareem     2022-08-02  178  			DMI_MATCH(DMI_PRODUCT_NAME, "21EM"),
c0fc96fed7ffa3 syed sabakareem     2022-08-02  179  		}
c0fc96fed7ffa3 syed sabakareem     2022-08-02  180  	},
c0fc96fed7ffa3 syed sabakareem     2022-08-02  181  	{
c0fc96fed7ffa3 syed sabakareem     2022-08-02  182  		.driver_data = &acp6x_card,
c0fc96fed7ffa3 syed sabakareem     2022-08-02  183  		.matches = {
c0fc96fed7ffa3 syed sabakareem     2022-08-02  184  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
c0fc96fed7ffa3 syed sabakareem     2022-08-02  185  			DMI_MATCH(DMI_PRODUCT_NAME, "21EN"),
c0fc96fed7ffa3 syed sabakareem     2022-08-02  186  		}
c0fc96fed7ffa3 syed sabakareem     2022-08-02  187  	},
a8f5da0bf4d85a Baishan Jiang       2023-04-12  188  	{
a8f5da0bf4d85a Baishan Jiang       2023-04-12  189  		.driver_data = &acp6x_card,
a8f5da0bf4d85a Baishan Jiang       2023-04-12  190  		.matches = {
a8f5da0bf4d85a Baishan Jiang       2023-04-12  191  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
a8f5da0bf4d85a Baishan Jiang       2023-04-12  192  			DMI_MATCH(DMI_PRODUCT_NAME, "21HY"),
a8f5da0bf4d85a Baishan Jiang       2023-04-12  193  		}
a8f5da0bf4d85a Baishan Jiang       2023-04-12  194  	},
c0fc96fed7ffa3 syed sabakareem     2022-08-02  195  	{
c0fc96fed7ffa3 syed sabakareem     2022-08-02  196  		.driver_data = &acp6x_card,
c0fc96fed7ffa3 syed sabakareem     2022-08-02  197  		.matches = {
c0fc96fed7ffa3 syed sabakareem     2022-08-02  198  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
c0fc96fed7ffa3 syed sabakareem     2022-08-02  199  			DMI_MATCH(DMI_PRODUCT_NAME, "21J5"),
c0fc96fed7ffa3 syed sabakareem     2022-08-02  200  		}
c0fc96fed7ffa3 syed sabakareem     2022-08-02  201  	},
c0fc96fed7ffa3 syed sabakareem     2022-08-02  202  	{
c0fc96fed7ffa3 syed sabakareem     2022-08-02  203  		.driver_data = &acp6x_card,
c0fc96fed7ffa3 syed sabakareem     2022-08-02  204  		.matches = {
c0fc96fed7ffa3 syed sabakareem     2022-08-02  205  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
c0fc96fed7ffa3 syed sabakareem     2022-08-02  206  			DMI_MATCH(DMI_PRODUCT_NAME, "21J6"),
c0fc96fed7ffa3 syed sabakareem     2022-08-02  207  		}
c0fc96fed7ffa3 syed sabakareem     2022-08-02  208  	},
2232b2dd8cd4f1 Mario Limonciello   2022-09-20  209  	{
2232b2dd8cd4f1 Mario Limonciello   2022-09-20  210  		.driver_data = &acp6x_card,
2232b2dd8cd4f1 Mario Limonciello   2022-09-20  211  		.matches = {
2232b2dd8cd4f1 Mario Limonciello   2022-09-20  212  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
2232b2dd8cd4f1 Mario Limonciello   2022-09-20  213  			DMI_MATCH(DMI_PRODUCT_NAME, "82"),
2232b2dd8cd4f1 Mario Limonciello   2022-09-20  214  		}
2232b2dd8cd4f1 Mario Limonciello   2022-09-20  215  	},
4df5b13dec9e1b Xiaoyan Li          2022-09-20  216  	{
4df5b13dec9e1b Xiaoyan Li          2022-09-20  217  		.driver_data = &acp6x_card,
4df5b13dec9e1b Xiaoyan Li          2022-09-20  218  		.matches = {
4df5b13dec9e1b Xiaoyan Li          2022-09-20  219  			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
4df5b13dec9e1b Xiaoyan Li          2022-09-20  220  			DMI_MATCH(DMI_PRODUCT_NAME, "UM5302TA"),
4df5b13dec9e1b Xiaoyan Li          2022-09-20  221  		}
4df5b13dec9e1b Xiaoyan Li          2022-09-20  222  	},
a0dd7fcab5cd22 Aniol Martí         2022-12-27  223  	{
a0dd7fcab5cd22 Aniol Martí         2022-12-27  224  		.driver_data = &acp6x_card,
a0dd7fcab5cd22 Aniol Martí         2022-12-27  225  		.matches = {
a0dd7fcab5cd22 Aniol Martí         2022-12-27  226  			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
a0dd7fcab5cd22 Aniol Martí         2022-12-27  227  			DMI_MATCH(DMI_PRODUCT_NAME, "M5402RA"),
a0dd7fcab5cd22 Aniol Martí         2022-12-27  228  		}
a0dd7fcab5cd22 Aniol Martí         2022-12-27  229  	},
4a1b5bc73e9ce8 Andrey Rakhmatullin 2023-05-01  230  	{
4a1b5bc73e9ce8 Andrey Rakhmatullin 2023-05-01  231  		.driver_data = &acp6x_card,
4a1b5bc73e9ce8 Andrey Rakhmatullin 2023-05-01  232  		.matches = {
4a1b5bc73e9ce8 Andrey Rakhmatullin 2023-05-01  233  			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
4a1b5bc73e9ce8 Andrey Rakhmatullin 2023-05-01  234  			DMI_MATCH(DMI_PRODUCT_NAME, "M6400RC"),
4a1b5bc73e9ce8 Andrey Rakhmatullin 2023-05-01  235  		}
4a1b5bc73e9ce8 Andrey Rakhmatullin 2023-05-01  236  	},
110ccfa9dd6ca1 Enrico Belleri      2023-04-27  237  	{
110ccfa9dd6ca1 Enrico Belleri      2023-04-27  238  		.driver_data = &acp6x_card,
110ccfa9dd6ca1 Enrico Belleri      2023-04-27  239  		.matches = {
110ccfa9dd6ca1 Enrico Belleri      2023-04-27  240  			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
110ccfa9dd6ca1 Enrico Belleri      2023-04-27  241  			DMI_MATCH(DMI_PRODUCT_NAME, "M3402RA"),
110ccfa9dd6ca1 Enrico Belleri      2023-04-27  242  		}
110ccfa9dd6ca1 Enrico Belleri      2023-04-27  243  	},
d40b6529c6269c Brent Mendelsohn    2022-10-24  244  	{
d40b6529c6269c Brent Mendelsohn    2022-10-24  245  		.driver_data = &acp6x_card,
d40b6529c6269c Brent Mendelsohn    2022-10-24  246  		.matches = {
d40b6529c6269c Brent Mendelsohn    2022-10-24  247  			DMI_MATCH(DMI_BOARD_VENDOR, "Alienware"),
d40b6529c6269c Brent Mendelsohn    2022-10-24  248  			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
d40b6529c6269c Brent Mendelsohn    2022-10-24  249  		}
d40b6529c6269c Brent Mendelsohn    2022-10-24  250  	},
c1dd6bf6199752 Artem Lukyanov      2022-11-30  251  	{
c1dd6bf6199752 Artem Lukyanov      2022-11-30  252  		.driver_data = &acp6x_card,
c1dd6bf6199752 Artem Lukyanov      2022-11-30  253  		.matches = {
c1dd6bf6199752 Artem Lukyanov      2022-11-30  254  			DMI_MATCH(DMI_BOARD_VENDOR, "TIMI"),
c1dd6bf6199752 Artem Lukyanov      2022-11-30  255  			DMI_MATCH(DMI_PRODUCT_NAME, "Redmi Book Pro 14 2022"),
c1dd6bf6199752 Artem Lukyanov      2022-11-30  256  		}
c1dd6bf6199752 Artem Lukyanov      2022-11-30  257  	},
dcff8b7ca92d72 fengwk              2023-01-22  258  	{
dcff8b7ca92d72 fengwk              2023-01-22  259  		.driver_data = &acp6x_card,
dcff8b7ca92d72 fengwk              2023-01-22  260  		.matches = {
dcff8b7ca92d72 fengwk              2023-01-22  261  			DMI_MATCH(DMI_BOARD_VENDOR, "TIMI"),
dcff8b7ca92d72 fengwk              2023-01-22  262  			DMI_MATCH(DMI_PRODUCT_NAME, "Redmi Book Pro 15 2022"),
dcff8b7ca92d72 fengwk              2023-01-22  263  		}
dcff8b7ca92d72 fengwk              2023-01-22  264  	},
68506a173dd700 Wim Van Boven       2022-12-16  265  	{
68506a173dd700 Wim Van Boven       2022-12-16  266  		.driver_data = &acp6x_card,
68506a173dd700 Wim Van Boven       2022-12-16  267  		.matches = {
68506a173dd700 Wim Van Boven       2022-12-16  268  			DMI_MATCH(DMI_BOARD_VENDOR, "Razer"),
68506a173dd700 Wim Van Boven       2022-12-16  269  			DMI_MATCH(DMI_PRODUCT_NAME, "Blade 14 (2022) - RZ09-0427"),
68506a173dd700 Wim Van Boven       2022-12-16  270  		}
68506a173dd700 Wim Van Boven       2022-12-16  271  	},
7fd26a27680aa9 Syed Saba Kareem    2023-01-11  272  	{
7fd26a27680aa9 Syed Saba Kareem    2023-01-11  273  		.driver_data = &acp6x_card,
7fd26a27680aa9 Syed Saba Kareem    2023-01-11  274  		.matches = {
7fd26a27680aa9 Syed Saba Kareem    2023-01-11  275  			DMI_MATCH(DMI_BOARD_VENDOR, "RB"),
7fd26a27680aa9 Syed Saba Kareem    2023-01-11  276  			DMI_MATCH(DMI_PRODUCT_NAME, "Swift SFA16-41"),
7fd26a27680aa9 Syed Saba Kareem    2023-01-11  277  		}
7fd26a27680aa9 Syed Saba Kareem    2023-01-11  278  	},
7fd26a27680aa9 Syed Saba Kareem    2023-01-11  279  	{
7fd26a27680aa9 Syed Saba Kareem    2023-01-11  280  		.driver_data = &acp6x_card,
7fd26a27680aa9 Syed Saba Kareem    2023-01-11  281  		.matches = {
7fd26a27680aa9 Syed Saba Kareem    2023-01-11  282  			DMI_MATCH(DMI_BOARD_VENDOR, "IRBIS"),
7fd26a27680aa9 Syed Saba Kareem    2023-01-11  283  			DMI_MATCH(DMI_PRODUCT_NAME, "15NBC1011"),
7fd26a27680aa9 Syed Saba Kareem    2023-01-11  284  		}
7fd26a27680aa9 Syed Saba Kareem    2023-01-11  285  	},
22ce6843abec19 Joseph Hunkeler     2023-02-16  286  	{
22ce6843abec19 Joseph Hunkeler     2023-02-16  287  		.driver_data = &acp6x_card,
22ce6843abec19 Joseph Hunkeler     2023-02-16  288  		.matches = {
22ce6843abec19 Joseph Hunkeler     2023-02-16  289  			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
22ce6843abec19 Joseph Hunkeler     2023-02-16  290  			DMI_MATCH(DMI_PRODUCT_NAME, "OMEN by HP Gaming Laptop 16z-n000"),
22ce6843abec19 Joseph Hunkeler     2023-02-16  291  		}
22ce6843abec19 Joseph Hunkeler     2023-02-16  292  	},
ee4281de4d6028 Prajna Sariputra    2023-04-02  293  	{
ee4281de4d6028 Prajna Sariputra    2023-04-02  294  		.driver_data = &acp6x_card,
ee4281de4d6028 Prajna Sariputra    2023-04-02  295  		.matches = {
ee4281de4d6028 Prajna Sariputra    2023-04-02  296  			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
ee4281de4d6028 Prajna Sariputra    2023-04-02  297  			DMI_MATCH(DMI_BOARD_NAME, "8A42"),
ee4281de4d6028 Prajna Sariputra    2023-04-02  298  		}
ee4281de4d6028 Prajna Sariputra    2023-04-02  299  	},
d52279d5c9204a Duc Anh Le          2023-02-28  300  	{
d52279d5c9204a Duc Anh Le          2023-02-28  301  		.driver_data = &acp6x_card,
d52279d5c9204a Duc Anh Le          2023-02-28  302  		.matches = {
d52279d5c9204a Duc Anh Le          2023-02-28  303  			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
d52279d5c9204a Duc Anh Le          2023-02-28  304  			DMI_MATCH(DMI_BOARD_NAME, "8A43"),
d52279d5c9204a Duc Anh Le          2023-02-28  305  		}
d52279d5c9204a Duc Anh Le          2023-02-28  306  	},
205efd4619b860 Ge-org Brohammer    2023-03-17  307  	{
205efd4619b860 Ge-org Brohammer    2023-03-17  308  		.driver_data = &acp6x_card,
205efd4619b860 Ge-org Brohammer    2023-03-17  309  		.matches = {
205efd4619b860 Ge-org Brohammer    2023-03-17  310  			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
205efd4619b860 Ge-org Brohammer    2023-03-17  311  			DMI_MATCH(DMI_BOARD_NAME, "8A22"),
205efd4619b860 Ge-org Brohammer    2023-03-17  312  		}
205efd4619b860 Ge-org Brohammer    2023-03-17  313  	},
deeb7855f5d7e2 Rsplwe              2023-05-11  314  	{
deeb7855f5d7e2 Rsplwe              2023-05-11  315  		.driver_data = &acp6x_card,
deeb7855f5d7e2 Rsplwe              2023-05-11  316  		.matches = {
deeb7855f5d7e2 Rsplwe              2023-05-11  317  			DMI_MATCH(DMI_BOARD_VENDOR, "MECHREVO"),
deeb7855f5d7e2 Rsplwe              2023-05-11  318  			DMI_MATCH(DMI_BOARD_NAME, "MRID6"),
af233bd2931b1a Mark Brown          2023-05-12  319  	},
7b9891ad25246b Jeremy Soller       2023-05-05  320  	{
7b9891ad25246b Jeremy Soller       2023-05-05  321  		.driver_data = &acp6x_card,
7b9891ad25246b Jeremy Soller       2023-05-05  322  		.matches = {
7b9891ad25246b Jeremy Soller       2023-05-05  323  			DMI_MATCH(DMI_BOARD_VENDOR, "System76"),
7b9891ad25246b Jeremy Soller       2023-05-05  324  			DMI_MATCH(DMI_PRODUCT_VERSION, "pang12"),
deeb7855f5d7e2 Rsplwe              2023-05-11  325  		}
deeb7855f5d7e2 Rsplwe              2023-05-11  326  	},
fa991481b8b22a Vijendar Mukunda    2021-10-18  327  	{}
fa991481b8b22a Vijendar Mukunda    2021-10-18 @328  };
fa991481b8b22a Vijendar Mukunda    2021-10-18  329  

:::::: The code at line 328 was first introduced by commit
:::::: fa991481b8b22a7797a828135ce62a73791bbe39 ASoC: amd: add YC machine driver using dmic

:::::: TO: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
