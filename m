Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C34A4431;
	Sun, 30 Mar 2025 07:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743320877; cv=none; b=RNCv3UdQEIoEtCqgLbKYiSSaUmeIJtnAO45RMcetTMJksxJLC7SyYZ/II55mz2s37jsVZC2c2K2KYShxtB8qVXcXexet4FmS+faEwkwtEipTSz6IvYbZR6hq91XX+MQ0SDjQpGrOjr8fcPbJa0GvRoJC2lPyo6v7/EnnxTo19Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743320877; c=relaxed/simple;
	bh=agmq3BJFfKjm6WJnfy/efefl5I8SWNMnuGVlmnz6JM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NfVNhzlNbGPCfavKyWR89wMgff9j9/vW6ozTvKcnXIJebprIUVh4/dRnBjqwD8ZH5Pdu23orU1AUbRlRoaThSkP338JcC46tz5dfSZXqf7K2A582CtHjCXcma4mkrIHX0mo3lNt8Q3jPBgAO4uUdXMgf8BURTUzjFM+94iL4dVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FRHe0WVm; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FRHe0WVm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743320875; x=1774856875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=agmq3BJFfKjm6WJnfy/efefl5I8SWNMnuGVlmnz6JM0=;
  b=FRHe0WVmLHrFiYLk85V12t2/B8wsKWTYWnhb1BZXXLpR3UdLwa4xeEtJ
   QNPq/6Ghsb0x7eaRqMpqEFOcyxUp2fxcwi9qOXAFPmvEPtVNKBnZVdKwZ
   2vUbHIMfTeQPKO6rtiREsIkzAVFAtxdRqTJlHXjLms3WXBQEICA17s3gv
   cqccCY1hRSdL7FBJcoZykVFhFziLxWBS7GDjx1+mR2GU3NyGTHGNUc98i
   H3ztwUVl3JS90Pcsp+9bPJAxT5IM/FE0BwmorhjcpsOcX4MWKtPlK1TZj
   pW7c6+jSr/rY0Z/KJsMvt26G40wdBK1oz92mW4KjfmyYqpbeV8ddShpJ9
   g==;
X-CSE-ConnectionGUID: 4RH8pSl3Ti2soLeq1rs+1A==
X-CSE-MsgGUID: SrUPWXBOSNiwfoXOaei4Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="55292714"
X-IronPort-AV: E=Sophos;i="6.14,287,1736841600"; 
   d="scan'208";a="55292714"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 00:47:54 -0700
X-CSE-ConnectionGUID: +GdJHhQyQQiGF1/foCHkkQ==
X-CSE-MsgGUID: wr5sae2lTp6XIKKm3DRUxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,287,1736841600"; 
   d="scan'208";a="125640434"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 30 Mar 2025 00:47:53 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tynOZ-0008aa-1O;
	Sun, 30 Mar 2025 07:47:51 +0000
Date: Sun, 30 Mar 2025 15:47:24 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-crc 11/11] arch/um/include/asm/fpu/api.h:16:9: error:
 use of undeclared identifier 'true'
Message-ID: <202503301503.yFvzJppL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-crc
head:   e56e2af8867c3690298e889b9febb1cb4d712341
commit: e56e2af8867c3690298e889b9febb1cb4d712341 [11/11] lib/crc_kunit.c: add proper nosimd testing
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250330/202503301503.yFvzJppL-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250330/202503301503.yFvzJppL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503301503.yFvzJppL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/simd.c:8:
   In file included from include/linux/simd.h:4:
   In file included from arch/x86/include/asm/simd.h:6:
   arch/um/include/asm/fpu/api.h:14:15: error: unknown type name 'bool'
      14 | static inline bool irq_fpu_usable(void)
         |               ^
>> arch/um/include/asm/fpu/api.h:16:9: error: use of undeclared identifier 'true'
      16 |         return true;
         |                ^
   In file included from lib/simd.c:8:
   In file included from include/linux/simd.h:4:
   arch/x86/include/asm/simd.h:8:28: error: unknown type name 'bool'
       8 | static __must_check inline bool __may_use_simd(void)
         |                            ^
   3 errors generated.


vim +/true +16 arch/um/include/asm/fpu/api.h

c0ecca6604b80e Anton Ivanov 2021-03-12  13  
c0ecca6604b80e Anton Ivanov 2021-03-12  14  static inline bool irq_fpu_usable(void)
c0ecca6604b80e Anton Ivanov 2021-03-12  15  {
c0ecca6604b80e Anton Ivanov 2021-03-12 @16  	return true;
c0ecca6604b80e Anton Ivanov 2021-03-12  17  }
c0ecca6604b80e Anton Ivanov 2021-03-12  18  

:::::: The code at line 16 was first introduced by commit
:::::: c0ecca6604b80e438b032578634c6e133c7028f6 um: enable the use of optimized xor routines in UML

:::::: TO: Anton Ivanov <anton.ivanov@cambridgegreys.com>
:::::: CC: Richard Weinberger <richard@nod.at>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
