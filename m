Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB183E5569;
	Fri,  8 May 2026 14:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778250971; cv=none; b=qkexfXKg9pHSQfT9FQLSpv4DZPHXU4vGfS9g9Xj3HdHWK82GajD6tFc9/x8dnoR0uP6uF+xQyv1QuQ0HYADNb6eYBYXxlBbdMb/+ePwoc+aJDAQbFAg1wAZV5dY+lJ+sVfGjJry4sEk98cjDXCFn6p+1yO/OJjDELDVyMF3QIoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778250971; c=relaxed/simple;
	bh=TqJsRyxrl4vmszK7gaA6wrhm0bAp3WRwUqZqdfv5GfI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kEMkoOOoQUckmR5NpyzH54ubhzAVnDuHQkssYmmkvrPvWsYLdNzCfMrEXZixZndbx7/XqQYl0xr8lShTV2VnnDEjWq0ObM1uafOPzbQ2D2DrD6Q5tt93T/s9YIPCejfAEDKmkNyIvrTCQzR//O99GA3l6l5M75toMncH4u4N+3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YSaAXYdl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YSaAXYdl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778250971; x=1809786971;
  h=date:from:to:cc:subject:message-id;
  bh=TqJsRyxrl4vmszK7gaA6wrhm0bAp3WRwUqZqdfv5GfI=;
  b=YSaAXYdlRPnMoiQ4i8Qt05dOu3Vr+EjmjpTyXh7DleV4mObTh+Vmp+Xj
   RtOBGwpSaaD6/1VdqL63p/xdUxhBH3bRpFoEBrse3VeFOPfhCzkIjsvs8
   9PHY50w41X4r8W8dhTGh2o/F77d4ijgp7NgowLVWhsBCfp2WuQqEFwIr7
   jMLcf2dqrR9yWe6GZ7Vm4JJHWnz11wt1YrEAsQ0ZmYN2ISFSjKaoqMtqq
   285QshgPeTlzpzo7yhudpJg/c3VBzOw0FmKlXV/GfzEh+zaHBGuG4bZ3M
   /RwtM/fnU9EZjjmq1wwlrRlUfbYBt2MdC4tmaWrlK626uIJKwbgmCLqGP
   A==;
X-CSE-ConnectionGUID: odkMm6cMQm2/ufhPTR5jRA==
X-CSE-MsgGUID: B8voSwBOTpmR6K74NZTtLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="79119018"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="79119018"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 07:36:10 -0700
X-CSE-ConnectionGUID: 5/R4OVoQSYa3n73QoUcsSQ==
X-CSE-MsgGUID: mmDe3HDnRlqqPH3HVa3qNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="232253508"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 May 2026 07:36:08 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLMJB-000000000CL-2QiN;
	Fri, 08 May 2026 14:36:05 +0000
Date: Fri, 08 May 2026 22:36:04 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 82/82] ld.lld: error: unknown
 --orphan-handling mode:
Message-ID: <202605082205.mrlgmNjC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/bvanassche/linux thread-safety
head:   ac4ab1dad6eae4a7b93acb1277d3507a5d07b7ef
commit: ac4ab1dad6eae4a7b93acb1277d3507a5d07b7ef [82/82] treewide: Suppress randconfig failures [ won't be sent upstream ]
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260508/202605082205.mrlgmNjC-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605082205.mrlgmNjC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605082205.mrlgmNjC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: unknown --orphan-handling mode: 
   make[3]: *** [arch/arm64/kernel/vdso32/Makefile:128: arch/arm64/kernel/vdso32/vdso.so.raw] Error 1
   make[3]: Target 'arch/arm64/kernel/vdso32/vdso.so' not remade because of errors.
   make[2]: *** [arch/arm64/Makefile:208: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
