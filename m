Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382843BD22E;
	Thu,  4 Jun 2026 08:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780560903; cv=none; b=uKGEULKkg3yYFTX8S4epA4NNTtJNnchTfNyjE7sjiUoVL/tq45TPvlbzRVH7zaywrgAMIg8f4okBhA7S4lI6u8meKFWaPdR0FYxmOFEzOg3G9dT+b3rBfEVl32o8w0SVrvH21G62G2Xo+Ipps4D1hCqseUNnNzD0LL3RZDKcikA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780560903; c=relaxed/simple;
	bh=TD0BOCUoOwVZ5vKNuGDk/gaRatcONh155joLe1kDmeM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tNIs3OH7zy50rFeg72MDH63yDsalm/AE1x+pva2PSsFbbJolpKubntrdgXhGNS+LDq66Rc8+mu2R5EPk/8O44I9CbNEXByLAz9SjkNehKSGopmXjuk7R7vGF0h4x8RAUaDn1Y+qcTCDbYHzvPqTkZHe2Nz1LeMvM7gpQFwjMRO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b5uJOCqG; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b5uJOCqG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780560902; x=1812096902;
  h=date:from:to:cc:subject:message-id;
  bh=TD0BOCUoOwVZ5vKNuGDk/gaRatcONh155joLe1kDmeM=;
  b=b5uJOCqG9qztSzwqvVWs9U4YdzWbmrCvdpMUlunRr3yySfs/hK4Jb76F
   yxm+A7mL85QeZu410NJumrzwuTQZtrjijvFv3FV9OiW8ZCa2CAT8JUG21
   KnsmpKMpA41YiFzrDYqp+PN2bxqnjdvScyZL6xZKzo3EnTCh2fRYpoPwF
   yLaQXvCdDVxmkhkQoKpirwjduOFrxytbW8fAQ8Tmf07w/pvXhJTH0HCvk
   qGWO3lHCg2r/FhG87Qxb0yXEi+u4bm/nf4Rb8PfpypuvmSCjbPUjdYfs2
   ++B47y4dYEnyEm7yK9Xqf5qH8KFR0wCsQFlv2OOpT0mPtpR1dzTdZkqes
   A==;
X-CSE-ConnectionGUID: TFeLAl5uS/iQXT+pfFKKYA==
X-CSE-MsgGUID: +Uo08dzqSc++rPcHaDkPdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81563922"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="81563922"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 01:15:01 -0700
X-CSE-ConnectionGUID: +vHmWNBeRhCscYEqnM2NtQ==
X-CSE-MsgGUID: YbBZ+JMNS762jt6Rgvcr5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="243412326"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Jun 2026 01:14:59 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wV3E8-00000000ESG-1k0H;
	Thu, 04 Jun 2026 08:14:56 +0000
Date: Thu, 04 Jun 2026 16:13:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>
Subject: ld.lld: error: undefined symbol:
 __kcfi_typeid_aria_aesni_avx_encrypt_16way
Message-ID: <202606041643.GyTZgCk1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
commit: 23ef9d439769d5f35353650e771c63d13824235b kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
date:   8 months ago
config: x86_64-randconfig-013 (https://download.01.org/0day-ci/archive/20260604/202606041643.GyTZgCk1-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260604/202606041643.GyTZgCk1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 23ef9d439769 ("kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606041643.GyTZgCk1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __kcfi_typeid_aria_aesni_avx_encrypt_16way
   >>> referenced by aria-aesni-avx-asm_64.S:970 (arch/x86/crypto/aria-aesni-avx-asm_64.S:970)
   >>>               vmlinux.o:(__cfi_aria_aesni_avx_encrypt_16way)
--
>> ld.lld: error: undefined symbol: __kcfi_typeid_aria_aesni_avx_decrypt_16way
   >>> referenced by aria-aesni-avx-asm_64.S:995 (arch/x86/crypto/aria-aesni-avx-asm_64.S:995)
   >>>               vmlinux.o:(__cfi_aria_aesni_avx_decrypt_16way)
--
>> ld.lld: error: undefined symbol: __kcfi_typeid_aria_aesni_avx_ctr_crypt_16way
   >>> referenced by aria-aesni-avx-asm_64.S:1096 (arch/x86/crypto/aria-aesni-avx-asm_64.S:1096)
   >>>               vmlinux.o:(__cfi_aria_aesni_avx_ctr_crypt_16way)
--
>> ld.lld: error: undefined symbol: __kcfi_typeid_aria_aesni_avx_gfni_encrypt_16way
   >>> referenced by aria-aesni-avx-asm_64.S:1266 (arch/x86/crypto/aria-aesni-avx-asm_64.S:1266)
   >>>               vmlinux.o:(__cfi_aria_aesni_avx_gfni_encrypt_16way)
--
>> ld.lld: error: undefined symbol: __kcfi_typeid_aria_aesni_avx_gfni_decrypt_16way
   >>> referenced by aria-aesni-avx-asm_64.S:1291 (arch/x86/crypto/aria-aesni-avx-asm_64.S:1291)
   >>>               vmlinux.o:(__cfi_aria_aesni_avx_gfni_decrypt_16way)
--
>> ld.lld: error: undefined symbol: __kcfi_typeid_aria_aesni_avx_gfni_ctr_crypt_16way
   >>> referenced by aria-aesni-avx-asm_64.S:1316 (arch/x86/crypto/aria-aesni-avx-asm_64.S:1316)
   >>>               vmlinux.o:(__cfi_aria_aesni_avx_gfni_ctr_crypt_16way)
--
>> ld.lld: error: undefined symbol: __kcfi_typeid_aria_aesni_avx2_gfni_encrypt_32way
   >>> referenced by aria-aesni-avx2-asm_64.S:1345 (arch/x86/crypto/aria-aesni-avx2-asm_64.S:1345)
   >>>               vmlinux.o:(__cfi_aria_aesni_avx2_gfni_encrypt_32way)
--
>> ld.lld: error: undefined symbol: __kcfi_typeid_aria_aesni_avx2_gfni_decrypt_32way
   >>> referenced by aria-aesni-avx2-asm_64.S:1370 (arch/x86/crypto/aria-aesni-avx2-asm_64.S:1370)
   >>>               vmlinux.o:(__cfi_aria_aesni_avx2_gfni_decrypt_32way)
--
>> ld.lld: error: undefined symbol: __kcfi_typeid_aria_aesni_avx2_gfni_ctr_crypt_32way
   >>> referenced by aria-aesni-avx2-asm_64.S:1395 (arch/x86/crypto/aria-aesni-avx2-asm_64.S:1395)
   >>>               vmlinux.o:(__cfi_aria_aesni_avx2_gfni_ctr_crypt_32way)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
