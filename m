Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382A733993;
	Fri, 27 Feb 2026 16:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772210370; cv=none; b=X1fusGuA+UvaC05PgMoTPLfQl4J6k9qupIYfDqBZ7v06N/YACZsifzUEumbNaGx7brNLfxaao4D/sUifWbBF7Cf8SYbwbXRFD2L1yESjqwwVE1RwLOC7dJmGo2knPRKNIFhYeb/SqoTtY9oSAHhsamVzBm3HiqUEG6p5tSHfwYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772210370; c=relaxed/simple;
	bh=cscTOmtCZplhqTxfbKiQ9xxVRQrUo0q9+COKFcFhMbk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Gd5KtsmD6gWh85z9n7rzZuuaDzUqDMUrLkUs30aR7s/1Sm7Tc0kp2ih8K/l5oeyj5FnNWuWKJw74LuHAmKL+Ha00zD8/rra9j/q4KG63+ucYg/t0e8PCgLPDF1qQMBApQVi3/4XJamOxkd0NF/a4NficgyodSi+xWNvNNiFrdJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XDYWtqWT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XDYWtqWT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772210369; x=1803746369;
  h=date:from:to:cc:subject:message-id;
  bh=cscTOmtCZplhqTxfbKiQ9xxVRQrUo0q9+COKFcFhMbk=;
  b=XDYWtqWT4M75zcero3xcES5CuooBMAyNX9Wq0OTfH02lQpJD44379HnE
   h6jhRaUJ57dQHFZcyBkoSEcGCmWxsfPrRNIKYnL5ShivHlX0CfQCDBXJE
   P8g6CO+Sie3fEvRhOxPNMTxNvgjkwXklyMQ4iUmDG8yqdRDOJvvRPY95w
   7ItNrvPWe8tlXFJNY1lVy7RiEVlZh3q/1W6KaXw53HrojeRXGCBfH7hFu
   9rNGk1MSFGDZzDR7Cnts3bIY9MATLflODspB7om58CZGmBwGSPuVLiqrl
   UaqIEOTxYsw99QjvTz4GrkvLhkJiI7MkpvfEjcXbKgU6IRAMnLO2eaGoo
   w==;
X-CSE-ConnectionGUID: L8fdFO6vR5S/ydYt/ACh5g==
X-CSE-MsgGUID: tDAWk6qFSty5Kvcg7ZhcoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="90697869"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="90697869"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 08:39:29 -0800
X-CSE-ConnectionGUID: pEkJE1wvS5el8Jpt2dmPGw==
X-CSE-MsgGUID: hpdzvNlFQS+LN78jICimzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="221936076"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 27 Feb 2026 08:39:26 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vw0rr-00000000Anv-2mvf;
	Fri, 27 Feb 2026 16:39:12 +0000
Date: Sat, 28 Feb 2026 00:38:14 +0800
From: kernel test robot <lkp@intel.com>
To: hepengpx <pengpengx.he@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Shahidan, Muhammad Shahmil" <muhammad.shahmil.shahidan@intel.com>
Subject: [acrn:6.17/linux 213/3102]
 drivers/media/i2c/isx031.c:225:15: error: initializer element is not a
 compile-time constant
Message-ID: <202602280018.s45tHWvr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/projectacrn/acrn-kernel 6.17/linux
head:   eac6d3b7a20ffb9d3102dbdc152241a7184a63cd
commit: ee759f8dcd8fe7bc5720ddfe2a5e55bf6da57a16 [213/3102] max9x: add config in makefile & kconfig
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260228/202602280018.s45tHWvr-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260228/202602280018.s45tHWvr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602280018.s45tHWvr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/isx031.c:225:15: error: initializer element is not a compile-time constant
                   .reg_list = isx031_1920_1080_30fps_reg_list,
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/isx031.c:772:54: warning: address of array 'isx031->platform_data->suffix' will always evaluate to 'true' [-Wpointer-bool-conversion]
           if (isx031->platform_data && isx031->platform_data->suffix)
                                     ~~ ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   1 warning and 1 error generated.


vim +225 drivers/media/i2c/isx031.c

f4927c135b40fc Hao Yao 2025-09-30  217  
f4927c135b40fc Hao Yao 2025-09-30  218  static const struct isx031_mode supported_modes[] = {
f4927c135b40fc Hao Yao 2025-09-30  219  	{
f4927c135b40fc Hao Yao 2025-09-30  220  		.width = 1920,
f4927c135b40fc Hao Yao 2025-09-30  221  		.height = 1080,
f4927c135b40fc Hao Yao 2025-09-30  222  		.code = MEDIA_BUS_FMT_UYVY8_1X16,
f4927c135b40fc Hao Yao 2025-09-30  223  		.datatype = MIPI_CSI2_DT_YUV422_8B,
f4927c135b40fc Hao Yao 2025-09-30  224  		.fps = 30,
f4927c135b40fc Hao Yao 2025-09-30 @225  		.reg_list = isx031_1920_1080_30fps_reg_list,
f4927c135b40fc Hao Yao 2025-09-30  226  	},
f4927c135b40fc Hao Yao 2025-09-30  227  	{
f4927c135b40fc Hao Yao 2025-09-30  228  		.width = 1280,
f4927c135b40fc Hao Yao 2025-09-30  229  		.height = 720,
f4927c135b40fc Hao Yao 2025-09-30  230  		.code = MEDIA_BUS_FMT_UYVY8_1X16,
f4927c135b40fc Hao Yao 2025-09-30  231  		.datatype = MIPI_CSI2_DT_YUV422_8B,
f4927c135b40fc Hao Yao 2025-09-30  232  		.fps = 30,
f4927c135b40fc Hao Yao 2025-09-30  233  		.reg_list = isx031_1280_720_30fps_reg_list,
f4927c135b40fc Hao Yao 2025-09-30  234  	},
f4927c135b40fc Hao Yao 2025-09-30  235  	{
f4927c135b40fc Hao Yao 2025-09-30  236  		.width = 1920,
f4927c135b40fc Hao Yao 2025-09-30  237  		.height = 1536,
f4927c135b40fc Hao Yao 2025-09-30  238  		.code = MEDIA_BUS_FMT_UYVY8_1X16,
f4927c135b40fc Hao Yao 2025-09-30  239  		.datatype = MIPI_CSI2_DT_YUV422_8B,
f4927c135b40fc Hao Yao 2025-09-30  240  		.fps = 30,
f4927c135b40fc Hao Yao 2025-09-30  241  		.reg_list = isx031_1920_1536_30fps_reg_list,
f4927c135b40fc Hao Yao 2025-09-30  242  	},
f4927c135b40fc Hao Yao 2025-09-30  243  };
f4927c135b40fc Hao Yao 2025-09-30  244  

:::::: The code at line 225 was first introduced by commit
:::::: f4927c135b40fcf235caf994b82a1444ca1fcca2 media: ipu7: IPU7 driver release for PTL Beta v6.17 iot

:::::: TO: Hao Yao <hao.yao@intel.com>
:::::: CC: Shahidan, Muhammad Shahmil <muhammad.shahmil.shahidan@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
