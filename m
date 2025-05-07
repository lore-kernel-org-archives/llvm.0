Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AE942A83;
	Wed,  7 May 2025 18:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746641436; cv=none; b=iJ/+rCtRDwvOz0qAPngbay5aVXEPvjk0LgKQlxFyRvoH8v6UowhzEYMmxBGBgf7kV0YaW9zCtMEIhTtS76xdnuhoLp4zca/8QQ57pTCb7otTHTjTAxPjQMZAQ2Onp5eXxi3HVCp32zvA2yJViLWKR//nxZ9+DPpvjraKZjBy/vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746641436; c=relaxed/simple;
	bh=KfrIpCAjtAN1FCbuihVC4TpplvyLnMC4LdFg/GZIWv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jnclQjT28nCN3CwJzBoAZECpFYqUNGPrS5dEzwbWAKilagT7a/u/lbgiBBEDGbJrQZ1zxb4rBJC3nC3mGu/I+DsTodRsvnPdOzDx6y/3NkpfFhKfrokR3PSRi1vb5L1AUbgzkJSs8X8Db6CmIRGymRKr/J6Ojx0EjoN2sRIg3vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kvzm823B; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kvzm823B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746641434; x=1778177434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KfrIpCAjtAN1FCbuihVC4TpplvyLnMC4LdFg/GZIWv0=;
  b=Kvzm823BGresgP+ytCr9wUXc6BjYxU5bagvBmXwLAThVPKREn/Zpuz9e
   327+z3lm0tHXfEdnAtYv08x+6cobut88MAQT9GgaBF7BQmH3jSO44TvBt
   //MpVBPO52PZU87xOnIOvG1dbtGpApoGFeTU+EEjYfSrNvzBLxVHDJOO8
   S3kREblTVlHC6LGJ1qkEs4OA8+bh3JJ6BpaBDb1pb1tz3QuMGaMTcXJoj
   ffA/LW1bpwUQrZFpM825pvqlIv1//YgBaUDygmxBG2McR1oEt85QTScrL
   cHI86Ge3S0QQUAmDieXXfFakEnOl0+LwVHao2Hy9h+3D+f8PMuA+iKMfr
   w==;
X-CSE-ConnectionGUID: uhnA+7YARO6CRHymbwkh4A==
X-CSE-MsgGUID: WdDI4rLpS2aRbnn9lR9xvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48536609"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="48536609"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 11:10:34 -0700
X-CSE-ConnectionGUID: Y4MJpqApSaCYb2hEFNxI8A==
X-CSE-MsgGUID: ACknwD8HQ3yGGJVJZIM+zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="136435878"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 May 2025 11:10:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCjDy-0008Gb-1V;
	Wed, 07 May 2025 18:10:30 +0000
Date: Thu, 8 May 2025 02:10:08 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] drm/xe: fix devcoredump chunk alignmnent calculation
Message-ID: <202505080202.PVZkksZk-lkp@intel.com>
References: <20250429073407.3505712-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429073407.3505712-1-arnd@kernel.org>

Hi Arnd,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[cannot apply to linus/master v6.15-rc5 next-20250507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/drm-xe-fix-devcoredump-chunk-alignmnent-calculation/20250429-153441
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250429073407.3505712-1-arnd%40kernel.org
patch subject: [PATCH] drm/xe: fix devcoredump chunk alignmnent calculation
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250508/202505080202.PVZkksZk-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505080202.PVZkksZk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505080202.PVZkksZk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_devcoredump.c:205:6: warning: variable 'chunk_offset' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     205 |         if (offset >= ss->read.chunk_position + XE_DEVCOREDUMP_CHUNK_MAX ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     206 |             offset < ss->read.chunk_position) {
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_devcoredump.c:218:35: note: uninitialized use occurs here
     218 |         memcpy(buffer, ss->read.buffer + chunk_offset, byte_copied);
         |                                          ^~~~~~~~~~~~
   include/linux/fortify-string.h:690:50: note: expanded from macro 'memcpy'
     690 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                                                  ^
   include/linux/fortify-string.h:645:23: note: expanded from macro '__fortify_memcpy_chk'
     645 |         __underlying_##op(p, q, __copy_size);                           \
         |                              ^
   drivers/gpu/drm/xe/xe_devcoredump.c:205:2: note: remove the 'if' if its condition is always true
     205 |         if (offset >= ss->read.chunk_position + XE_DEVCOREDUMP_CHUNK_MAX ||
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     206 |             offset < ss->read.chunk_position) {
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_devcoredump.c:180:18: note: initialize the variable 'chunk_offset' to silence this warning
     180 |         u32 chunk_offset;
         |                         ^
         |                          = 0
   1 warning generated.


vim +205 drivers/gpu/drm/xe/xe_devcoredump.c

c4a2e5f865b7230 Matthew Brost 2025-04-23  173  
4f04d07c0a94b0b Matthew Brost 2024-08-01  174  static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
4f04d07c0a94b0b Matthew Brost 2024-08-01  175  				   size_t count, void *data, size_t datalen)
4f04d07c0a94b0b Matthew Brost 2024-08-01  176  {
4f04d07c0a94b0b Matthew Brost 2024-08-01  177  	struct xe_devcoredump *coredump = data;
4f04d07c0a94b0b Matthew Brost 2024-08-01  178  	struct xe_devcoredump_snapshot *ss;
4f04d07c0a94b0b Matthew Brost 2024-08-01  179  	ssize_t byte_copied;
15ba154d0115c83 Arnd Bergmann 2025-04-29  180  	u32 chunk_offset;
4f04d07c0a94b0b Matthew Brost 2024-08-01  181  
4f04d07c0a94b0b Matthew Brost 2024-08-01  182  	if (!coredump)
4f04d07c0a94b0b Matthew Brost 2024-08-01  183  		return -ENODEV;
4f04d07c0a94b0b Matthew Brost 2024-08-01  184  
4f04d07c0a94b0b Matthew Brost 2024-08-01  185  	ss = &coredump->snapshot;
4f04d07c0a94b0b Matthew Brost 2024-08-01  186  
4f04d07c0a94b0b Matthew Brost 2024-08-01  187  	/* Ensure delayed work is captured before continuing */
4f04d07c0a94b0b Matthew Brost 2024-08-01  188  	flush_work(&ss->work);
4f04d07c0a94b0b Matthew Brost 2024-08-01  189  
c4a2e5f865b7230 Matthew Brost 2025-04-23  190  	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
c4a2e5f865b7230 Matthew Brost 2025-04-23  191  		xe_pm_runtime_get(gt_to_xe(ss->gt));
c4a2e5f865b7230 Matthew Brost 2025-04-23  192  
906c4b306e9340f John Harrison 2024-11-28  193  	mutex_lock(&coredump->lock);
906c4b306e9340f John Harrison 2024-11-28  194  
906c4b306e9340f John Harrison 2024-11-28  195  	if (!ss->read.buffer) {
906c4b306e9340f John Harrison 2024-11-28  196  		mutex_unlock(&coredump->lock);
4f04d07c0a94b0b Matthew Brost 2024-08-01  197  		return -ENODEV;
906c4b306e9340f John Harrison 2024-11-28  198  	}
4f04d07c0a94b0b Matthew Brost 2024-08-01  199  
906c4b306e9340f John Harrison 2024-11-28  200  	if (offset >= ss->read.size) {
906c4b306e9340f John Harrison 2024-11-28  201  		mutex_unlock(&coredump->lock);
4f04d07c0a94b0b Matthew Brost 2024-08-01  202  		return 0;
906c4b306e9340f John Harrison 2024-11-28  203  	}
4f04d07c0a94b0b Matthew Brost 2024-08-01  204  
c4a2e5f865b7230 Matthew Brost 2025-04-23 @205  	if (offset >= ss->read.chunk_position + XE_DEVCOREDUMP_CHUNK_MAX ||
c4a2e5f865b7230 Matthew Brost 2025-04-23  206  	    offset < ss->read.chunk_position) {
15ba154d0115c83 Arnd Bergmann 2025-04-29  207  		ss->read.chunk_position = div_u64_rem(offset,
15ba154d0115c83 Arnd Bergmann 2025-04-29  208  			XE_DEVCOREDUMP_CHUNK_MAX, &chunk_offset)
15ba154d0115c83 Arnd Bergmann 2025-04-29  209  			* XE_DEVCOREDUMP_CHUNK_MAX;
c4a2e5f865b7230 Matthew Brost 2025-04-23  210  
c4a2e5f865b7230 Matthew Brost 2025-04-23  211  		__xe_devcoredump_read(ss->read.buffer,
c4a2e5f865b7230 Matthew Brost 2025-04-23  212  				      XE_DEVCOREDUMP_CHUNK_MAX,
c4a2e5f865b7230 Matthew Brost 2025-04-23  213  				      ss->read.chunk_position, coredump);
c4a2e5f865b7230 Matthew Brost 2025-04-23  214  	}
c4a2e5f865b7230 Matthew Brost 2025-04-23  215  
4f04d07c0a94b0b Matthew Brost 2024-08-01  216  	byte_copied = count < ss->read.size - offset ? count :
4f04d07c0a94b0b Matthew Brost 2024-08-01  217  		ss->read.size - offset;
15ba154d0115c83 Arnd Bergmann 2025-04-29  218  	memcpy(buffer, ss->read.buffer + chunk_offset, byte_copied);
4f04d07c0a94b0b Matthew Brost 2024-08-01  219  
906c4b306e9340f John Harrison 2024-11-28  220  	mutex_unlock(&coredump->lock);
906c4b306e9340f John Harrison 2024-11-28  221  
c4a2e5f865b7230 Matthew Brost 2025-04-23  222  	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
c4a2e5f865b7230 Matthew Brost 2025-04-23  223  		xe_pm_runtime_put(gt_to_xe(ss->gt));
c4a2e5f865b7230 Matthew Brost 2025-04-23  224  
4f04d07c0a94b0b Matthew Brost 2024-08-01  225  	return byte_copied;
4f04d07c0a94b0b Matthew Brost 2024-08-01  226  }
4f04d07c0a94b0b Matthew Brost 2024-08-01  227  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
