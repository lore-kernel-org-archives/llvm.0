Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CCE14B08C;
	Sun,  1 Sep 2024 09:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725183165; cv=none; b=NYl6jsPR1EfeXaGvWjohTRUwLf1W5ELf3sOepvDcr672Biu3Olfigx9Ua7fVsEK6ixKUKfy77F8FVUcPUMZZycyTRBBptr7pL5dNqXYFTspoP1lzJz3HCN8hUcK8T3QW+mPru+JzPTcnGmx4KJHLfPFltgpm2fF0gKVr7q21lEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725183165; c=relaxed/simple;
	bh=Xh7Ul2amblpV3BZ+Gj0m4RxwCVLxqbqEm+l29WZmAAI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tSmltXnTpWAA088YCcwTShfV8EQx0wphMIS4E7x63a/Lh/0oM6l6xuqfen93U8nVzVdZbpCcGStk8D77pKixEq5OyU1Ylhd+2xxJxWVands4Xi1qW11qQvJodOg+UTqjDXzrv3z6fjKYQUU5xqq1JZkrtcke1CvUNQRRC0GwHVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qai/A1Qo; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qai/A1Qo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725183163; x=1756719163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xh7Ul2amblpV3BZ+Gj0m4RxwCVLxqbqEm+l29WZmAAI=;
  b=Qai/A1Qo/WY/rARButgq9eYKWahIwYur6TbVJWtJtLUS5VQb8j50bgNg
   6PdGM7MkFMDpKyHv3fyEqaFxA8xEsM+AL3YaVTQuoqbFjRuaVVtnYeAPT
   cqZGlkI93OFsLtk/YsK308zlV45KcCh5l9X/gbM54Qr44P5kNJ2DPZPJV
   EHnV4xg7OLp4Ei54l8u69tT6C4UZM8m03ahmeHWljDDByNutCm6vYXrOC
   dleg/RykJM5CYx66pWRIx/TFKFCYs3G7S9L4TMhJnVowWbTZrxOStrCdY
   8MDkq2rI/jIA3lWb40ZBO8FxdDD5FTuh3cPzo2oWgoMTtCQe3ASSpNHMr
   Q==;
X-CSE-ConnectionGUID: hHx0Hyq0TH6TnoAf29UfVw==
X-CSE-MsgGUID: S8ysmMSdS0ehpWB/w5g6Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23583832"
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="23583832"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 02:32:41 -0700
X-CSE-ConnectionGUID: Juak792ITIqdJJtfFFREVA==
X-CSE-MsgGUID: PO+AFNaFTSqsP5cP6obQcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="64500202"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 Sep 2024 02:32:40 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skgwn-0003Zc-2y;
	Sun, 01 Sep 2024 09:32:37 +0000
Date: Sun, 1 Sep 2024 17:32:24 +0800
From: kernel test robot <lkp@intel.com>
To: liangshuang <liangshuang@eswincomputing.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Subject: [esmil:eic7700 16/20] drivers/mmc/host/sdhci-of-eswin.c:370:6:
 warning: no previous prototype for function 'eswin_sdhci_set_uhs_signaling'
Message-ID: <202409011705.o88HoAi9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux eic7700
head:   eb44174b12f99d320be704b45db6b994f6a014bd
commit: 807d8cb96b00273346bd500bedd125d06921c3f3 [16/20] drivers: mmc: Add ESWIN mmc drivers
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240901/202409011705.o88HoAi9-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 08e5a1de8227512d4774a534b91cb2353cef6284)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409011705.o88HoAi9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409011705.o88HoAi9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mmc/host/sdhci-of-eswin.c:27:
   In file included from include/linux/phy/phy.h:17:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:25:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:22:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:510:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     510 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     511 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:523:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     523 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     524 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mmc/host/sdhci-of-eswin.c:370:6: warning: no previous prototype for function 'eswin_sdhci_set_uhs_signaling' [-Wmissing-prototypes]
     370 | void eswin_sdhci_set_uhs_signaling(struct sdhci_host *host, unsigned timing)
         |      ^
   drivers/mmc/host/sdhci-of-eswin.c:370:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     370 | void eswin_sdhci_set_uhs_signaling(struct sdhci_host *host, unsigned timing)
         | ^
         | static 
>> drivers/mmc/host/sdhci-of-eswin.c:897:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     897 |         if (!eswin_sdhci->core_clk_reg) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/sdhci-of-eswin.c:1020:9: note: uninitialized use occurs here
    1020 |         return ret;
         |                ^~~
   drivers/mmc/host/sdhci-of-eswin.c:897:2: note: remove the 'if' if its condition is always false
     897 |         if (!eswin_sdhci->core_clk_reg) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     898 |                 dev_err(dev, "ioremap core clk reg failed.\n");
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     899 |                 goto err_pltfm_free;
         |                 ~~~~~~~~~~~~~~~~~~~~
     900 |         }
         |         ~
   drivers/mmc/host/sdhci-of-eswin.c:876:9: note: initialize the variable 'ret' to silence this warning
     876 |         int ret;
         |                ^
         |                 = 0
   6 warnings generated.
--
>> drivers/mmc/host/sdhci-eswin.c:194: warning: expecting prototype for eswin_dt_parse_clk_phases(). Prototype was for eswin_sdhci_dt_parse_clk_phases() instead
--
>> drivers/mmc/host/sdhci-of-eswin-sdio.c:565: warning: Function parameter or struct member 'eswin_sdhci_sdio' not described in 'eswin_sdhci_sdio_register_sdcardclk'
>> drivers/mmc/host/sdhci-of-eswin-sdio.c:565: warning: Excess function parameter 'sdhci_arasan' description in 'eswin_sdhci_sdio_register_sdcardclk'
>> drivers/mmc/host/sdhci-of-eswin-sdio.c:616: warning: Function parameter or struct member 'eswin_sdhci_sdio' not described in 'eswin_sdhci_sdio_register_sampleclk'
>> drivers/mmc/host/sdhci-of-eswin-sdio.c:616: warning: Excess function parameter 'sdhci_arasan' description in 'eswin_sdhci_sdio_register_sampleclk'


vim +/eswin_sdhci_set_uhs_signaling +370 drivers/mmc/host/sdhci-of-eswin.c

   369	
 > 370	void eswin_sdhci_set_uhs_signaling(struct sdhci_host *host, unsigned timing)
   371	{
   372		u32 val;
   373		u32 status;
   374		u32 timeout = 0;
   375		u16 ctrl_2;
   376	
   377		ctrl_2 = sdhci_readw(host, SDHCI_HOST_CONTROL2);
   378		/* Select Bus Speed Mode for host */
   379		ctrl_2 &= ~SDHCI_CTRL_UHS_MASK;
   380		if ((timing == MMC_TIMING_MMC_HS200) ||
   381		    (timing == MMC_TIMING_UHS_SDR104))
   382			ctrl_2 |= SDHCI_CTRL_UHS_SDR104;
   383		else if (timing == MMC_TIMING_UHS_SDR12)
   384			ctrl_2 |= SDHCI_CTRL_UHS_SDR12;
   385		else if (timing == MMC_TIMING_UHS_SDR25)
   386			ctrl_2 |= SDHCI_CTRL_UHS_SDR25;
   387		else if (timing == MMC_TIMING_UHS_SDR50)
   388			ctrl_2 |= SDHCI_CTRL_UHS_SDR50;
   389		else if ((timing == MMC_TIMING_UHS_DDR50) ||
   390			 (timing == MMC_TIMING_MMC_DDR52))
   391			ctrl_2 |= SDHCI_CTRL_UHS_DDR50;
   392		else if (timing == MMC_TIMING_MMC_HS400)
   393			ctrl_2 |= ESWIN_SDHCI_CTRL_HS400; /* Non-standard */
   394		sdhci_writew(host, ctrl_2, SDHCI_HOST_CONTROL2);
   395	
   396	
   397		/*
   398		 * here need make dll locked when in hs400 at 200MHz
   399		 */
   400		if ((timing == MMC_TIMING_MMC_HS400) && (host->clock == 200000000)) {
   401			eswin_sdhci_disable_card_clk(host);
   402	
   403			val = sdhci_readl(host, VENDOR_AT_CTRL_R);
   404			val &= ~(LATENCY_LT_MASK << LATENCY_LT_BIT_OFFSET);
   405			val |= (LATENCY_LT_3 << LATENCY_LT_MASK);
   406			sdhci_writel(host, val, VENDOR_AT_CTRL_R);
   407	
   408			sdhci_writeb(host, 0x23, PHY_DLL_CNFG1_R);
   409			sdhci_writeb(host, 0x02, PHY_DLL_CNFG2_R);
   410			sdhci_writeb(host, 0x60, PHY_DLLDL_CNFG_R);
   411			sdhci_writeb(host, 0x00, PHY_DLL_OFFST_R);
   412			sdhci_writew(host, 0xffff, PHY_DLLBT_CNFG_R);
   413	
   414			eswin_sdhci_enable_card_clk(host);
   415			sdhci_writeb(host, DLL_ENABEL, PHY_DLL_CTRL_R);
   416			udelay(100);
   417	
   418			while (1) {
   419				status = sdhci_readb(host, PHY_DLL_STATUS_R);
   420				if (status & DLL_LOCK_STS) {
   421					pr_debug("%s: locked status:0x%x\n", mmc_hostname(host->mmc), status);
   422					break;
   423				}
   424				timeout++;
   425				udelay(100);
   426				if (timeout > 10000) {
   427					pr_err("%s: DLL lock failed!status:0x%x\n",
   428						mmc_hostname(host->mmc), status);
   429					return;
   430				}
   431			}
   432	
   433			status = sdhci_readb(host, PHY_DLL_STATUS_R);
   434			if (status & DLL_ERROR_STS) {
   435				pr_err("%s: DLL lock failed!err_status:0x%x\n",
   436					mmc_hostname(host->mmc), status);
   437			} else {
   438				pr_debug("%s: DLL lock is success\n", mmc_hostname(host->mmc));
   439			}
   440		}
   441	}
   442	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
