Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB643158A2D;
	Tue,  9 Apr 2024 21:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712699348; cv=none; b=Dg3ayR4VftAVCXyYt3rfZjNRp6eoRIVU4HxyuYHYn2jvK0J2m3276b9NfubcbBPpsoeWu1HatE5xQMYvLo3hAL5K21iyuYztQKTYaBkq2s9CaZ0S5ribGRLEYnjXi6CIusizGzONzsPs+aOAawUSgrxq/s8q+GZSZoZOM4TdlZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712699348; c=relaxed/simple;
	bh=8+YnjvCExqshUUEVy/QNQYYWHn7CXuK9KgtdnAdVd7k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YuPTh/qIt37ch6uWYNRPHee6gLyPG0Ec6Bwv7hcU/Q/LQtCD1PrUqtp6UOUT7pOng9R4R1rSRtZ8gWG7b4sS3Me5hN5ZbEmfp5+E5bI+z20KRYjlwuEcil7JYbWi+FDXFSH7Wb6cTja7ULRdJLor03mTL/UX3Un+BKuJUg/5+8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GHtnLjx3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GHtnLjx3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712699347; x=1744235347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8+YnjvCExqshUUEVy/QNQYYWHn7CXuK9KgtdnAdVd7k=;
  b=GHtnLjx3YZnMLAdLO35Xcsj0xwio55iiwBJzTiMuNjwy/WqwoPnS2kWm
   fQiO3ChymVn6ka4tnriU1kFd44ls4VKWXkUGiU1q3yFE/QsU6RCaX5kgi
   v3sdKkIj4/XiYcjda/XbRF6dXvvIdNAIBkV7e8J004TCVfzHHXN2A/AGo
   zs5uocjaNzsCWYkl6MeWpwnsv6NwUFvpJUDbzMlsDIO6naRRSdZMVra91
   6bMJ8OzsQ5X+/cn2fgJjbbhnYBeHsvLo6tnaNPsou7Dfswe6k5/DzRfNC
   M1YXY2VfyYSzZenNcjR6xVWcnFK6fVy2JRzxk6Fhlumx6eB2uQl+bqVUk
   Q==;
X-CSE-ConnectionGUID: rGuKYBSXSa2OysSwIIOg0A==
X-CSE-MsgGUID: YQtb8ltDQqGgYFNFC7bc/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8208583"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8208583"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 14:49:06 -0700
X-CSE-ConnectionGUID: H7i8SzPZQMSRFtobA359fg==
X-CSE-MsgGUID: zoeztdJhRoG2XZ17kW9M9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="51558559"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Apr 2024 14:49:04 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruJKw-0006Xi-0W;
	Tue, 09 Apr 2024 21:49:02 +0000
Date: Wed, 10 Apr 2024 05:48:04 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:vfs.misc 14/14] drivers/accel/qaic/qaic_drv.c:189:1:
 error: expected expression
Message-ID: <202404100540.G26QRS9O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.misc
head:   27a838e027e7fca274675ba21eeedb93b9425f3e
commit: 27a838e027e7fca274675ba21eeedb93b9425f3e [14/14] fs: move FMODE_UNSIGNED_OFFSET to fop_flags
config: i386-randconfig-001-20240410 (https://download.01.org/0day-ci/archive/20240410/202404100540.G26QRS9O-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404100540.G26QRS9O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404100540.G26QRS9O-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/accel/qaic/qaic_drv.c:189:1: error: expected expression
     189 | DEFINE_DRM_ACCEL_FOPS(qaic_accel_fops);
         | ^
   include/drm/drm_accel.h:50:17: note: expanded from macro 'DEFINE_DRM_ACCEL_FOPS'
      50 |                 DRM_ACCEL_FOPS,\
         |                               ^
   drivers/accel/qaic/qaic_drv.c:437:46: warning: shift count >= width of type [-Wshift-count-overflow]
     437 |         ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
         |                                                     ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   1 warning and 1 error generated.


vim +189 drivers/accel/qaic/qaic_drv.c

c501ca23a6a306 Jeffrey Hugo 2023-03-27  188  
c501ca23a6a306 Jeffrey Hugo 2023-03-27 @189  DEFINE_DRM_ACCEL_FOPS(qaic_accel_fops);
c501ca23a6a306 Jeffrey Hugo 2023-03-27  190  

:::::: The code at line 189 was first introduced by commit
:::::: c501ca23a6a306a7c11631e02a26c8e0a768d64b accel/qaic: Add uapi and core driver file

:::::: TO: Jeffrey Hugo <quic_jhugo@quicinc.com>
:::::: CC: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
