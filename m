Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DAD21A16;
	Tue, 21 Nov 2023 07:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d2+exg/r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700551817; x=1732087817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fpW2D7oS5lGRDAw1D6pl11Ms+T1euHvtcTUAeVr99T0=;
  b=d2+exg/rlGqy3TnZkOltgzdjw6h0vexiT8qtBwlhi6lFfF4CF/9fG568
   bQI9x+3rMQSyFS6l1hWDaFXWKGAvAXsCNnTR7NYetjI/WU+liWnkkBK2x
   yFYl7UhU9pYfegGNome80cP2rtWkLh2Ouw+liEJ+Ccxc7/2xY0p1dKd9N
   SUIgB4+eukKC/N7HX56GrBXEPG7SA785sXXSgHihmIqHIbSbImhjsUf00
   2uKRXkWtOOLCvJEIYxxl1gZSw9w2+XJ7HBzWFDMzzb6McKcMRfPXu8stB
   vRLHoDrxmh5YMhq0O47Tmbltve1J1L5+pEK20a+3O/tg8eS2q8xrnhiBy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="422883119"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="422883119"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 23:30:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="770164651"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="770164651"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 20 Nov 2023 23:30:12 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5LD0-0007VV-1u;
	Tue, 21 Nov 2023 07:30:10 +0000
Date: Tue, 21 Nov 2023 15:21:10 +0800
From: kernel test robot <lkp@intel.com>
To: Hsiao Chien Sung <shawn.sung@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [mediatek:v6.7-tmp/soc 7/7]
 drivers/soc/mediatek/mt8188-mmsys.h:126:3: error: use of undeclared
 identifier 'MT8188_VDO0_RST_DISP_OVL0'
Message-ID: <202311211559.hXmHshEO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git v6.7-tmp/soc
head:   c1b652b84e6a779e670bac250d80ef2f2d4a45d9
commit: c1b652b84e6a779e670bac250d80ef2f2d4a45d9 [7/7] soc: mediatek: Add MT8188 VDOSYS reset bit map
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231121/202311211559.hXmHshEO-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311211559.hXmHshEO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311211559.hXmHshEO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/soc/mediatek/mtk-mmsys.c:21:
>> drivers/soc/mediatek/mt8188-mmsys.h:126:3: error: use of undeclared identifier 'MT8188_VDO0_RST_DISP_OVL0'
           [MT8188_VDO0_RST_DISP_OVL0]     = MMSYS_RST_NR(0, 0),
            ^
>> drivers/soc/mediatek/mt8188-mmsys.h:127:3: error: use of undeclared identifier 'MT8188_VDO0_RST_FAKE_ENG0'
           [MT8188_VDO0_RST_FAKE_ENG0]     = MMSYS_RST_NR(0, 2),
            ^
>> drivers/soc/mediatek/mt8188-mmsys.h:128:3: error: use of undeclared identifier 'MT8188_VDO0_RST_DISP_CCORR0'
           [MT8188_VDO0_RST_DISP_CCORR0]   = MMSYS_RST_NR(0, 4),
            ^
>> drivers/soc/mediatek/mt8188-mmsys.h:129:3: error: use of undeclared identifier 'MT8188_VDO0_RST_DISP_MUTEX0'
           [MT8188_VDO0_RST_DISP_MUTEX0]   = MMSYS_RST_NR(0, 6),
            ^
>> drivers/soc/mediatek/mt8188-mmsys.h:130:3: error: use of undeclared identifier 'MT8188_VDO0_RST_DISP_GAMMA0'
           [MT8188_VDO0_RST_DISP_GAMMA0]   = MMSYS_RST_NR(0, 8),
            ^
>> drivers/soc/mediatek/mt8188-mmsys.h:131:3: error: use of undeclared identifier 'MT8188_VDO0_RST_DISP_DITHER0'
           [MT8188_VDO0_RST_DISP_DITHER0]  = MMSYS_RST_NR(0, 10),
            ^
>> drivers/soc/mediatek/mt8188-mmsys.h:132:3: error: use of undeclared identifier 'MT8188_VDO0_RST_DISP_WDMA0'
           [MT8188_VDO0_RST_DISP_WDMA0]    = MMSYS_RST_NR(0, 17),
            ^
>> drivers/soc/mediatek/mt8188-mmsys.h:133:3: error: use of undeclared identifier 'MT8188_VDO0_RST_DISP_RDMA0'
           [MT8188_VDO0_RST_DISP_RDMA0]    = MMSYS_RST_NR(0, 19),
            ^
>> drivers/soc/mediatek/mt8188-mmsys.h:134:3: error: use of undeclared identifier 'MT8188_VDO0_RST_DSI0'
           [MT8188_VDO0_RST_DSI0]          = MMSYS_RST_NR(0, 21),
            ^
>> drivers/soc/mediatek/mt8188-mmsys.h:135:3: error: use of undeclared identifier 'MT8188_VDO0_RST_DSI1'
           [MT8188_VDO0_RST_DSI1]          = MMSYS_RST_NR(0, 22),
            ^
>> drivers/soc/mediatek/mt8188-mmsys.h:136:3: error: use of undeclared identifier 'MT8188_VDO0_RST_DSC_WRAP0'
           [MT8188_VDO0_RST_DSC_WRAP0]     = MMSYS_RST_NR(0, 23),
            ^
>> drivers/soc/mediatek/mt8188-mmsys.h:137:3: error: use of undeclared identifier 'MT8188_VDO0_RST_VPP_MERGE0'
           [MT8188_VDO0_RST_VPP_MERGE0]    = MMSYS_RST_NR(0, 24),
            ^
>> drivers/soc/mediatek/mt8188-mmsys.h:138:3: error: use of undeclared identifier 'MT8188_VDO0_RST_DP_INTF0'
           [MT8188_VDO0_RST_DP_INTF0]      = MMSYS_RST_NR(0, 25),
            ^
>> drivers/soc/mediatek/mt8188-mmsys.h:139:3: error: use of undeclared identifier 'MT8188_VDO0_RST_DISP_AAL0'
           [MT8188_VDO0_RST_DISP_AAL0]     = MMSYS_RST_NR(0, 26),
            ^
>> drivers/soc/mediatek/mt8188-mmsys.h:140:3: error: use of undeclared identifier 'MT8188_VDO0_RST_INLINEROT0'
           [MT8188_VDO0_RST_INLINEROT0]    = MMSYS_RST_NR(0, 27),
            ^
>> drivers/soc/mediatek/mt8188-mmsys.h:141:3: error: use of undeclared identifier 'MT8188_VDO0_RST_APB_BUS'
           [MT8188_VDO0_RST_APB_BUS]       = MMSYS_RST_NR(0, 28),
            ^
>> drivers/soc/mediatek/mt8188-mmsys.h:142:3: error: use of undeclared identifier 'MT8188_VDO0_RST_DISP_COLOR0'
           [MT8188_VDO0_RST_DISP_COLOR0]   = MMSYS_RST_NR(0, 29),
            ^
>> drivers/soc/mediatek/mt8188-mmsys.h:143:3: error: use of undeclared identifier 'MT8188_VDO0_RST_MDP_WROT0'
           [MT8188_VDO0_RST_MDP_WROT0]     = MMSYS_RST_NR(0, 30),
            ^
>> drivers/soc/mediatek/mt8188-mmsys.h:144:3: error: use of undeclared identifier 'MT8188_VDO0_RST_DISP_RSZ0'
           [MT8188_VDO0_RST_DISP_RSZ0]     = MMSYS_RST_NR(0, 31),
            ^
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
