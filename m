Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A43392C57;
	Sat, 27 Jun 2026 12:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782562843; cv=none; b=qElVjS2bxjUYRsEtWSMcbqOUNPofSU3BeFn2IQg1mQA8idSstDqZ5WVJn+ONYT03PG7xtaXp7LYdFxq111Z4C6zuWcFsooKk0pTlzrLRpbM8clJ1+F1RSCAHfAwHIZpSJ1a6b1MCFQmKVgpMSjSRA0Wh0TSTCvcnIcLcIALR7yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782562843; c=relaxed/simple;
	bh=hrFiD4H+unjdfaMub7UwAPGyZRvmqY5HuiT5uz3iuqM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DTSVgRouMIlSR1eln5n2cpethZGe2vgh0a8D6Dl7jpv91xqxb2h/txZM4buonWJfJ267c+axKjGmv8i17QhBwHUBItszEZKUh4M+0QwSSBvWKgfse1ZH7fIj8/yFItLZhYJ+UVkELFQJT0tmjozFAtbP4jCvbWnJLMASCP+41S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ADt9KN+K; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ADt9KN+K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782562840; x=1814098840;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hrFiD4H+unjdfaMub7UwAPGyZRvmqY5HuiT5uz3iuqM=;
  b=ADt9KN+KiPnMOEQNbA9qhuTDT1wQn2O8Rr9TSUdN6/n+gANNhc5nflsz
   q3w2YDCQra7pl/6xNx2rDhYJ7w7/8j2n9s1RIlyvImx579lwyEokNge/X
   0unxBzm13XYrZfGucgPEAdqz+ppIVRJsok/Qw3VkMN5oesDfqqwD1jgaV
   mkGuKyhmfu5I1uOt+0bCUh0ME3oZvQ4LQ+m/GfKKbXfsWybiGllqSAOnL
   XaGmfG3p7uEOlSraBLW8GDqNBqHvzED1b+lKxVRicZaHunL2c16nn/N6w
   Z6TunZUZq7WAE7/5WgtNEYahYkmBkDs2emh8EDFgR19ohzO1fajudKoqv
   Q==;
X-CSE-ConnectionGUID: MB1SCGJXTTyWj7nB4shBNg==
X-CSE-MsgGUID: 7lEQEuz8TbKfi5Bsscosow==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="94718837"
X-IronPort-AV: E=Sophos;i="6.24,228,1774335600"; 
   d="scan'208";a="94718837"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2026 05:20:39 -0700
X-CSE-ConnectionGUID: UnGBsV7FQBma9kNBOcXtsg==
X-CSE-MsgGUID: KjWvjZRHSSmgrL+LDJxYtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,228,1774335600"; 
   d="scan'208";a="274741313"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 27 Jun 2026 05:20:38 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdS1T-000000005qX-2I8T;
	Sat, 27 Jun 2026 12:20:35 +0000
Date: Sat, 27 Jun 2026 20:19:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/hrtimer-header-dependencies 3/5]
 ERROR: modpost: "hrtimer_update_function"
 [drivers/tty/serial/xilinx_uartps.ko] undefined!
Message-ID: <202606272046.CdAww0GF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/hrtimer-header-dependencies
head:   7c6a2b4d48e905380f1c24cd685e513f547f8c0a
commit: ba84ad80de4a06659ab26ea32246250c66fc8115 [3/5] hrtimer: Move the PROVE_LOCKING variant of hrtimer_update_function() to hrtimer.c
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260627/202606272046.CdAww0GF-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260627/202606272046.CdAww0GF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606272046.CdAww0GF-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "hrtimer_update_function" [drivers/tty/serial/xilinx_uartps.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
