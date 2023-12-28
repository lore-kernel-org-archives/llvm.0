Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7018CDF41;
	Thu, 28 Dec 2023 15:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GK4M28/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703776950; x=1735312950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HPObERDwqzpvTIiprRq2etao0O5omsmb5bMJk9MpmaU=;
  b=GK4M28/stcpcEU3cDo30f5vCtGr36oNfNiWCitbsK1mp9jzgE7SVMREb
   RHjExh/PNAnPzFQsq1C9pYKJlCNDUVtVLpFzem2ImkFpqgBFUYKLtWGRX
   LlZzHMAr3UKfpq+Ze71Pk3WK4kdQeKQqLCXapn11chwoZLLKPqqu571um
   FYLzpTxs+7Gkf/va+xlPjePYOipjCdpIbgGnu2hEf+qnd/Ga1gxrFLxbp
   BuprO93HTQJMkdRPqr500Twkmx009Wl0U7EEpQMXATLnkr1GP8R3ywd8H
   nrsxwmY9pZKA6zU62Z3hY6x2ILCMqsTXJzOhUcER8heP5GyJELIbyq3IE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="482734089"
X-IronPort-AV: E=Sophos;i="6.04,312,1695711600"; 
   d="scan'208";a="482734089"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2023 07:22:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="812816942"
X-IronPort-AV: E=Sophos;i="6.04,312,1695711600"; 
   d="scan'208";a="812816942"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 28 Dec 2023 07:22:26 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIsDI-000GZ1-2K;
	Thu, 28 Dec 2023 15:22:24 +0000
Date: Thu, 28 Dec 2023 23:22:16 +0800
From: kernel test robot <lkp@intel.com>
To: Hsiao Chien Sung <shawn.sung@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, arm@kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [soc:mediatek/soc-drivers 7/24]
 drivers/soc/mediatek/mt8188-mmsys.h:126:3: error: use of undeclared
 identifier 'MT8188_VDO0_RST_DISP_OVL0'
Message-ID: <202312282303.RiMNsTV5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git mediatek/soc-drivers
head:   2bfbf82956e2de75249ce83901800c68d17d9e62
commit: 27222a779d0404d6faab8aeaf028db4ac4de9b1f [7/24] soc: mediatek: Add MT8188 VDOSYS reset bit map
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231228/202312282303.RiMNsTV5-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d3ef86708241a3bee902615c190dead1638c4e09)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231228/202312282303.RiMNsTV5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312282303.RiMNsTV5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/soc/mediatek/mtk-mmsys.c:21:
>> drivers/soc/mediatek/mt8188-mmsys.h:126:3: error: use of undeclared identifier 'MT8188_VDO0_RST_DISP_OVL0'
     126 |         [MT8188_VDO0_RST_DISP_OVL0]     = MMSYS_RST_NR(0, 0),
         |          ^
>> drivers/soc/mediatek/mt8188-mmsys.h:127:3: error: use of undeclared identifier 'MT8188_VDO0_RST_FAKE_ENG0'
     127 |         [MT8188_VDO0_RST_FAKE_ENG0]     = MMSYS_RST_NR(0, 2),
         |          ^
>> drivers/soc/mediatek/mt8188-mmsys.h:128:3: error: use of undeclared identifier 'MT8188_VDO0_RST_DISP_CCORR0'
     128 |         [MT8188_VDO0_RST_DISP_CCORR0]   = MMSYS_RST_NR(0, 4),
         |          ^
>> drivers/soc/mediatek/mt8188-mmsys.h:129:3: error: use of undeclared identifier 'MT8188_VDO0_RST_DISP_MUTEX0'
     129 |         [MT8188_VDO0_RST_DISP_MUTEX0]   = MMSYS_RST_NR(0, 6),
         |          ^
>> drivers/soc/mediatek/mt8188-mmsys.h:130:3: error: use of undeclared identifier 'MT8188_VDO0_RST_DISP_GAMMA0'
     130 |         [MT8188_VDO0_RST_DISP_GAMMA0]   = MMSYS_RST_NR(0, 8),
         |          ^
>> drivers/soc/mediatek/mt8188-mmsys.h:131:3: error: use of undeclared identifier 'MT8188_VDO0_RST_DISP_DITHER0'
     131 |         [MT8188_VDO0_RST_DISP_DITHER0]  = MMSYS_RST_NR(0, 10),
         |          ^
>> drivers/soc/mediatek/mt8188-mmsys.h:132:3: error: use of undeclared identifier 'MT8188_VDO0_RST_DISP_WDMA0'
     132 |         [MT8188_VDO0_RST_DISP_WDMA0]    = MMSYS_RST_NR(0, 17),
         |          ^
>> drivers/soc/mediatek/mt8188-mmsys.h:133:3: error: use of undeclared identifier 'MT8188_VDO0_RST_DISP_RDMA0'
     133 |         [MT8188_VDO0_RST_DISP_RDMA0]    = MMSYS_RST_NR(0, 19),
         |          ^
>> drivers/soc/mediatek/mt8188-mmsys.h:134:3: error: use of undeclared identifier 'MT8188_VDO0_RST_DSI0'
     134 |         [MT8188_VDO0_RST_DSI0]          = MMSYS_RST_NR(0, 21),
         |          ^
>> drivers/soc/mediatek/mt8188-mmsys.h:135:3: error: use of undeclared identifier 'MT8188_VDO0_RST_DSI1'
     135 |         [MT8188_VDO0_RST_DSI1]          = MMSYS_RST_NR(0, 22),
         |          ^
>> drivers/soc/mediatek/mt8188-mmsys.h:136:3: error: use of undeclared identifier 'MT8188_VDO0_RST_DSC_WRAP0'
     136 |         [MT8188_VDO0_RST_DSC_WRAP0]     = MMSYS_RST_NR(0, 23),
         |          ^
>> drivers/soc/mediatek/mt8188-mmsys.h:137:3: error: use of undeclared identifier 'MT8188_VDO0_RST_VPP_MERGE0'
     137 |         [MT8188_VDO0_RST_VPP_MERGE0]    = MMSYS_RST_NR(0, 24),
         |          ^
>> drivers/soc/mediatek/mt8188-mmsys.h:138:3: error: use of undeclared identifier 'MT8188_VDO0_RST_DP_INTF0'
     138 |         [MT8188_VDO0_RST_DP_INTF0]      = MMSYS_RST_NR(0, 25),
         |          ^
>> drivers/soc/mediatek/mt8188-mmsys.h:139:3: error: use of undeclared identifier 'MT8188_VDO0_RST_DISP_AAL0'
     139 |         [MT8188_VDO0_RST_DISP_AAL0]     = MMSYS_RST_NR(0, 26),
         |          ^
>> drivers/soc/mediatek/mt8188-mmsys.h:140:3: error: use of undeclared identifier 'MT8188_VDO0_RST_INLINEROT0'
     140 |         [MT8188_VDO0_RST_INLINEROT0]    = MMSYS_RST_NR(0, 27),
         |          ^
>> drivers/soc/mediatek/mt8188-mmsys.h:141:3: error: use of undeclared identifier 'MT8188_VDO0_RST_APB_BUS'
     141 |         [MT8188_VDO0_RST_APB_BUS]       = MMSYS_RST_NR(0, 28),
         |          ^
>> drivers/soc/mediatek/mt8188-mmsys.h:142:3: error: use of undeclared identifier 'MT8188_VDO0_RST_DISP_COLOR0'
     142 |         [MT8188_VDO0_RST_DISP_COLOR0]   = MMSYS_RST_NR(0, 29),
         |          ^
>> drivers/soc/mediatek/mt8188-mmsys.h:143:3: error: use of undeclared identifier 'MT8188_VDO0_RST_MDP_WROT0'
     143 |         [MT8188_VDO0_RST_MDP_WROT0]     = MMSYS_RST_NR(0, 30),
         |          ^
>> drivers/soc/mediatek/mt8188-mmsys.h:144:3: error: use of undeclared identifier 'MT8188_VDO0_RST_DISP_RSZ0'
     144 |         [MT8188_VDO0_RST_DISP_RSZ0]     = MMSYS_RST_NR(0, 31),
         |          ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/MT8188_VDO0_RST_DISP_OVL0 +126 drivers/soc/mediatek/mt8188-mmsys.h

   124	
   125	static const u8 mmsys_mt8188_vdo0_rst_tb[] = {
 > 126		[MT8188_VDO0_RST_DISP_OVL0]	= MMSYS_RST_NR(0, 0),
 > 127		[MT8188_VDO0_RST_FAKE_ENG0]	= MMSYS_RST_NR(0, 2),
 > 128		[MT8188_VDO0_RST_DISP_CCORR0]	= MMSYS_RST_NR(0, 4),
 > 129		[MT8188_VDO0_RST_DISP_MUTEX0]	= MMSYS_RST_NR(0, 6),
 > 130		[MT8188_VDO0_RST_DISP_GAMMA0]	= MMSYS_RST_NR(0, 8),
 > 131		[MT8188_VDO0_RST_DISP_DITHER0]	= MMSYS_RST_NR(0, 10),
 > 132		[MT8188_VDO0_RST_DISP_WDMA0]	= MMSYS_RST_NR(0, 17),
 > 133		[MT8188_VDO0_RST_DISP_RDMA0]	= MMSYS_RST_NR(0, 19),
 > 134		[MT8188_VDO0_RST_DSI0]		= MMSYS_RST_NR(0, 21),
 > 135		[MT8188_VDO0_RST_DSI1]		= MMSYS_RST_NR(0, 22),
 > 136		[MT8188_VDO0_RST_DSC_WRAP0]	= MMSYS_RST_NR(0, 23),
 > 137		[MT8188_VDO0_RST_VPP_MERGE0]	= MMSYS_RST_NR(0, 24),
 > 138		[MT8188_VDO0_RST_DP_INTF0]	= MMSYS_RST_NR(0, 25),
 > 139		[MT8188_VDO0_RST_DISP_AAL0]	= MMSYS_RST_NR(0, 26),
 > 140		[MT8188_VDO0_RST_INLINEROT0]	= MMSYS_RST_NR(0, 27),
 > 141		[MT8188_VDO0_RST_APB_BUS]	= MMSYS_RST_NR(0, 28),
 > 142		[MT8188_VDO0_RST_DISP_COLOR0]	= MMSYS_RST_NR(0, 29),
 > 143		[MT8188_VDO0_RST_MDP_WROT0]	= MMSYS_RST_NR(0, 30),
 > 144		[MT8188_VDO0_RST_DISP_RSZ0]	= MMSYS_RST_NR(0, 31),
   145	};
   146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
