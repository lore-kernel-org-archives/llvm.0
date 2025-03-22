Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E853A175A5;
	Sat, 22 Mar 2025 01:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742606925; cv=none; b=ApeBn9CFu/441PMsBhK1Q0wUIUqvG3hHOtwi7s1YA1OcPf34Kxowp/R3yVHwnw7pH6A2TIHSRVrpdmw0EBS/+voOat2ajufnE+BCghks3c/DYsD7ULtYAFkx09jup1Yd8HCJbxEIELiNSF5rdXJ32PjSbEEqZGZAn4LXrJkHWXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742606925; c=relaxed/simple;
	bh=7y7rMK/4TwrJ61T8935GCHttZ+P3MXqykAJ/dVFCj/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FyldW218H3CsnLJX6NP8xA+ic02AzJYFOQhHezgeKYD0gW9lqepHYB6j6EvvNxgH0C4ZPLXbIebhtqU6IzCaFUCSZNXjkbXTUtd1H8GzkYJDaoJKOkFb7fsNmaQMuq1r/9SW+Gglwdx95uMMXxfK90kDeiPcnXI+CvbLFh0r5m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PvptRGAx; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PvptRGAx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742606923; x=1774142923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7y7rMK/4TwrJ61T8935GCHttZ+P3MXqykAJ/dVFCj/c=;
  b=PvptRGAxdz75IN+IM6G678ZF55ziJCMcZcVos7LpCf2svzJK1U5S9azr
   RL1AXT95kAPDBXJfRuRRx7Y6okpdHSSWJGSTW0xS2JSn5z01nazjTIZ+a
   6HcCP4mvJlGNWSa1tjN6QwfAI5rpL/XxszO250Q3JDpmmzS1gyjrUsAIX
   i+y/EK77DCUnlBa6awTg6nDSjXhF32rIsIcdFwmpUydUbzNi/Pote6a80
   lOk9SRimkSzsNKYs5lJUggtZbmce4WedkcqIpWAhmiULUV1vfP0dV5rxk
   /HgU0ZCRyYJmzBTg63E4QzjB0lkDsIKwfRjdIDSsLrWlePp8aJmqXO8Ly
   A==;
X-CSE-ConnectionGUID: jDguBFYoTUmrfTlOi8O4XA==
X-CSE-MsgGUID: 541EMYSeR/KgJKPyaVGkhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="61280739"
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="61280739"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 18:28:43 -0700
X-CSE-ConnectionGUID: 3074aIrLQ4utYWJZ13NVxw==
X-CSE-MsgGUID: wT/QfZDvQo+U3P2lplzblA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="128608571"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 21 Mar 2025 18:28:41 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvnfC-0001pz-1I;
	Sat, 22 Mar 2025 01:28:38 +0000
Date: Sat, 22 Mar 2025 09:28:15 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alessandro Carminati <acarmina@redhat.com>,
	Kees Cook <keescook@chromium.org>
Subject: [linux-next:master 12460/13068] ld.lld: error: relocation
 R_RISCV_HI20 cannot be used against symbol
 '.L__func__.sifive_errata_patch_func'; recompile with -fPIC
Message-ID: <202503220952.hV6Bn4za-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9388ec571cb1adba59d1cded2300eeb11827679c
commit: 165b7007a59c32b61d2b35f257d0abbfbcb44147 [12460/13068] bug/kunit: core support for suppressing warning backtraces
config: riscv-randconfig-002-20250322 (https://download.01.org/0day-ci/archive/20250322/202503220952.hV6Bn4za-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503220952.hV6Bn4za-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503220952.hV6Bn4za-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol '.L__func__.sifive_errata_patch_func'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
   >>> referenced by errata.c:0 (arch/riscv/errata/sifive/errata.c:0)
   >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol '.L__func__.sifive_errata_patch_func'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
   >>> referenced by errata.c:0 (arch/riscv/errata/sifive/errata.c:0)
   >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_patch_func) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
