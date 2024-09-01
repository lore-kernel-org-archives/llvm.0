Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5F32BAF3;
	Sun,  1 Sep 2024 07:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725175121; cv=none; b=DIW3r0Do0numxtdmHkFFHLzCf6PmQD9LvVM+RUkPPE+azPVcPchucCmEkpFXeXxrnjqCb+ebI1j1LMHcDvaoaelMmqOUrAgAd3be2i7/MFqJAMxpA98Ubs1U3R2By34ovY/79D3rPKq0HY2ZGeUzO/LxHk4kZw4E7WrghvQAGYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725175121; c=relaxed/simple;
	bh=PBFLBJBX7Pbtyxt0jcF5LM1PCQfKzUdL4y8cIrPkGcM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hON/RbGnAz/Coa4qsudYIa0ivFJg0IwjYNaIleESvsSyrJtR5YueE/nHdX8a3PPfFB2/gZahnpXwvycSH00eF7dJ9K9JUlHwSoatLij941x4J1fstRUpFpKXCYhzXjDvbu3qih7XmnEmYO+60CFDQ+5M1oZb9Mmp29KTIfBZkS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=njXSv9wL; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="njXSv9wL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725175119; x=1756711119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PBFLBJBX7Pbtyxt0jcF5LM1PCQfKzUdL4y8cIrPkGcM=;
  b=njXSv9wL52Kfl97ArxgDTNcGYFp83Pv7hB7VP2whmZimRy3XX5wR0unq
   s8jCXm8PpCu4TjjYR1jwkPFnh8tADxCIdQGyBeg1/s1qYC9F3geLitLAm
   V6nibrXXUdh0czkErg56YCY6OULQ3+p9DXEYguvePrbvMbC8YKvixfkZw
   Io/nIXmO/Dc1/cH6RHZFqT0LaWenGeIQEMt9xtxqooWd169IdJ94nOTgf
   X7L4wu1fNquFNyRukawqf6KtHR9A9fcdDQkz/f8qou8JO799HQYEbDktT
   XaQv59S5hNfBcz8UXlg6yA6vqFBim4lxEwZfeZT4dki7ko8r22cXc9oSl
   g==;
X-CSE-ConnectionGUID: dyWLk5fvRfCqGpXMNtK7VA==
X-CSE-MsgGUID: uruCuQ77Twm6J+paoFSqRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23957143"
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="23957143"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 00:18:39 -0700
X-CSE-ConnectionGUID: ik5fGnq3QB+5tcVP5+Grtg==
X-CSE-MsgGUID: 4RY/FlM0QbCaOeA6HjWWSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="87536507"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Sep 2024 00:18:36 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sker4-0003Vu-2r;
	Sun, 01 Sep 2024 07:18:34 +0000
Date: Sun, 1 Sep 2024 15:18:17 +0800
From: kernel test robot <lkp@intel.com>
To: huangyifeng <huangyifeng@eswincomputing.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Subject: [esmil:eic7700 12/20] drivers/clk/eswin/clk.c:387:27: warning:
 variable 'refdiv_val' set but not used
Message-ID: <202409011509.WzwSaXkG-lkp@intel.com>
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
commit: fca55d936fc3d393ef2a17314f5b7a96bdfc721c [12/20] drivers: clk: eswin: added clock driver for eic7700
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240901/202409011509.WzwSaXkG-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 08e5a1de8227512d4774a534b91cb2353cef6284)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409011509.WzwSaXkG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409011509.WzwSaXkG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/eswin/clk.c:387:27: warning: variable 'refdiv_val' set but not used [-Wunused-but-set-variable]
     387 |         u64 frac_val, fbdiv_val, refdiv_val;
         |                                  ^
>> drivers/clk/eswin/clk.c:388:6: warning: variable 'postdiv1_val' set but not used [-Wunused-but-set-variable]
     388 |         u32 postdiv1_val;
         |             ^
>> drivers/clk/eswin/clk.c:838:13: warning: no previous prototype for function 'eswin_register_clk' [-Wmissing-prototypes]
     838 | struct clk *eswin_register_clk(struct eswin_clock_data *data,
         |             ^
   drivers/clk/eswin/clk.c:838:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     838 | struct clk *eswin_register_clk(struct eswin_clock_data *data,
         | ^
         | static 
   3 warnings generated.


vim +/refdiv_val +387 drivers/clk/eswin/clk.c

   382	
   383	static unsigned long clk_pll_recalc_rate(struct clk_hw *hw,
   384			unsigned long parent_rate)
   385	{
   386		struct eswin_clk_pll *clk = to_pll_clk(hw);
 > 387		u64 frac_val, fbdiv_val, refdiv_val;
 > 388		u32 postdiv1_val;
   389		u32 val;
   390		u64 rate;
   391	
   392		val = readl_relaxed(clk->ctrl_reg0);
   393		val = val >> clk->fbdiv_shift;
   394		val &= ((1 << clk->fbdiv_width) - 1);
   395		fbdiv_val = val;
   396	
   397		val = readl_relaxed(clk->ctrl_reg0);
   398		val = val >> clk->refdiv_shift;
   399		val &= ((1 << clk->refdiv_width) - 1);
   400		refdiv_val = val;
   401	
   402		val = readl_relaxed(clk->ctrl_reg1);
   403		val = val >> clk->frac_shift;
   404		val &= ((1 << clk->frac_width) - 1);
   405		frac_val = val;
   406	
   407		val = readl_relaxed(clk->ctrl_reg2);
   408		val = val >> clk->postdiv1_shift;
   409		val &= ((1 << clk->postdiv1_width) - 1);
   410		postdiv1_val = val;
   411	
   412		switch (clk->id) {
   413			case EIC7700_APLL_FOUT1:
   414				switch (frac_val) {
   415					case 14092861:
   416						rate = APLL_HIGH_FREQ;
   417						break;
   418					case 10603200:
   419						rate = APLL_LOW_FREQ;
   420						break;
   421					default:
   422						pr_err("%s %d, clk id %d, unknow frac_val %llu\n", __func__, __LINE__, clk->id, frac_val);
   423						rate = 0;
   424						break;
   425				}
   426				break;
   427			case EIC7700_PLL_CPU:
   428				switch (fbdiv_val) {
   429					case 300:
   430						rate = CLK_FREQ_1800M;
   431						break;
   432					case 283:
   433						rate = CLK_FREQ_1700M;
   434						break;
   435					case 266:
   436						rate = CLK_FREQ_1600M;
   437						break;
   438					case 250:
   439						rate = CLK_FREQ_1500M;
   440						break;
   441					case 216:
   442						rate = CLK_FREQ_1300M;
   443						break;
   444					case 200:
   445						rate = CLK_FREQ_1200M;
   446						break;
   447					case 166:
   448						rate = CLK_FREQ_1000M;
   449						break;
   450					case 150:
   451						rate = CLK_FREQ_900M;
   452						break;
   453					case 133:
   454						rate = CLK_FREQ_800M;
   455						break;
   456					case 116:
   457						rate = CLK_FREQ_700M;
   458						break;
   459					case 100:
   460						rate = CLK_FREQ_600M;
   461						break;
   462					case 83:
   463						rate = CLK_FREQ_500M;
   464						break;
   465					case 66:
   466						rate = CLK_FREQ_400M;
   467						break;
   468					case 33:
   469						rate = CLK_FREQ_200M;
   470						break;
   471					case 16:
   472						rate = CLK_FREQ_100M;
   473						break;
   474					case 233:
   475						rate = CLK_FREQ_1400M;
   476						break;
   477					default:
   478						pr_err("%s %d, clk id %d, unknow fbdiv_val %llu\n", __func__, __LINE__, clk->id, fbdiv_val);
   479						rate = 0;
   480						break;
   481				}
   482				break;
   483			default:
   484				pr_err("%s %d, unknow clk id %d\n", __func__, __LINE__, clk->id);
   485				rate = 0;
   486				break;
   487		}
   488		return rate;
   489	}
   490	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
