Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE3E360;
	Wed, 24 Apr 2024 00:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713917092; cv=none; b=oVzz08NleNcp5m1tHyzMXtiUK6Kg0m9iHQ+pSDRHCeN5i5iq+e4F7DWToEWS0d+iKxnVnV2Pr0SWAXMPGXcZ0pSRNJdZhyyPuuq37Nbvrdg7GUL6Hxe5q6djui4VEiJWyjFRd2ooDUHWbuIjX8L1fCChab9NqFvAWLNrsRFCekU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713917092; c=relaxed/simple;
	bh=JhXXtVidywYyJCxZ612R5dKQGPfygkvGQUzTXJIOQF0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kKIa3W+maYR2iP62hfkGA5HHlX14qpHZ4mSCEvctexl4x3wHkcaF6P5xoMddyJ8tuv8zP9TY34plideYbSvh1YhXRwnCKmlUKdTPbGE6Ad22u/2jJQ8w07LbhiqVbKNoEt2+dGj8iHcOGQds8CB3dJ8vYPnaUUZtK2QYJVy/cRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NcGtQEGL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NcGtQEGL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713917090; x=1745453090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JhXXtVidywYyJCxZ612R5dKQGPfygkvGQUzTXJIOQF0=;
  b=NcGtQEGLNksCCh/SgNWnnddSEJljSZUgTbIh8pEPqtj5173/LD2KqAde
   WzEbbY8fgvwfdhtvCmWrX4f8Dso4KFT3Sggmw+kXM1mIbIq4JGOmh8OpN
   zKq8/VbvLsdyG8RoA6KKwc1YPxA51O4NJPk+XViPaoewx0waxZGDCGGC5
   sk27yClz8lt0Nv//k0kHW1afZy/RjufUj+oz09WmTd/S7PJCH8NwFbaQB
   crkdNeG6EB5aNOonQIl/ybhApsIMl0ViLIG3aTXFOEVtIniJE+R0kd4Ss
   GBD793dZWFdnzA98lE/ExsDc3M6QFcH4PLk3J97+z9H8svI+Rezt3w1JY
   A==;
X-CSE-ConnectionGUID: ZPlXoGFVReiGDa/p1f9uXw==
X-CSE-MsgGUID: cpsSXzI+SnucUYjYCe5Skw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9693816"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9693816"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 17:04:49 -0700
X-CSE-ConnectionGUID: GI9KYvWGRYy17upBUtW39Q==
X-CSE-MsgGUID: AMWTNh9cStuWWhtB0fuyQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24415478"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Apr 2024 17:04:49 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzQ7y-0000eK-0S;
	Wed, 24 Apr 2024 00:04:46 +0000
Date: Wed, 24 Apr 2024 08:03:59 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [weiny2:cxl-cper-testing 4/6] ld.lld: error: undefined symbol:
 __tracepoint_cper_cxl_event
Message-ID: <202404240707.LHd9bx3v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git cxl-cper-testing
head:   9b1f33314e8488506dbad63dc1c896386d4803d6
commit: 2d11892dead2fcc454ceb5779c01584d1bed0c6b [4/6] ras/events: Trace CXL CPER events without CXL stack
config: x86_64-randconfig-005-20240424 (https://download.01.org/0day-ci/archive/20240424/202404240707.LHd9bx3v-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404240707.LHd9bx3v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404240707.LHd9bx3v-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __tracepoint_cper_cxl_event
   >>> referenced by ras_event.h:429 (include/ras/ras_event.h:429)
   >>>               vmlinux.o:(cxl_cper_post_event)
   >>> referenced by ras_event.h:429 (include/ras/ras_event.h:429)
   >>>               vmlinux.o:(cxl_cper_post_event)
   >>> referenced by ras_event.h:429 (include/ras/ras_event.h:429)
   >>>               vmlinux.o:(cxl_cper_post_event)
   >>> referenced 1 more times
--
>> ld.lld: error: undefined symbol: __SCT__tp_func_cper_cxl_event
   >>> referenced by ras_event.h:429 (include/ras/ras_event.h:429)
   >>>               vmlinux.o:(cxl_cper_post_event)
--
>> ld.lld: error: undefined symbol: __SCK__tp_func_cper_cxl_event
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(.static_call_sites+0x81E4)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
