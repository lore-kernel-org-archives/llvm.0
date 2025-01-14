Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B51236A61;
	Tue, 14 Jan 2025 12:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736858267; cv=none; b=BffXlboe/4BwKbMkPhZI+B0OLpBkDbflBl9Wr1No1BF9N3GOcdCOs1zrqhVATgcjJJC35r31i52jNETfFIx8xgzPnL7mb2Oys1mx0gRWGCTuONfKO+beo1FzgQJJjSMpf4RDJ2iCVTyDfyhd8Ehp4SN6hRUpAMeTtDFvPh+Da9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736858267; c=relaxed/simple;
	bh=Hbyj/X9IpuGU3wSl/vJoZSu3m8IS9FoLMiOWEK6qgKA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C0r8exqqEqsKX+cPDGqMq+ui6kHNYBz/y9EAsYqjFc6/5YgcXVWJMvjeUdCOh6Lv87y/lrpiiqyuDsrn4hJMtfwHc6/F9riHLmLCIqbHhiZ204XPyYk4osREp9l5dDJmadJuGN/gTHHMrj1RnZg0ABtuKy4T/T46gGhbZAmleo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HPHe4ihJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HPHe4ihJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736858266; x=1768394266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hbyj/X9IpuGU3wSl/vJoZSu3m8IS9FoLMiOWEK6qgKA=;
  b=HPHe4ihJPxi3QkZF4MPYAg1XQaZ53YqoVG4o9suhtOkeYFYSkRJffKT/
   NUnGlndP9mTR9Wh4FWkfUv1sc/8XFxpmNoPp2SiptXsblGokV1kyJ9sOd
   ZUaTOwF84lZJMfb5gbGFn5xdUKtK5yqcRuh5vokQL4wpBMhUntj50DXY0
   m7QKVQfV9F6OPhC8Q8MmMgJ7//bVR2CgdNF+4PnszDQPoRJG0XJRFqi+T
   rhy4rqh+j6MTTK+RHjdf4HDdb2d2ZR/zrhkucZQ9tlmdRKTXxZM/oO/f7
   vDxUXG+2aAO2sPjCtZq4krNhGJAgJW8Se/Ff/S2/2lM62adrD52yfygIm
   A==;
X-CSE-ConnectionGUID: 3Md500jhQe6YyFX31qyP3g==
X-CSE-MsgGUID: udJL6on7S9+WE7qPd4l2mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48533710"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="48533710"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 04:37:46 -0800
X-CSE-ConnectionGUID: jiMTXMfMQquUd9lUJ9/RCw==
X-CSE-MsgGUID: UFkaDVyiRVOZUP+htReLNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="105368376"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jan 2025 04:37:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXgAv-000OVh-1E;
	Tue, 14 Jan 2025 12:37:41 +0000
Date: Tue, 14 Jan 2025 20:36:39 +0800
From: kernel test robot <lkp@intel.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Xiang Gao <xiang@kernel.org>
Subject: [xiang:lz4-macros 1/1] lib/lz4/lz4hc_compress.c:86:15: error: use of
 undeclared identifier 'LZ4_MAX_DISTANCE'
Message-ID: <202501142005.DqdNQGKc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/linux.git lz4-macros
head:   cc151de616805bc027b30cfc99853989274e2a2d
commit: cc151de616805bc027b30cfc99853989274e2a2d [1/1] include/linux/lz4.h: add some missing macros
config: arm-randconfig-002-20250114 (https://download.01.org/0day-ci/archive/20250114/202501142005.DqdNQGKc-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f5cd181ffbb7cb61d582fe130d46580d5969d47a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250114/202501142005.DqdNQGKc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501142005.DqdNQGKc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/lz4/lz4hc_compress.c:86:15: error: use of undeclared identifier 'LZ4_MAX_DISTANCE'
      86 |                 if (delta > MAX_DISTANCE)
         |                             ^
   lib/lz4/lz4defs.h:96:22: note: expanded from macro 'MAX_DISTANCE'
      96 | #define MAX_DISTANCE LZ4_MAX_DISTANCE
         |                      ^
   lib/lz4/lz4hc_compress.c:87:12: error: use of undeclared identifier 'LZ4_MAX_DISTANCE'
      87 |                         delta = MAX_DISTANCE;
         |                                 ^
   lib/lz4/lz4defs.h:96:22: note: expanded from macro 'MAX_DISTANCE'
      96 | #define MAX_DISTANCE LZ4_MAX_DISTANCE
         |                      ^
   2 errors generated.
--
>> lib/lz4/lz4_compress.c:287:17: error: use of undeclared identifier 'LZ4_MAX_DISTANCE'
     287 |                                         : (match + MAX_DISTANCE < ip))
         |                                                    ^
   lib/lz4/lz4defs.h:96:22: note: expanded from macro 'MAX_DISTANCE'
      96 | #define MAX_DISTANCE LZ4_MAX_DISTANCE
         |                      ^
   lib/lz4/lz4_compress.c:416:16: error: use of undeclared identifier 'LZ4_MAX_DISTANCE'
     416 |                         && (match + MAX_DISTANCE >= ip)
         |                                     ^
   lib/lz4/lz4defs.h:96:22: note: expanded from macro 'MAX_DISTANCE'
      96 | #define MAX_DISTANCE LZ4_MAX_DISTANCE
         |                      ^
   lib/lz4/lz4_compress.c:597:16: error: use of undeclared identifier 'LZ4_MAX_DISTANCE'
     597 |                                 : (match + MAX_DISTANCE < ip))
         |                                            ^
   lib/lz4/lz4defs.h:96:22: note: expanded from macro 'MAX_DISTANCE'
      96 | #define MAX_DISTANCE LZ4_MAX_DISTANCE
         |                      ^
   lib/lz4/lz4_compress.c:676:16: error: use of undeclared identifier 'LZ4_MAX_DISTANCE'
     676 |                 if ((match + MAX_DISTANCE >= ip)
         |                              ^
   lib/lz4/lz4defs.h:96:22: note: expanded from macro 'MAX_DISTANCE'
      96 | #define MAX_DISTANCE LZ4_MAX_DISTANCE
         |                      ^
   4 errors generated.


vim +/LZ4_MAX_DISTANCE +86 lib/lz4/lz4hc_compress.c

c72ac7a1a926db Chanho Min   2013-07-08  71  
c72ac7a1a926db Chanho Min   2013-07-08  72  /* Update chains up to ip (excluded) */
4e1a33b105ddf2 Sven Schmidt 2017-02-24  73  static FORCE_INLINE void LZ4HC_Insert(LZ4HC_CCtx_internal *hc4,
4e1a33b105ddf2 Sven Schmidt 2017-02-24  74  	const BYTE *ip)
c72ac7a1a926db Chanho Min   2013-07-08  75  {
4e1a33b105ddf2 Sven Schmidt 2017-02-24  76  	U16 * const chainTable = hc4->chainTable;
4e1a33b105ddf2 Sven Schmidt 2017-02-24  77  	U32 * const hashTable	= hc4->hashTable;
c72ac7a1a926db Chanho Min   2013-07-08  78  	const BYTE * const base = hc4->base;
4e1a33b105ddf2 Sven Schmidt 2017-02-24  79  	U32 const target = (U32)(ip - base);
4e1a33b105ddf2 Sven Schmidt 2017-02-24  80  	U32 idx = hc4->nextToUpdate;
4e1a33b105ddf2 Sven Schmidt 2017-02-24  81  
4e1a33b105ddf2 Sven Schmidt 2017-02-24  82  	while (idx < target) {
4e1a33b105ddf2 Sven Schmidt 2017-02-24  83  		U32 const h = LZ4HC_hashPtr(base + idx);
4e1a33b105ddf2 Sven Schmidt 2017-02-24  84  		size_t delta = idx - hashTable[h];
c72ac7a1a926db Chanho Min   2013-07-08  85  
c72ac7a1a926db Chanho Min   2013-07-08 @86  		if (delta > MAX_DISTANCE)
c72ac7a1a926db Chanho Min   2013-07-08  87  			delta = MAX_DISTANCE;
c72ac7a1a926db Chanho Min   2013-07-08  88  
4e1a33b105ddf2 Sven Schmidt 2017-02-24  89  		DELTANEXTU16(idx) = (U16)delta;
c72ac7a1a926db Chanho Min   2013-07-08  90  
4e1a33b105ddf2 Sven Schmidt 2017-02-24  91  		hashTable[h] = idx;
4e1a33b105ddf2 Sven Schmidt 2017-02-24  92  		idx++;
c72ac7a1a926db Chanho Min   2013-07-08  93  	}
4e1a33b105ddf2 Sven Schmidt 2017-02-24  94  
4e1a33b105ddf2 Sven Schmidt 2017-02-24  95  	hc4->nextToUpdate = target;
c72ac7a1a926db Chanho Min   2013-07-08  96  }
c72ac7a1a926db Chanho Min   2013-07-08  97  

:::::: The code at line 86 was first introduced by commit
:::::: c72ac7a1a926dbffb59daf0f275450e5eecce16f lib: add lz4 compressor module

:::::: TO: Chanho Min <chanho.min@lge.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
