Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCEF27F19F;
	Thu, 21 May 2026 05:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779341303; cv=none; b=khblihEZs+Amqm2hbzaJKWdeS0QNFLypItKFJtFojtDHwhImU2/OImgKTCy4URLG/1MLlLYR+L03nWIRIGAGFZFLxy+R1Y32gXwEZjMf2nn4fj/AsXAVhPvKpFIKtr/55yiBC+GacIaM8x/Uy/Mkfb/pDm4ZKoaDqSj0ocR4iEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779341303; c=relaxed/simple;
	bh=LoS3tKjsL3/YAgentTj4cL+r5DrVd4OqJeaKTqSYVSI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f4u3IqtqzClkV73Y69BJZ2UVyxjWpDp51rsT3J93FfXA8HSncqYHFnPakh8X6vc7byiL5ys6a6tSGG4JqdIr8O/A/Iv7zYU0Pu4tN2Yu4WRHxq16DGEODBfnUrwwhndLih34UhrEX9sysR7i2OM6szPGE9jyyID8hVntikWs000=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iPU+K9G/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iPU+K9G/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779341302; x=1810877302;
  h=date:from:to:cc:subject:message-id;
  bh=LoS3tKjsL3/YAgentTj4cL+r5DrVd4OqJeaKTqSYVSI=;
  b=iPU+K9G/TGOCqsr1I1U826stlWsnqh2HEEnjSm23cmULH5KwZ0i6LAT7
   l55icxePcdKMfDpQsRekJliTusexKRojtkUtgRQXhMxN/NteTDpZb9Jx3
   2WSbWefTPROtZWaPoxIF22iL4pFizhTyK7rWbia5NMK5YYssz2XD0RXgM
   iGDjb6IkD3a4x2ff4NPrfMt7PuDB39M6oZfmdJLvK6zlyK4d0rjSjC4U9
   sXBtBdOKtbrJMN+9FJD3XYxIOrJHIu1ygTJyqmCLCF+zpuH1E4oe4yGbz
   +TxH0JXFUmkR3CVfSRndKoJRUNkf5LjiBckkG3uicBnlZ5eT9Zwk7Y3VY
   Q==;
X-CSE-ConnectionGUID: ZBS+nobzRWeba3ugZDLyhA==
X-CSE-MsgGUID: TpDsa6geREuWvTyqp3wsUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80219807"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="80219807"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 22:28:21 -0700
X-CSE-ConnectionGUID: LcocaFCjTBmp3mJ2HRcFBw==
X-CSE-MsgGUID: ORJfAiVaRMy6/zwY3abf8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="263943681"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 20 May 2026 22:28:19 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPvwu-000000004SP-1VFp;
	Thu, 21 May 2026 05:28:02 +0000
Date: Thu, 21 May 2026 13:26:43 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:ffclock 39/44] ld.lld: error: undefined symbol:
 __aeabi_ldivmod
Message-ID: <202605211345.Owwb6pt3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux ffclock
head:   0351afde272ddc6e1f1312297a5e084c598ff4b0
commit: fef91959721b929cc114e9a4f8f9af4e73ddaa4a [39/44] timekeeping: Drive time_offset skew via per-tick ntp_error transfer
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260521/202605211345.Owwb6pt3-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211345.Owwb6pt3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211345.Owwb6pt3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __aeabi_ldivmod
   >>> referenced by ntp.c
   >>>               kernel/time/ntp.o:(second_overflow) in archive vmlinux.a
   >>> did you mean: __aeabi_idivmod
   >>> defined in: vmlinux.a(arch/arm/lib/lib1funcs.o)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
