Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B2814D449;
	Thu, 22 Feb 2024 15:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708615220; cv=none; b=krdUfnfyQQB33gqEFEtKMkS7WiHC+YIKVhffK/m32FxGxYZnaGJfeIvmMk3i6/0asC2O9L+tccFYsGZQDsoOH6mCgwaYM0UclprxZA/WH95nsREIbaJvKbQGXBuBe+aAs9D4xO0q9787NIxs0nifec0gZTkkSllOKs13PtpCf1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708615220; c=relaxed/simple;
	bh=DOEcNnvoLkyjQ288qW1a1GhziFhw+xk7mDxHBqJDMfw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vGaVYLp+F5URXuAEeiHCczeKgmMrz5afrf3Oa+qbflcH+v2c+WcNiHkwdFtjAnVgR3fz4Su/hWqczJr4VicG1N3QslvU5z3htrWQqUWRyWJ3U8/y+sHH8sHbkvb4QgG9qbfq/UaKf+heRKW6Goj+rhVrBxPDKNEzVotZbYvQbCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q15vWfsR; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q15vWfsR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708615219; x=1740151219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DOEcNnvoLkyjQ288qW1a1GhziFhw+xk7mDxHBqJDMfw=;
  b=Q15vWfsRHEwSip3nyRKyhmf/PUcMTZ+FNglkfNdQEKidLYlU8YoUycTz
   +/wIm8HNvBoY60vHi/wwAEjEnNi5i5wA6poKUr7IvJ1oYbpX05Sg2nXor
   KLLvxOz4pXNkSuhswAv0kV9dFr2hGp6cB7sAGNez+bQII2T15cBhpiH3R
   kGCSc/XNROzUDzXrlGLYYMllc22SwKdlNqDeqKEeTTLVyFZUUw3l4dR6i
   fjQ/iEnb0r45upHdoc0X4CCppKlhVsizFn9MMcJ86MC8Vp7Pk8yTvYk1Y
   PSpcJeEdwBOF1OwGFqUsjDnfl7X5+dvQcuSXoBVgb2izC6tpfBMWM1yqP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="6665300"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="6665300"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 07:20:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="10200162"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Feb 2024 07:20:16 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdAra-0006QO-1z;
	Thu, 22 Feb 2024 15:19:58 +0000
Date: Thu, 22 Feb 2024 23:19:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [linux-next:master 8181/9122] arch/arm/boot/compressed/misc.c:157:6:
 warning: no previous prototype for function '__fortify_panic'
Message-ID: <202402222314.J6A7eb4B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e31185ce00a96232308300008db193416ceb9769
commit: 0f4459080884b688c4ec9c2b121f22c641401bc1 [8181/9122] fortify: Split reporting and avoid passing string pointer
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240222/202402222314.J6A7eb4B-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402222314.J6A7eb4B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402222314.J6A7eb4B-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm/boot/compressed/misc.c:157:6: warning: no previous prototype for function '__fortify_panic' [-Wmissing-prototypes]
   void __fortify_panic(const u8 reason)
        ^
   arch/arm/boot/compressed/misc.c:157:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __fortify_panic(const u8 reason)
   ^
   static 
   1 warning generated.


vim +/__fortify_panic +157 arch/arm/boot/compressed/misc.c

   156	
 > 157	void __fortify_panic(const u8 reason)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
