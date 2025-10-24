Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654A822370D;
	Fri, 24 Oct 2025 06:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761287244; cv=none; b=SNO6qjKTk/Avg5IZof13uQBbRTq454PKjMRC6SKxww9R93HC/5gvvi17WSq9dTv3QO2KxoMJygLsqbBjwknfPd2bOGBQl0qTfVKgclo4lSqe/BldlwyOeazDnQ2JcUof7sAOIFcm0Y6aQQDnHr41NSeZYF5Ywn1fAcO/7lacwbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761287244; c=relaxed/simple;
	bh=t3MLwYQiKPr6/HjGVnUdD3FqBgPUhjC5TzILMRBoBzg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Aa2aJ4tRAiNsoduE2EojEBc8cfQgVVwnMMFbYEp7Q1w5XGYqGa4kG8cHMp4KdkGPvcIhw0g1Va3c0dRReQ8qG0s+Sb5O6smURmxeITe6zoXddCr+CnD6UrWs3Coz8rIGq+VgkpzxGr76m7LwHIpTNwg/o1I1ARJbVvxvnTxROg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KFhOdQU8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KFhOdQU8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761287242; x=1792823242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t3MLwYQiKPr6/HjGVnUdD3FqBgPUhjC5TzILMRBoBzg=;
  b=KFhOdQU8sXuW+sMnh/TwggFczNtHKu1nQ+SQuiFBNZHIt8H0pUKUYWmZ
   /m6cKJp7nRlrDlggXShTZiMt8NJeaISGGZS/MOtwq04g13GuO25q14VgH
   p5EwpAFFl8zWXXeuNLix/iPKv/76wjIcosUuKQqR+JUOVP+H1IAEmkxtk
   jNRn4KPs7v11OvF7JLo6FZWVIQGmVmqHHxQk88hhb8Ta+aiBBeq7+Wet5
   eXqs5nPiB/u7t+u1MLwmITke5zQEj/eTCGdzk96FwKCFT5kaF8RqiM4Ri
   0Rjc665VSGyyI1Afjn1v6am0GzRKWoxFFY4ouDSt0CH0QVP7QsmbekwXj
   w==;
X-CSE-ConnectionGUID: fPBsefTLRsiEIpt1jTE5Qg==
X-CSE-MsgGUID: 8/S9rk1PR2y3qw7CflxFIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80900483"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="80900483"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 23:27:22 -0700
X-CSE-ConnectionGUID: gI5RQchoSfCE9/MVGK9hKw==
X-CSE-MsgGUID: DjzC61SOQmaW/+8ctNSDpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="184068939"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 23 Oct 2025 23:27:21 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCBGF-000EEx-2c;
	Fri, 24 Oct 2025 06:26:59 +0000
Date: Fri, 24 Oct 2025 14:24:10 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:ixp4xx-debug-uart2 1/1]
 arch/arm/boot/compressed/head.S:56:10: fatal error: 'mach/debug-macro.S'
 file not found
Message-ID: <202510241417.FXITcpff-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git ixp4xx-debug-uart2
head:   5b4f65ab8af2586fae343efd495de3a578417841
commit: 5b4f65ab8af2586fae343efd495de3a578417841 [1/1] Uglydebug hack for IXP4xx UART2
config: arm-randconfig-004-20251024 (https://download.01.org/0day-ci/archive/20251024/202510241417.FXITcpff-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510241417.FXITcpff-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510241417.FXITcpff-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/boot/compressed/head.S:56:10: fatal error: 'mach/debug-macro.S' file not found
      56 | #include CONFIG_DEBUG_LL_INCLUDE
         |          ^~~~~~~~~~~~~~~~~~~~~~~
   ./include/generated/autoconf.h:2624:33: note: expanded from macro 'CONFIG_DEBUG_LL_INCLUDE'
    2624 | #define CONFIG_DEBUG_LL_INCLUDE "mach/debug-macro.S"
         |                                 ^~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +56 arch/arm/boot/compressed/head.S

224b5be6ddc12f Russell King   2005-11-16  55  
4beba08ba1574f Shawn Guo      2012-12-11 @56  #include CONFIG_DEBUG_LL_INCLUDE
224b5be6ddc12f Russell King   2005-11-16  57  
0b0c1dbd500dfe Linus Walleij  2020-08-27  58  		.macro	writeb,	ch, rb, tmp
0b0c1dbd500dfe Linus Walleij  2020-08-27  59  #ifdef CONFIG_DEBUG_UART_FLOW_CONTROL
0b0c1dbd500dfe Linus Walleij  2020-08-27  60  		waituartcts \tmp, \rb
0b0c1dbd500dfe Linus Walleij  2020-08-27  61  #endif
0b0c1dbd500dfe Linus Walleij  2020-08-27  62  		waituarttxrdy \tmp, \rb
5cd0c3442021fb Russell King   2005-05-03  63  		senduart \ch, \rb
0b0c1dbd500dfe Linus Walleij  2020-08-27  64  		busyuart \tmp, \rb
^1da177e4c3f41 Linus Torvalds 2005-04-16  65  		.endm
5cd0c3442021fb Russell King   2005-05-03  66  

:::::: The code at line 56 was first introduced by commit
:::::: 4beba08ba1574f6d427347edaba5b924b2f70826 ARM: 7600/1: include CONFIG_DEBUG_LL_INCLUDE rather than mach/debug-macro.S

:::::: TO: Shawn Guo <shawn.guo@linaro.org>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
