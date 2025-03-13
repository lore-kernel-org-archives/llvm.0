Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FC71F4E4B;
	Thu, 13 Mar 2025 22:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741906226; cv=none; b=QxnU/N6+nuaWFKaHeFJO3ZrmbGfXrA8qECdAaViL/b+29wr/ek3cux0FmtShcgHIcoMlblV2hc5k9uKHmGGdw+7XDr2mvZOjG2fGxHespmuuL5xpVVqp6DuuOwnbOxcrLPKLPo0CmyxyEx0SrR4Ii2lKQLj5nn3kDXNzJzRbTRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741906226; c=relaxed/simple;
	bh=X1/i1TkFC/0x2yza7q6KP2elp6KOwbOgLww3b8BM6lo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q0COrALFOMz0df9vCmcP/GFb7FmjkLnA036xFBHbC2SoIB/UBdTEtKVVfBF97fQYrYqaUVpAE0cKDe2lIpNLBYqryV9ZiVIMw9B3F60QaLOnvRd+09awqeLqCSGWD3bUUabmnTc7AahPOMFiqnEPdf6aTesBe3qvDzBykyB1b5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ErAXzrZd; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ErAXzrZd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741906226; x=1773442226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X1/i1TkFC/0x2yza7q6KP2elp6KOwbOgLww3b8BM6lo=;
  b=ErAXzrZdSMaQ/dgM+1sMdzoi82VMveWRhZyFEyLIikZj2gGbHMi6TTWH
   NhdTFvgjLkqaXRNR2yihlsEeL13h2nQBiE8v6D/zeSJ4y+mfjHejrRs6g
   V21tYdgzSJhOSiZn5Dy7oZDko2IUnRHSRaShT01CaOsb0xZFNLHp+P/wW
   Gku+C2nq5LVEpbyPT3mz/I7TLKxIYZ/ABSdgNVNx4iaFwCb/gIDq8fXVv
   zY9uxBBrN++sCIHIzOb5VnEDk9NGSK4g8Ssy4iaN7DwJbuypLO+IThxRP
   0gJNTLmAYKkMm4LctqnCF+5iekquIlRgFfGXjlRxuVMnnGPwE/gZ3KamM
   A==;
X-CSE-ConnectionGUID: dAISjrqsTWujgiCGGzDk3w==
X-CSE-MsgGUID: jPMB4vh+Q76ZbdMrabIqkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="54041181"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="54041181"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 15:50:25 -0700
X-CSE-ConnectionGUID: v/YAPnnLTzCFu2qN9QVNSA==
X-CSE-MsgGUID: WIFFS6TPQ0Oj8xDb2bcWXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="121086266"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 13 Mar 2025 15:50:24 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsrNd-0009yK-1U;
	Thu, 13 Mar 2025 22:50:21 +0000
Date: Fri, 14 Mar 2025 06:49:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 156/157] random.c:undefined
 reference to `__aeabi_uldivmod'
Message-ID: <202503140605.c12JCe8z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   a888eae7549b5515b25ca0846d4b39f1195a3020
commit: 8511d47d2b5a1d421bf69931c84c60f5c4c6e982 [156/157] random: get_random_u64_below()
config: arm-randconfig-002-20250314 (https://download.01.org/0day-ci/archive/20250314/202503140605.c12JCe8z-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503140605.c12JCe8z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503140605.c12JCe8z-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/char/random.o: in function `__get_random_u64_below':
>> random.c:(.text+0x966): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: fs/bcachefs/util.o: in function `bch2_get_random_u64_below':
   util.c:(.text+0xe74): undefined reference to `__aeabi_uldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
