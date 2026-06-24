Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922653E5A03;
	Wed, 24 Jun 2026 21:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335240; cv=none; b=TJCbJoqBpj2J9KC0c/+HJGgIB45LcMp8ojRV9TlkGwsZ+AyScaYGxlNa7kwZtLjnM/Iakpop7MZpRBQi76qe8PgPf2vGinbHCIJ4V7T/lFcuIartsVyLw6NOZTHzMMqoiXlqohazozw48PvqT6Zr0clKxGAMAMCQCGJz2Jti7aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335240; c=relaxed/simple;
	bh=RbBG84BVROy40LoOm6/5iceOahMN618vNuHP8PBMDKw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=quKQL+aj84lG01bDxTHIzOEVS7tQBgsa9kJIejL/kPyYQAaQGTHwgTNKXdJ097Mb/AFO9wGwG+scjTHzKmkXww4eJsV290Nv5Tc6k7pjVEZW3ZK0K3HNwsf7wxeaIl2H69COwKAfPse0Z5vCzuIb/uTTsN85Copo+pGS2mfs5AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ArhNSeOw; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ArhNSeOw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782335238; x=1813871238;
  h=date:from:to:cc:subject:message-id;
  bh=RbBG84BVROy40LoOm6/5iceOahMN618vNuHP8PBMDKw=;
  b=ArhNSeOwM7eamdZHNpSOowd361oDGENMnMkuwGBoZTDd2jYpbSM3AgoZ
   PB8oq8qvPcCaxcXdf20BPrtV6mDW6A3e/X3fUj1FMYxhRaVkVOkCl2fhp
   7lfN1G8+zOGHchA0bMLUQFUJ0PhsxAg5SM0B4hWpQ7K5o/SZX8NE202XI
   n3xnl1C5H2NWAFV+6dfwax22jAUTglEKEnhB9mVM1ux1GnKPgXxdxNgRC
   fpfZRhrBjUoQtXV6kYkewxVveMvOndGO9vE7RU4PzLkCS9boexSH3bbeD
   KSd9ajH1dFiMBDRuQ44t6XnRwUJbzmq+b9FVB1UY8wW6jsADU77GJkFVB
   Q==;
X-CSE-ConnectionGUID: kOqH4S8rRT62A7mNzAQ0bA==
X-CSE-MsgGUID: DdC6kiyxQZaeSDwwVjZxnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83160826"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="83160826"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 14:07:17 -0700
X-CSE-ConnectionGUID: b84Nk6aZTfKj25BRpuO47A==
X-CSE-MsgGUID: KUHMAlNxR8GBvavKlqg65Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="274205825"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 24 Jun 2026 14:07:15 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcUoG-000000003fT-1UYc;
	Wed, 24 Jun 2026 21:07:05 +0000
Date: Thu, 25 Jun 2026 05:05:48 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:abi-test 34/34]
 ./usr/include/xen/gntalloc.h:35:3: error: declaration does not declare
 anything
Message-ID: <202606250429.oIOrOuDU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git abi-test
head:   741e95c4b46803e113402223592189848b0ac9c8
commit: 741e95c4b46803e113402223592189848b0ac9c8 [34/34] uapi: all other changes
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260625/202606250429.oIOrOuDU-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606250429.oIOrOuDU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606250429.oIOrOuDU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/xen/gntalloc.h:35:3: error: declaration does not declare anything [-Werror,-Wmissing-declarations]
      35 |                 struct {
         |                 ^
   1 error generated.
--
   In file included from <built-in>:1:
>> ./usr/include/drm/i915_drm.h:3466:2: error: union has size 0 in C, size 1 in C++ [-Werror,-Wextern-c-compat]
    3466 |         union {
         |         ^
   1 error generated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
