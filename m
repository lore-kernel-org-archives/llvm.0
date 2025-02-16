Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F961C27;
	Sun, 16 Feb 2025 00:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739665078; cv=none; b=QCgj5YDRcZPSfNMf6T1ll2uwHdLmC5hf5FBP7JZIuBx84ekA4cyE+i1Ikw/0e/HNLbh2EQOWiIUMwn6qBmywuKI2qxfTk0nukaqd7Ny93OusKrKZ3U05qXj2lgdI/Mm6Fvu6GN+pzzmpOr3cgIe08Vg4F0JfhPP6xrcQv+ijO74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739665078; c=relaxed/simple;
	bh=Wxe/sirA9BPRs6NIX+hVa9JubEtPfYa7fqoE5kljD48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cYL6t1gcaK60lNsiAr03a3gSJG5Soo/oLa9TzJGO+Ly3wcs6ycXuGO9w81VYDwfl7fxZVlJf97g2nNj6vR1p6u9D8Rd27bCI7n/eyRMKccQmml++NZGqIaddlroyuHqCscexVGCXt6oY1M1z6OfCPzTI8cpSzDuBExvSmkePCYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xq4s8EvG; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xq4s8EvG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739665076; x=1771201076;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wxe/sirA9BPRs6NIX+hVa9JubEtPfYa7fqoE5kljD48=;
  b=Xq4s8EvGHK1XMNqUDGd7yz/core5D9JBfUIpED825or8YJSHo03hNbFO
   GNynP6T99Zk0VRlCPgIwhkx2vZ62OVNQcAORNAkMmH19oaDkTXNJpfSUo
   JB/MlAwQ5xSfj4AE4wPxaLQqxD5VA9GZ4bWzgRO3AvQgtAOs6njIqpwza
   waR1M7M5K/hnRve71twkCyjaE9UBg/rgqA2DU5l6EKiLh0xNMpFlviK9X
   17uiG3oREuOk2RR+wsdAEMkhx7ePmQHqR99GG5kIl8udJsCHKaTdLrdJn
   eBNdEjisgPRTg1tTZfQxqs78RxHHP35y27Z+75hDYD1UcYhXNUypwuhXb
   Q==;
X-CSE-ConnectionGUID: gy8m7tVhQJykRVSfyjeDAQ==
X-CSE-MsgGUID: /wWTMTlMR7u5dZd0koa60Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40504095"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40504095"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 16:17:55 -0800
X-CSE-ConnectionGUID: JbPrqBdgQY2qkSsmzTdrcQ==
X-CSE-MsgGUID: AdJfKCfYSaemIRDnB58TQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,289,1732608000"; 
   d="scan'208";a="114413875"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Feb 2025 16:17:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjSM4-001BQp-1K;
	Sun, 16 Feb 2025 00:17:52 +0000
Date: Sun, 16 Feb 2025 08:17:47 +0800
From: kernel test robot <lkp@intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 1/3] ASoC: tas2781: Support dsp firmware Alpha and
 Beta seaies
Message-ID: <202502160812.P7szOygN-lkp@intel.com>
References: <20250212145601.1279-1-shenghao-ding@ti.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212145601.1279-1-shenghao-ding@ti.com>

Hi Shenghao,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.14-rc2 next-20250214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenghao-Ding/ASoC-tas2781-Support-dsp-firmware-Alpha-and-Beta-seaies/20250212-230044
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250212145601.1279-1-shenghao-ding%40ti.com
patch subject: [PATCH v1 1/3] ASoC: tas2781: Support dsp firmware Alpha and Beta seaies
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250216/202502160812.P7szOygN-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250216/202502160812.P7szOygN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502160812.P7szOygN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/pci/hda/tas2781_spi_fwlib.c:373:30: error: use of undeclared identifier 'PPC3_VERSION_TAS2781'
     373 |         if (fw_fixed_hdr->ppcver >= PPC3_VERSION_TAS2781) {
         |                                     ^
>> sound/pci/hda/tas2781_spi_fwlib.c:376:37: error: use of undeclared identifier 'PPC3_VERSION'
     376 |         } else if (fw_fixed_hdr->ppcver >= PPC3_VERSION) {
         |                                            ^
   sound/pci/hda/tas2781_spi_fwlib.c:1608:17: error: use of undeclared identifier 'PPC3_VERSION'
    1608 |                 if (ppcver >= PPC3_VERSION) {
         |                               ^
   3 errors generated.


vim +/PPC3_VERSION_TAS2781 +373 sound/pci/hda/tas2781_spi_fwlib.c

bb5f86ea50ffb2 Baojun Xu 2024-12-16  361  
bb5f86ea50ffb2 Baojun Xu 2024-12-16  362  /* fixed m68k compiling issue: mapping table can save code field */
bb5f86ea50ffb2 Baojun Xu 2024-12-16  363  static unsigned char map_dev_idx(struct tasdevice_fw *tas_fmw,
bb5f86ea50ffb2 Baojun Xu 2024-12-16  364  	struct tasdev_blk *block)
bb5f86ea50ffb2 Baojun Xu 2024-12-16  365  {
bb5f86ea50ffb2 Baojun Xu 2024-12-16  366  	struct blktyp_devidx_map *p =
bb5f86ea50ffb2 Baojun Xu 2024-12-16  367  		(struct blktyp_devidx_map *)non_ppc3_mapping_table;
bb5f86ea50ffb2 Baojun Xu 2024-12-16  368  	struct tasdevice_dspfw_hdr *fw_hdr = &tas_fmw->fw_hdr;
bb5f86ea50ffb2 Baojun Xu 2024-12-16  369  	struct tasdevice_fw_fixed_hdr *fw_fixed_hdr = &fw_hdr->fixed_hdr;
bb5f86ea50ffb2 Baojun Xu 2024-12-16  370  	int i, n = ARRAY_SIZE(non_ppc3_mapping_table);
bb5f86ea50ffb2 Baojun Xu 2024-12-16  371  	unsigned char dev_idx = 0;
bb5f86ea50ffb2 Baojun Xu 2024-12-16  372  
bb5f86ea50ffb2 Baojun Xu 2024-12-16 @373  	if (fw_fixed_hdr->ppcver >= PPC3_VERSION_TAS2781) {
bb5f86ea50ffb2 Baojun Xu 2024-12-16  374  		p = (struct blktyp_devidx_map *)ppc3_tas2781_mapping_table;
bb5f86ea50ffb2 Baojun Xu 2024-12-16  375  		n = ARRAY_SIZE(ppc3_tas2781_mapping_table);
bb5f86ea50ffb2 Baojun Xu 2024-12-16 @376  	} else if (fw_fixed_hdr->ppcver >= PPC3_VERSION) {
bb5f86ea50ffb2 Baojun Xu 2024-12-16  377  		p = (struct blktyp_devidx_map *)ppc3_mapping_table;
bb5f86ea50ffb2 Baojun Xu 2024-12-16  378  		n = ARRAY_SIZE(ppc3_mapping_table);
bb5f86ea50ffb2 Baojun Xu 2024-12-16  379  	}
bb5f86ea50ffb2 Baojun Xu 2024-12-16  380  
bb5f86ea50ffb2 Baojun Xu 2024-12-16  381  	for (i = 0; i < n; i++) {
bb5f86ea50ffb2 Baojun Xu 2024-12-16  382  		if (block->type == p[i].blktyp) {
bb5f86ea50ffb2 Baojun Xu 2024-12-16  383  			dev_idx = p[i].dev_idx;
bb5f86ea50ffb2 Baojun Xu 2024-12-16  384  			break;
bb5f86ea50ffb2 Baojun Xu 2024-12-16  385  		}
bb5f86ea50ffb2 Baojun Xu 2024-12-16  386  	}
bb5f86ea50ffb2 Baojun Xu 2024-12-16  387  
bb5f86ea50ffb2 Baojun Xu 2024-12-16  388  	return dev_idx;
bb5f86ea50ffb2 Baojun Xu 2024-12-16  389  }
bb5f86ea50ffb2 Baojun Xu 2024-12-16  390  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
