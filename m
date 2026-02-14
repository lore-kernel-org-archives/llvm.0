Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E702C11CF;
	Sat, 14 Feb 2026 17:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771090365; cv=none; b=OgA+gXJWrcly4P77jmxlU0nWlL9Prs1YlsXVQLMCbsFOAttYQa32ZYOCQ3Sn6HTQINoo8NWTyA5jDV5GsBiIU9oFxYbYlUX4OL8qlQu0EjGPkmJIX0ypRH0fcMqNYoUjqG8Kv9io74mmePC6VLjEkWjiyKCgxTBI7dU+SFPnWeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771090365; c=relaxed/simple;
	bh=Au1/pT582Lvke3JYWksZU3mMTndDsEbHMxz2REa/JVQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SBUlalc4PS0ZY2KljctEKKAd0kfDjBvbR98ySqZg36rYEy/N1kzutRGTUWYypCbHVcmH56Tfp88mF1W8g2C1dvcqudusRmncJoDIMBCJX9ZUhKiRXWHAt3CZeVNjwM0hqjQu8JRpza8X3gVX5bpYuFwd8HVLFxQIOmVgd8Z4TbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gX14mhlF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gX14mhlF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771090364; x=1802626364;
  h=date:from:to:cc:subject:message-id;
  bh=Au1/pT582Lvke3JYWksZU3mMTndDsEbHMxz2REa/JVQ=;
  b=gX14mhlF/nX6+njpwnuqUmcxi3p8asd99gSfb3g7g+hvhY9VWuN53NxA
   jvHA/HIpqUDQkvPjmlkAu4P0aUa4UzIJSqKBQRKODTnwiJ15rOed6GsIo
   c+QfLS7nB7njOQnR6rUYPMUH2PsM/YVnq+IQHn2PIHJC0RvxAtRxcZp2M
   oFD4iJ1jsEp2txl4NNz+Dip1veJn8MbwcuzZiO/P3pGW6IiEDoWSrBMi8
   fb3JwycZ/OUe6wZNV6u973i+mRXg1zGl/hDoUWx8knSn8Rg13SAEOuCqb
   pK2o1T4L1LrYZzCWL5otanLB5vONf+eDLqJpUNHOgxHsWUC0w6uu7sNEF
   Q==;
X-CSE-ConnectionGUID: okUEtDAoSgGxG4im99Hsrw==
X-CSE-MsgGUID: bxph2IvvR1qYdWJROnuQZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="71442028"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="71442028"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 09:32:43 -0800
X-CSE-ConnectionGUID: TItFRJc1Rg6hTJ1HEhZLHQ==
X-CSE-MsgGUID: Xv0o3JtiSzCDetsEoYI0hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="242484986"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Feb 2026 09:32:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrJVX-00000000wnM-2Qod;
	Sat, 14 Feb 2026 17:32:39 +0000
Date: Sun, 15 Feb 2026 01:31:58 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:b4/firmare-acpm-counted 3/4]
 drivers/firmware/samsung/exynos-acpm-dvfs.c:53:33: error: call to undeclared
 function 'ARRAY_SIZE'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202602150151.N56eN2Xi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/krzk/linux b4/firmare-acpm-counted
head:   c446778ac8dbd96a1ec1a82ad39abdabb80594bf
commit: a185cddcfe370dc12ac5ddeafebeb7a57bd42563 [3/4] firmware: exynos-acpm: Count number of commands in acpm_xfer
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260215/202602150151.N56eN2Xi-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602150151.N56eN2Xi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602150151.N56eN2Xi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/samsung/exynos-acpm-dvfs.c:53:33: error: call to undeclared function 'ARRAY_SIZE'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      53 |         acpm_dvfs_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, false);
         |                                        ^
   drivers/firmware/samsung/exynos-acpm-dvfs.c:73:33: error: call to undeclared function 'ARRAY_SIZE'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      73 |         acpm_dvfs_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
         |                                        ^
   2 errors generated.


vim +/ARRAY_SIZE +53 drivers/firmware/samsung/exynos-acpm-dvfs.c

    44	
    45	int acpm_dvfs_set_rate(const struct acpm_handle *handle,
    46			       unsigned int acpm_chan_id, unsigned int clk_id,
    47			       unsigned long rate)
    48	{
    49		struct acpm_xfer xfer = {0};
    50		u32 cmd[4];
    51	
    52		acpm_dvfs_init_set_rate_cmd(cmd, clk_id, rate);
  > 53		acpm_dvfs_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, false);
    54	
    55		return acpm_do_xfer(handle, &xfer);
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
