Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4B3224AF9;
	Sun,  9 Aug 2026 21:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786309345; cv=none; b=ua/x3Pk2mPVLSAUtS9k6jxDu3Ue3aRLqwLCtTNgXWZtrT2KQjJuwQTj0nejR0UTvLKc592CBnqnm68QO2QJPxMpKTizJXEFlViTsHzzFkPW9BnZU7O+xGoQQH4Nr5UdDXqNKKdl6/6zntLESEpnHIeJ9gDfSvOd8PcdqSqIjyhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786309345; c=relaxed/simple;
	bh=Rce1TvmlkPo/B5ypetHUedDSJUtRlnN7DaKwxQH3Lv4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fZznSOdimDfpKEpDO8gwq2frlZ8XBggb28gqIM4JRGHtAousOosIvSykh33FCVeTZXIzV7ftuhrZeUeztKCoqsapsj4QenHL0O2oDQlMOwrrFmfqPKrVzlY1wE/Agqvn2NLWNu3ZEyL9vnv6UyxoVCpO0X4rkf4pfrHbBoMWC5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QuRQ8MVV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QuRQ8MVV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786309344; x=1817845344;
  h=date:from:to:cc:subject:message-id;
  bh=Rce1TvmlkPo/B5ypetHUedDSJUtRlnN7DaKwxQH3Lv4=;
  b=QuRQ8MVV2XJhvjPpQUzJlOrd51C4oX15h5YIuLDBCuM2zC+/Jx6zBeOI
   GyyJsajgQNnnE+Q0SWYYzBDYTQZ7S1Oe0ymnTwprO4sk/iMz5jVjPWkO+
   kAKHpZYVFpMesPEZN/QPDKn2imbocBwhjQB8hYMekNNgeQ6WJv6kBulFX
   FqCNM4n7expURlcvzkavlrosFgG332Iy+qKLmaGi0/aE23JR4pTk01Si3
   37ZjLF3TMQxJ4UM0t20Vl/QSpwp1gIQb4mEHnpCWhvOLPoPqQjGbGou8l
   OPVEt/9AIP145ToB1sljGu4tCWzilCPWWgwS8clS9S0INGK8bQLAhsmQh
   Q==;
X-CSE-ConnectionGUID: rTz7KKMeR365sr60kZjrHg==
X-CSE-MsgGUID: lIRQ+W/3SASgRdAf0rHf2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="98341200"
X-IronPort-AV: E=Sophos;i="6.25,214,1779174000"; 
   d="scan'208";a="98341200"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 14:02:23 -0700
X-CSE-ConnectionGUID: E2xLYPGxRKGVHH5GAqJ5Xw==
X-CSE-MsgGUID: OCwZic7qSYiuhKKmARe26A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,214,1779174000"; 
   d="scan'208";a="259551194"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Aug 2026 14:02:21 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtAew-00000000MNU-49dW;
	Sun, 09 Aug 2026 21:02:18 +0000
Date: Mon, 10 Aug 2026 05:02:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>
Subject: ld.lld: error: undefined symbol:
 __kcfi_typeid_aria_aesni_avx2_gfni_encrypt_32way
Message-ID: <202608100432.yIX7TckM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Kees,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   06cf61899d6498b33e4b7c87d99d5bd471ccc375
commit: 23ef9d439769d5f35353650e771c63d13824235b kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
date:   11 months ago
config: x86_64-randconfig-011-20260809 (https://download.01.org/0day-ci/archive/20260810/202608100432.yIX7TckM-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260810/202608100432.yIX7TckM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 23ef9d439769 ("kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608100432.yIX7TckM-lkp@intel.com/

All errors (new ones prefixed by >>):

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
