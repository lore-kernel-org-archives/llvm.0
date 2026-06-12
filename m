Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A65369D7C;
	Fri, 12 Jun 2026 12:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781266658; cv=none; b=Mrcto5fcOzfDXSRW+5RxhkeXwu6IcgYRTHl37UYDbPW2V02JL/0ZYcn5Vw+horiYBVCmjSCBo+ldgdU3vsJ7vZ4IsrR5FMgjwHGUbPXEoWz6c9IyXHQxZK3chdCnZtc9ZlwHP9H4dBJBPVakgqygGUKmxHrmIBfBo91Z0EUF7II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781266658; c=relaxed/simple;
	bh=YowMQlafNPWCIwKkwllObu8KogtKSLROX4QXzcUCw30=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rgslqIHGUooLpicXvBF+mdMytErwFNqTHF+bT2TvuiLBuQHWNr0HOAnBOXBaeOohAWDH96u6sSAbNMUDWZ6kHhh/WREKxqtqx+YM53N4SGzzxUTUf1IrPmdVA+tHvi4eFn3auDRYay2usqsG9Hrhjufasb/L3Wt2Eg9pH5vHaAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMYFjDuO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMYFjDuO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781266657; x=1812802657;
  h=date:from:to:cc:subject:message-id;
  bh=YowMQlafNPWCIwKkwllObu8KogtKSLROX4QXzcUCw30=;
  b=VMYFjDuO5ORUjye46luOUiBokw20CJmsKukT0TMxmnjFipq79vh7rz4n
   LEjxz2Am50Pg7KudUdVOhaEC+ERUE67Cm68W61S4LfmfLpVPEvFssBA0H
   tMoxPZmgBA/o3Ty+cx2tFscGIPXcj4Y5JFdKhpsCfc5JWHJs40CmozcVl
   Sf4kVkf8aVjkigZQdUI4kjpM1bgotMJxqCJQ+8L/PKlB+Fpqs6o0CNkOB
   wWIxMwk+TVW3SzpkB/zVxrVrEGTezI7flIAeXUMqOlFg4KcWmjqNw0b8g
   Tr5DMKl6CYeyVhvjbT9/BkYVJ2W7UdLUbRDrJ5/RzfGta3jPrXJUMoknQ
   Q==;
X-CSE-ConnectionGUID: GnmMoWrPQsC4/3z7DTdpRg==
X-CSE-MsgGUID: B/g5Ci/1TaKE8n/balPUSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81939328"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="81939328"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 05:17:36 -0700
X-CSE-ConnectionGUID: rjTP3Qg1TVWD3ag4M464KA==
X-CSE-MsgGUID: pMyGF8bGTguDCb1qYUFjEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="244386810"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Jun 2026 05:17:34 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY0pH-00000000OjL-4C4M;
	Fri, 12 Jun 2026 12:17:32 +0000
Date: Fri, 12 Jun 2026 20:16:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>
Subject: ld.lld: error: undefined symbol:
 __kcfi_typeid_aria_aesni_avx_encrypt_16way
Message-ID: <202606122021.pA9TozrA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Kees,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2b414a95b8f7307d42173ba9e580d6d3e2bcbfce
commit: 23ef9d439769d5f35353650e771c63d13824235b kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
date:   9 months ago
config: x86_64-randconfig-013 (https://download.01.org/0day-ci/archive/20260612/202606122021.pA9TozrA-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606122021.pA9TozrA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 23ef9d439769 ("kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606122021.pA9TozrA-lkp@intel.com/

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
