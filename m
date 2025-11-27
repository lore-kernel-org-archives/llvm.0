Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45296272E51;
	Thu, 27 Nov 2025 05:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764222711; cv=none; b=AJLQf9N0jqGP0obzNB5wQQkXj4IgJp6IbUIRo6qcNEsOJbwWIq+TtnTQ0zs4PLL8gSrqPOshqRE1Xw7dL6X9Bqthv7GIF0yPTLitsfYjbQ5J3hxSkIpz29nYWIaHLlufEZr/i4nGkUVLIh4SPas8cc5X1kiwgnbHdFjdx1I1u08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764222711; c=relaxed/simple;
	bh=3DphPOL4DrCXpPesqwFtoko5XCDyiQgSFPg1F1my2kg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H2kiKPfqDdhNshIkbtRzHYShndytNOyj/LqUYfZ8gClP5Ms1nkIW2TKLZ/r4n/GAUtErpa7dhoG9Xy+kzl8ocN5MGIy5bQnv4tsWTm/U5zE3XewnWBD+1k8i72wS1WjdDJmwizygmwhnseOnSVbs0MLsBdGzfJGh8TTSThJGI18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DgmHk5vt; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DgmHk5vt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764222709; x=1795758709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3DphPOL4DrCXpPesqwFtoko5XCDyiQgSFPg1F1my2kg=;
  b=DgmHk5vtwi20coYXXmrnd30ecqDsV9iYSpHpmeusUUdNGLPvhJ6P+tm7
   bJCVMqQlGbjIY1hDxMK5SfzylqfuwYoOA+eBu3IapyJFkbG4m+U79EIe4
   bkxc5QhpdiY4iHIoTjANSJ3/yrVetGLNRT4lsy7jyaAZITNixNfXz+E18
   AtGNwgOo+JIF0gV3yZriAorykoQmHapGA9H1FgTAKaRWfyu6CnC5N2GOD
   4UIkABDQpoO3lzcPjWhiGWJnfKiNfgHz49yc+3YweIt90zY4LK5UW5yOe
   VEdoi9PbYCbXeQDqZoYW7kZ1yAFM4rV5nFJsBQokCnUgor7BXFZFBcs+k
   Q==;
X-CSE-ConnectionGUID: ifWUNoacSlSWIO6juGZG2g==
X-CSE-MsgGUID: hGxToAylTWuFd29kW+hXag==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="91744604"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="91744604"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 21:51:47 -0800
X-CSE-ConnectionGUID: 5wOgVJrgTFKl2rAgaeZrUQ==
X-CSE-MsgGUID: ahGyaZCQRdyH1efHZcCFAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="216494807"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2025 21:51:46 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOUuu-000000003lJ-0cjA;
	Thu, 27 Nov 2025 05:51:44 +0000
Date: Thu, 27 Nov 2025 13:50:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jaroslav Kysela <perex@perex.cz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 11929/12398] sound/soc/codecs/nau8325.c:430:13:
 warning: variable 'n2_max' is uninitialized when used here
Message-ID: <202511271353.g6GYVUt6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jaroslav,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ef68bf704646690aba5e81c2f7be8d6ef13d7ad8
commit: cd41d3420ef658b2ca902d7677536ec8e25b610a [11929/12398] ASoC: nau8325: add missing build config
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20251127/202511271353.g6GYVUt6-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511271353.g6GYVUt6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511271353.g6GYVUt6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/nau8325.c:430:13: warning: variable 'n2_max' is uninitialized when used here [-Wuninitialized]
     430 |                 *n2_sel = n2_max;
         |                           ^~~~~~
   sound/soc/codecs/nau8325.c:389:52: note: initialize the variable 'n2_max' to silence this warning
     389 |         int i, j, mclk, mclk_max, ratio, ratio_sel, n2_max;
         |                                                           ^
         |                                                            = 0
>> sound/soc/codecs/nau8325.c:431:11: warning: variable 'ratio_sel' is uninitialized when used here [-Wuninitialized]
     431 |                 ratio = ratio_sel;
         |                         ^~~~~~~~~
   sound/soc/codecs/nau8325.c:389:44: note: initialize the variable 'ratio_sel' to silence this warning
     389 |         int i, j, mclk, mclk_max, ratio, ratio_sel, n2_max;
         |                                                   ^
         |                                                    = 0
   2 warnings generated.


vim +/n2_max +430 sound/soc/codecs/nau8325.c

c0a3873b9938bf Seven Lee 2024-03-27  384  
c0a3873b9938bf Seven Lee 2024-03-27  385  static int nau8325_clksrc_choose(struct nau8325 *nau8325,
c0a3873b9938bf Seven Lee 2024-03-27  386  				 const struct nau8325_srate_attr **srate_table,
c0a3873b9938bf Seven Lee 2024-03-27  387  				 int *n1_sel, int *mult_sel, int *n2_sel)
c0a3873b9938bf Seven Lee 2024-03-27  388  {
c0a3873b9938bf Seven Lee 2024-03-27  389  	int i, j, mclk, mclk_max, ratio, ratio_sel, n2_max;
c0a3873b9938bf Seven Lee 2024-03-27  390  
c0a3873b9938bf Seven Lee 2024-03-27  391  	if (!nau8325->mclk || !nau8325->fs)
c0a3873b9938bf Seven Lee 2024-03-27  392  		goto proc_err;
c0a3873b9938bf Seven Lee 2024-03-27  393  
c0a3873b9938bf Seven Lee 2024-03-27  394  	/* select sampling rate and MCLK_SRC */
c0a3873b9938bf Seven Lee 2024-03-27  395  	*srate_table = target_srate_attribute(nau8325->fs);
c0a3873b9938bf Seven Lee 2024-03-27  396  	if (!*srate_table)
c0a3873b9938bf Seven Lee 2024-03-27  397  		goto proc_err;
c0a3873b9938bf Seven Lee 2024-03-27  398  
c0a3873b9938bf Seven Lee 2024-03-27  399  	/* First check clock from MCLK directly, decide N2 for MCLK_SRC.
c0a3873b9938bf Seven Lee 2024-03-27  400  	 * If not good, consider 1/N1 and Multiplier.
c0a3873b9938bf Seven Lee 2024-03-27  401  	 */
c0a3873b9938bf Seven Lee 2024-03-27  402  	ratio = nau8325_clksrc_n2(nau8325, *srate_table, nau8325->mclk, n2_sel);
c0a3873b9938bf Seven Lee 2024-03-27  403  	if (ratio != NAU8325_MCLK_FS_RATIO_NUM) {
c0a3873b9938bf Seven Lee 2024-03-27  404  		*n1_sel = 0;
c0a3873b9938bf Seven Lee 2024-03-27  405  		*mult_sel = CLK_PROC_BYPASS;
c0a3873b9938bf Seven Lee 2024-03-27  406  		*n2_sel = MCLK_SRC;
c0a3873b9938bf Seven Lee 2024-03-27  407  		goto proc_done;
c0a3873b9938bf Seven Lee 2024-03-27  408  	}
c0a3873b9938bf Seven Lee 2024-03-27  409  
c0a3873b9938bf Seven Lee 2024-03-27  410  	/* Get MCLK_SRC through 1/N, Multiplier, and then 1/N2. */
c0a3873b9938bf Seven Lee 2024-03-27  411  	mclk_max = 0;
c0a3873b9938bf Seven Lee 2024-03-27  412  	for (i = 0; i < ARRAY_SIZE(mclk_n1_div); i++) {
c0a3873b9938bf Seven Lee 2024-03-27  413  		for (j = 0; j < ARRAY_SIZE(mclk_n3_mult); j++) {
c0a3873b9938bf Seven Lee 2024-03-27  414  			mclk = nau8325->mclk << mclk_n3_mult[j].param;
c0a3873b9938bf Seven Lee 2024-03-27  415  			mclk = mclk / mclk_n1_div[i].param;
c0a3873b9938bf Seven Lee 2024-03-27  416  			ratio = nau8325_clksrc_n2(nau8325,
c0a3873b9938bf Seven Lee 2024-03-27  417  						  *srate_table, mclk, n2_sel);
c0a3873b9938bf Seven Lee 2024-03-27  418  			if (ratio != NAU8325_MCLK_FS_RATIO_NUM &&
c0a3873b9938bf Seven Lee 2024-03-27  419  			    (mclk_max < mclk || i > *n1_sel)) {
c0a3873b9938bf Seven Lee 2024-03-27  420  				mclk_max = mclk;
c0a3873b9938bf Seven Lee 2024-03-27  421  				n2_max = *n2_sel;
c0a3873b9938bf Seven Lee 2024-03-27  422  				*n1_sel = i;
c0a3873b9938bf Seven Lee 2024-03-27  423  				*mult_sel = j;
c0a3873b9938bf Seven Lee 2024-03-27  424  				ratio_sel = ratio;
c0a3873b9938bf Seven Lee 2024-03-27  425  					goto proc_done;
c0a3873b9938bf Seven Lee 2024-03-27  426  			}
c0a3873b9938bf Seven Lee 2024-03-27  427  		}
c0a3873b9938bf Seven Lee 2024-03-27  428  	}
c0a3873b9938bf Seven Lee 2024-03-27  429  	if (mclk_max) {
c0a3873b9938bf Seven Lee 2024-03-27 @430  		*n2_sel = n2_max;
c0a3873b9938bf Seven Lee 2024-03-27 @431  		ratio = ratio_sel;
c0a3873b9938bf Seven Lee 2024-03-27  432  		goto proc_done;
c0a3873b9938bf Seven Lee 2024-03-27  433  	}
c0a3873b9938bf Seven Lee 2024-03-27  434  
c0a3873b9938bf Seven Lee 2024-03-27  435  proc_err:
c0a3873b9938bf Seven Lee 2024-03-27  436  	dev_dbg(nau8325->dev, "The MCLK %d is invalid. It can't get MCLK_SRC of 256/400/500 FS (%d)",
c0a3873b9938bf Seven Lee 2024-03-27  437  		nau8325->mclk, nau8325->fs);
c0a3873b9938bf Seven Lee 2024-03-27  438  	return -EINVAL;
c0a3873b9938bf Seven Lee 2024-03-27  439  proc_done:
c0a3873b9938bf Seven Lee 2024-03-27  440  	dev_dbg(nau8325->dev, "nau8325->fs=%d,range=0x%x, %s, (n1,mu,n2,dmu):(%d,%d,%d), MCLK_SRC=%uHz (%d)",
c0a3873b9938bf Seven Lee 2024-03-27  441  		nau8325->fs, (*srate_table)->range,
c0a3873b9938bf Seven Lee 2024-03-27  442  		(*srate_table)->max ? "MAX" : "MIN",
c0a3873b9938bf Seven Lee 2024-03-27  443  		*n1_sel == CLK_PROC_BYPASS ?
c0a3873b9938bf Seven Lee 2024-03-27  444  		CLK_PROC_BYPASS : mclk_n1_div[*n1_sel].param,
c0a3873b9938bf Seven Lee 2024-03-27  445  		*mult_sel == CLK_PROC_BYPASS ?
c0a3873b9938bf Seven Lee 2024-03-27  446  		CLK_PROC_BYPASS : 1 << mclk_n3_mult[*mult_sel].param,
c0a3873b9938bf Seven Lee 2024-03-27  447  		1 << mclk_n2_div[*n2_sel].param,
c0a3873b9938bf Seven Lee 2024-03-27  448  		(*srate_table)->mclk_src[ratio],
c0a3873b9938bf Seven Lee 2024-03-27  449  		(*srate_table)->mclk_src[ratio] / nau8325->fs);
c0a3873b9938bf Seven Lee 2024-03-27  450  
c0a3873b9938bf Seven Lee 2024-03-27  451  	return 0;
c0a3873b9938bf Seven Lee 2024-03-27  452  }
c0a3873b9938bf Seven Lee 2024-03-27  453  

:::::: The code at line 430 was first introduced by commit
:::::: c0a3873b9938bfaa77bd337cad33266a50a6583f ASoC: nau8325: new driver

:::::: TO: Seven Lee <wtli@nuvoton.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
