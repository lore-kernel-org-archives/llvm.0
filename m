Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180B1334C3D;
	Sat,  1 Aug 2026 11:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785584457; cv=none; b=XIGsvTD8BL1eZV7J/Wd7jr855lFSNrvvW01w34ECgpZqmgfvhb+PTAVBX3V2uCcxhcM9orDiLpInJcSMuLJJmTJ1b7Ns5Qb+O8dcPL3GM58a9eqTGjQlmKjGlGBzIKyU/uNWQmD8jtXSPP9AaNNzhBn5zS+W2Oih1gym8c8tABU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785584457; c=relaxed/simple;
	bh=AA9FQCSt4p0BHZOR/V4hAOOh6rmg/5ju1gxJfMHHjiA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rBvUiw4ZPQk6d4zBs4IEX7aHcOspPvEhXW5mJtzTknOgFFoEIjdztUQkSJ0u802XgHm4OK1i6g6D+v1KxBBS9bi/ilR5JAdpnnXbDdqXMx1e0JWPx2crPQT4u4HvfVe56fraEhXj4P0oMV1jmbix7EiAphcIFqHP16n42YWQnQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VBt77f4Q; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VBt77f4Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785584456; x=1817120456;
  h=date:from:to:cc:subject:message-id;
  bh=AA9FQCSt4p0BHZOR/V4hAOOh6rmg/5ju1gxJfMHHjiA=;
  b=VBt77f4Q0tsgZe2Cfreb7JwaLHrU+3HyTsXXVVWMPU/xU+ArSN93NbD7
   W6vEUtCPa2GOTUM3MKpo1xnrwp1YRMQqq/xJjYnBT5KqOwLo/CJc858Kh
   9dWrnfnev+aIbWnKwluoZVJ3hB8lpTNuY1v8YqIyxmQGKmHhf4G6Kftak
   fG8RxhuFri3W/xH2pVO9zARHyEACNDCyXgneaoW3IUIMoltB1L3AfhMFF
   X8ioiPXAa85NXol4tqmum+Gk92PVPjOgQZAV4SEOXC+4BlJ1CGkRhbggs
   annCqUobuRZ6ngdbyLkUPOhvUec0QsTSdAtoAyO/AkvdcFLYH1QmY6Wu3
   Q==;
X-CSE-ConnectionGUID: PpMfjWcORYOpHoFklYtGjQ==
X-CSE-MsgGUID: Zoypy3JrRxi7BHRX4j5N7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="97711914"
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="97711914"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 04:40:55 -0700
X-CSE-ConnectionGUID: G/6YLXYQR6G7R3DW2TcQrA==
X-CSE-MsgGUID: o8u4TBmvSmi+b8ZXQ4lwdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="256891916"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 Aug 2026 04:40:53 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wq85C-000000003Ff-0XQm;
	Sat, 01 Aug 2026 11:40:50 +0000
Date: Sat, 01 Aug 2026 19:39:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>
Subject: ld.lld: error: undefined symbol:
 __kcfi_typeid_aria_aesni_avx_encrypt_16way
Message-ID: <202608011933.kBOt88Q2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Kees,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8ba098e6b6ff0db8edf28528d1552be261af30d4
commit: 23ef9d439769d5f35353650e771c63d13824235b kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
date:   10 months ago
config: x86_64-randconfig-011-20260731 (https://download.01.org/0day-ci/archive/20260801/202608011933.kBOt88Q2-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260801/202608011933.kBOt88Q2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 23ef9d439769 ("kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608011933.kBOt88Q2-lkp@intel.com/

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
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
