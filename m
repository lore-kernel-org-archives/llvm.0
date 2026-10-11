Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D671C33262B;
	Sun, 11 Oct 2026 21:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791754544; cv=none; b=b4EzZhlN/Xbyqv31SSKEfK6/72MWZFCZBqdYA/r1H37FuCoF2L96Re7ijmJ3kbV42y1WP1BVhvfkEUrJ0hxOtBxY4ReXWeVvx0Lg+N9nJziFVEhee9bCTbXUOmNkIKKO1QomrZq3UX2ImHcYQIDh6e6CB/EHoumcdMK+Fmk9Rto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791754544; c=relaxed/simple;
	bh=+pjj0FeaXMYUm+V+cqoYAftZoLBbqLSQOkzEKvz3EJs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J+TgI0oeYZpmyvih0N7lTBbLkos8ctunPx1WIsJw/OtxXlqRYQuAw1N+wOdB4eZmPHJzQ0lKiz71DYiLSu/x3Ik1zQ9o0DlE/NkmQ1mBaXQeRdOesCfmWV1ZRB4VMJ50iIVxoV5p90bEhqEgDC0jFvcM7E+bvJvhf+1yUcUNMww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XVVtk2gG; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVVtk2gG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791754542; x=1823290542;
  h=date:from:to:cc:subject:message-id;
  bh=+pjj0FeaXMYUm+V+cqoYAftZoLBbqLSQOkzEKvz3EJs=;
  b=XVVtk2gGJdSb/W/t2iOyBrJfSNj2BX8p08220Bgl1cRMBCzehD0o+JAz
   TF1v/7wRyb93tWcYDUkGtJpEVYo8L/IFkd20iAXA/VBbm9jR71GrBOOpa
   FA60CAl/mWwvaKuI+AumpzUZj082vSjfKLqDr75T3jot2qgA/ERszMnMK
   CK/HTgLtxGicQiWrd8/RzPKypp469XKxvjXCuZJlReCY9kZgFuqCxjI1x
   2+FiZIY35vpDvWWCiZ9vadxoDIM7JhV5vvAfRGUxGNPHIGpG+xjLEbzhY
   IbL60aUUvfW5NKk8Qh+UpKCLzeAOwdrFdWGXMnVFgJdYcKSzi8XBO7Mxn
   A==;
X-CSE-ConnectionGUID: UJD0OZoIQliq+R21uXT+5Q==
X-CSE-MsgGUID: WyBFYITQTueFszovyAGMNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="360737"
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="360737"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 14:35:41 -0700
X-CSE-ConnectionGUID: hAAtQ9E7RgC5gggq/kmmLw==
X-CSE-MsgGUID: uTyPzQByTueVWkV9Kcs6jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="666731"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 11 Oct 2026 14:35:40 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xG1Ci-000000009eV-2jk1;
	Sun, 11 Oct 2026 21:35:36 +0000
Date: Sun, 11 Oct 2026 23:35:31 +0200
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>
Subject: ld.lld: error: undefined symbol:
 __kcfi_typeid_aria_aesni_avx2_gfni_encrypt_32way
Message-ID: <202610112311.o9XQsWsa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Kees,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d6d3455d8751854e0d1820f14184682e23ac4475
commit: 23ef9d439769d5f35353650e771c63d13824235b kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
date:   1 year, 1 month ago
config: x86_64-randconfig-2000-20261011 (https://download.01.org/0day-ci/archive/20261011/202610112311.o9XQsWsa-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261011/202610112311.o9XQsWsa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 23ef9d439769 ("kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610112311.o9XQsWsa-lkp@intel.com/

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
