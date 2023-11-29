Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F8D38FB7;
	Wed, 29 Nov 2023 15:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j+/aOngd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701272623; x=1732808623;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RWKqb7LPJnLALVL46qWANs+JrChdKL0G1J3UhxdaV7E=;
  b=j+/aOngdo+CS0zidQ5Lr+PBvN+ix7KpWUeNy9oH7W9zx5wfSpnxRgiUR
   nDBU8GldNL6siz05neExDx8GATzWyW+jik3u4ZgSqUrI+O2ZZDiZPIfFo
   h+RIYCRNS+J8ZamvIzVSBcyfoONwjzXmNrsDJcxooNwFtjxPZw71FGvu5
   3E+lnGavEn18ee8ADEXhHyrsIG+24/wBEEoMhZufBn0TlijWJ/UWK8GhH
   vKDFcRKNZRNillPN9WCLtaXHSkEKGI34Pjyittv2mxU5M7wZyPdVrswVs
   sd6+GUezlnUwCVjEQStPiRJSdOAO8sjfrx96BGmoGYQFKteP2AH42iJ/h
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="83297"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="83297"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 07:43:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="839470244"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="839470244"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 29 Nov 2023 07:43:37 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8Mis-0000Op-2y;
	Wed, 29 Nov 2023 15:43:34 +0000
Date: Wed, 29 Nov 2023 23:42:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jorge Ramirez-Ortiz <jorge@foundries.io>, ulf.hansson@linaro.org,
	adrian.hunter@intel.com, CLoehle@hyperstone.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, axboe@kernel.dk,
	jinpu.wang@ionos.com, beanhuo@micron.com, yibin.ding@unisoc.com,
	f.fainelli@gmail.com, asuk4.q@gmail.com,
	victor.shih@genesyslogic.com.tw, marex@denx.de,
	rafael.beims@toradex.com, robimarko@gmail.com, ricardo@foundries.io
Subject: Re: [PATCH] mmc: rpmb: add quirk MMC_QUIRK_BROKEN_RPMB_RETUNE
Message-ID: <202311292325.iWCDyrUn-lkp@intel.com>
References: <20231129094350.2605322-1-jorge@foundries.io>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129094350.2605322-1-jorge@foundries.io>

Hi Jorge,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.7-rc3 next-20231129]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jorge-Ramirez-Ortiz/mmc-rpmb-add-quirk-MMC_QUIRK_BROKEN_RPMB_RETUNE/20231129-181517
base:   linus/master
patch link:    https://lore.kernel.org/r/20231129094350.2605322-1-jorge%40foundries.io
patch subject: [PATCH] mmc: rpmb: add quirk MMC_QUIRK_BROKEN_RPMB_RETUNE
config: x86_64-rhel-8.3-bpf (https://download.01.org/0day-ci/archive/20231129/202311292325.iWCDyrUn-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231129/202311292325.iWCDyrUn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311292325.iWCDyrUn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/mmc/core/mmc.c:27:
>> drivers/mmc/core/quirks.h:137:22: error: use of undeclared identifier 'CIF_MANFID_SANDISK2'
           MMC_FIXUP("DG4064", CIF_MANFID_SANDISK2, 0x100, add_quirk_mmc,
                               ^
   drivers/mmc/core/mmc.c:115:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   card->cid.serial        = UNSTUFF_BITS(resp, 16, 32);
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/mmc.c:57:39: note: expanded from macro 'UNSTUFF_BITS'
                   const u32 __mask = (__size < 32 ? 1 << __size : 0) - 1; \
                                                       ^  ~~~~~~
   1 warning and 1 error generated.
--
   In file included from drivers/mmc/core/sdio.c:23:
>> drivers/mmc/core/quirks.h:137:22: error: use of undeclared identifier 'CIF_MANFID_SANDISK2'
           MMC_FIXUP("DG4064", CIF_MANFID_SANDISK2, 0x100, add_quirk_mmc,
                               ^
   1 error generated.


vim +/CIF_MANFID_SANDISK2 +137 drivers/mmc/core/quirks.h

    17	
    18	static const struct mmc_fixup __maybe_unused mmc_blk_fixups[] = {
    19	#define INAND_CMD38_ARG_EXT_CSD  113
    20	#define INAND_CMD38_ARG_ERASE    0x00
    21	#define INAND_CMD38_ARG_TRIM     0x01
    22	#define INAND_CMD38_ARG_SECERASE 0x80
    23	#define INAND_CMD38_ARG_SECTRIM1 0x81
    24	#define INAND_CMD38_ARG_SECTRIM2 0x88
    25		/* CMD38 argument is passed through EXT_CSD[113] */
    26		MMC_FIXUP("SEM02G", CID_MANFID_SANDISK, 0x100, add_quirk,
    27			  MMC_QUIRK_INAND_CMD38),
    28		MMC_FIXUP("SEM04G", CID_MANFID_SANDISK, 0x100, add_quirk,
    29			  MMC_QUIRK_INAND_CMD38),
    30		MMC_FIXUP("SEM08G", CID_MANFID_SANDISK, 0x100, add_quirk,
    31			  MMC_QUIRK_INAND_CMD38),
    32		MMC_FIXUP("SEM16G", CID_MANFID_SANDISK, 0x100, add_quirk,
    33			  MMC_QUIRK_INAND_CMD38),
    34		MMC_FIXUP("SEM32G", CID_MANFID_SANDISK, 0x100, add_quirk,
    35			  MMC_QUIRK_INAND_CMD38),
    36	
    37		/*
    38		 * Some MMC cards experience performance degradation with CMD23
    39		 * instead of CMD12-bounded multiblock transfers. For now we'll
    40		 * black list what's bad...
    41		 * - Certain Toshiba cards.
    42		 *
    43		 * N.B. This doesn't affect SD cards.
    44		 */
    45		MMC_FIXUP("SDMB-32", CID_MANFID_SANDISK, CID_OEMID_ANY, add_quirk_mmc,
    46			  MMC_QUIRK_BLK_NO_CMD23),
    47		MMC_FIXUP("SDM032", CID_MANFID_SANDISK, CID_OEMID_ANY, add_quirk_mmc,
    48			  MMC_QUIRK_BLK_NO_CMD23),
    49		MMC_FIXUP("MMC08G", CID_MANFID_TOSHIBA, CID_OEMID_ANY, add_quirk_mmc,
    50			  MMC_QUIRK_BLK_NO_CMD23),
    51		MMC_FIXUP("MMC16G", CID_MANFID_TOSHIBA, CID_OEMID_ANY, add_quirk_mmc,
    52			  MMC_QUIRK_BLK_NO_CMD23),
    53		MMC_FIXUP("MMC32G", CID_MANFID_TOSHIBA, CID_OEMID_ANY, add_quirk_mmc,
    54			  MMC_QUIRK_BLK_NO_CMD23),
    55	
    56		/*
    57		 * Kingston Canvas Go! Plus microSD cards never finish SD cache flush.
    58		 * This has so far only been observed on cards from 11/2019, while new
    59		 * cards from 2023/05 do not exhibit this behavior.
    60		 */
    61		_FIXUP_EXT("SD64G", CID_MANFID_KINGSTON_SD, 0x5449, 2019, 11,
    62			   0, -1ull, SDIO_ANY_ID, SDIO_ANY_ID, add_quirk_sd,
    63			   MMC_QUIRK_BROKEN_SD_CACHE, EXT_CSD_REV_ANY),
    64	
    65		/*
    66		 * Some SD cards lockup while using CMD23 multiblock transfers.
    67		 */
    68		MMC_FIXUP("AF SD", CID_MANFID_ATP, CID_OEMID_ANY, add_quirk_sd,
    69			  MMC_QUIRK_BLK_NO_CMD23),
    70		MMC_FIXUP("APUSD", CID_MANFID_APACER, 0x5048, add_quirk_sd,
    71			  MMC_QUIRK_BLK_NO_CMD23),
    72	
    73		/*
    74		 * Some MMC cards need longer data read timeout than indicated in CSD.
    75		 */
    76		MMC_FIXUP(CID_NAME_ANY, CID_MANFID_MICRON, 0x200, add_quirk_mmc,
    77			  MMC_QUIRK_LONG_READ_TIME),
    78		MMC_FIXUP("008GE0", CID_MANFID_TOSHIBA, CID_OEMID_ANY, add_quirk_mmc,
    79			  MMC_QUIRK_LONG_READ_TIME),
    80	
    81		/*
    82		 * On these Samsung MoviNAND parts, performing secure erase or
    83		 * secure trim can result in unrecoverable corruption due to a
    84		 * firmware bug.
    85		 */
    86		MMC_FIXUP("M8G2FA", CID_MANFID_SAMSUNG, CID_OEMID_ANY, add_quirk_mmc,
    87			  MMC_QUIRK_SEC_ERASE_TRIM_BROKEN),
    88		MMC_FIXUP("MAG4FA", CID_MANFID_SAMSUNG, CID_OEMID_ANY, add_quirk_mmc,
    89			  MMC_QUIRK_SEC_ERASE_TRIM_BROKEN),
    90		MMC_FIXUP("MBG8FA", CID_MANFID_SAMSUNG, CID_OEMID_ANY, add_quirk_mmc,
    91			  MMC_QUIRK_SEC_ERASE_TRIM_BROKEN),
    92		MMC_FIXUP("MCGAFA", CID_MANFID_SAMSUNG, CID_OEMID_ANY, add_quirk_mmc,
    93			  MMC_QUIRK_SEC_ERASE_TRIM_BROKEN),
    94		MMC_FIXUP("VAL00M", CID_MANFID_SAMSUNG, CID_OEMID_ANY, add_quirk_mmc,
    95			  MMC_QUIRK_SEC_ERASE_TRIM_BROKEN),
    96		MMC_FIXUP("VYL00M", CID_MANFID_SAMSUNG, CID_OEMID_ANY, add_quirk_mmc,
    97			  MMC_QUIRK_SEC_ERASE_TRIM_BROKEN),
    98		MMC_FIXUP("KYL00M", CID_MANFID_SAMSUNG, CID_OEMID_ANY, add_quirk_mmc,
    99			  MMC_QUIRK_SEC_ERASE_TRIM_BROKEN),
   100		MMC_FIXUP("VZL00M", CID_MANFID_SAMSUNG, CID_OEMID_ANY, add_quirk_mmc,
   101			  MMC_QUIRK_SEC_ERASE_TRIM_BROKEN),
   102	
   103		/*
   104		 *  On Some Kingston eMMCs, performing trim can result in
   105		 *  unrecoverable data conrruption occasionally due to a firmware bug.
   106		 */
   107		MMC_FIXUP("V10008", CID_MANFID_KINGSTON, CID_OEMID_ANY, add_quirk_mmc,
   108			  MMC_QUIRK_TRIM_BROKEN),
   109		MMC_FIXUP("V10016", CID_MANFID_KINGSTON, CID_OEMID_ANY, add_quirk_mmc,
   110			  MMC_QUIRK_TRIM_BROKEN),
   111	
   112		/*
   113		 * Micron MTFC4GACAJCN-1M supports TRIM but does not appear to support
   114		 * WRITE_ZEROES offloading. It also supports caching, but the cache can
   115		 * only be flushed after a write has occurred.
   116		 */
   117		MMC_FIXUP("Q2J54A", CID_MANFID_MICRON, 0x014e, add_quirk_mmc,
   118			  MMC_QUIRK_TRIM_BROKEN | MMC_QUIRK_BROKEN_CACHE_FLUSH),
   119	
   120		/*
   121		 * Kingston EMMC04G-M627 advertises TRIM but it does not seems to
   122		 * support being used to offload WRITE_ZEROES.
   123		 */
   124		MMC_FIXUP("M62704", CID_MANFID_KINGSTON, 0x0100, add_quirk_mmc,
   125			  MMC_QUIRK_TRIM_BROKEN),
   126	
   127		/*
   128		 * Some SD cards reports discard support while they don't
   129		 */
   130		MMC_FIXUP(CID_NAME_ANY, CID_MANFID_SANDISK_SD, 0x5344, add_quirk_sd,
   131			  MMC_QUIRK_BROKEN_SD_DISCARD),
   132	
   133		/*
   134		 * SanDisk iNAND 7250 DDG4064, this quirk shall disable the retune
   135		 * operation enforced by default when switching to RPMB.
   136		 */
 > 137		MMC_FIXUP("DG4064", CIF_MANFID_SANDISK2, 0x100, add_quirk_mmc,
   138			  MMC_QUIRK_BROKEN_RPMB_RETUNE),
   139	
   140		END_FIXUP
   141	};
   142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
