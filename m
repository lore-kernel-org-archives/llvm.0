Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB4A2101B3;
	Wed,  7 May 2025 07:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746601656; cv=none; b=YiOUIBRVRsYOunLuUpCF6q68UL6O2Q7KyaVUjQBVEEK3jAZr5d0vzFIl/4xANPcvmroAYiUXO3sKTx00Z284YlGS+M6K9UzjzTchPJvryrYO9s2CsJE/d+PcYN6bqXavQ0/BCAV3PjVbmlRBcyqThrzPUKxeX/0fN2AF8Ihq8xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746601656; c=relaxed/simple;
	bh=o5itVuxw0UhbTIyGHzro5ngKlGtHa5jq9Nfar9D+vaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EhovOREsDwrQ6xl7El8uNKBj3SB4RGqvNm9FXm/Vhc0o1N4gI++SSr01U3Yui91t/8wq2vGwGxoxWNRNu9Ogi1ox72rx2zeTi0w/f7f7TNqjTEVBJK8MQ8pFO28zV9+cLHd/lumYvtP56NWwl9Ko6xpZ4cR8zAWCmc1Dwp5pcd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Md161QFO; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Md161QFO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746601654; x=1778137654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o5itVuxw0UhbTIyGHzro5ngKlGtHa5jq9Nfar9D+vaM=;
  b=Md161QFOtGLbLncCwx0iy2ASxNZvKfsqbyBUjR/g2Ids2c+wewog46+t
   0XkEk/+6SZiaAIQSeghi/bP3BgcJJ8pPcN3wxO/13oL1xjG7faMTHcI+q
   m5pGw3mclRf69dNM9lTlf4xNpBnesoZRwwL31DSX5iRa53gTlcyc/mDRy
   ZbyjDLIxFBFcEMyqg4QwJrsdj+E54M2mus1M/FaDHu9apyysE3xd6eTWY
   RWRs5lzOF9TJ4qPbdDpGVDYNCaG4FijLhfA9igx7iU4btmbxJ4S7ClnLn
   iOmiy1mSLGeDKnHdadLOB0QvPlO979w3Ku59IZIYilpvHE/i3ZetymdQf
   Q==;
X-CSE-ConnectionGUID: yubW6kCPSDWmXSxgBy294g==
X-CSE-MsgGUID: G0o9SUxpSkqUo0EeCNNAaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="52127890"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="52127890"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 00:07:32 -0700
X-CSE-ConnectionGUID: CqFD7g59TpymEgcY9J5YPQ==
X-CSE-MsgGUID: Bur6u0cLQWiouXmdCjLRRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="135865531"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 May 2025 00:07:31 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCYsK-0007GB-21;
	Wed, 07 May 2025 07:07:28 +0000
Date: Wed, 7 May 2025 15:07:17 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] drm/xe: fix devcoredump chunk alignmnent calculation
Message-ID: <202505071439.ugStPmtl-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[cannot apply to linus/master v6.15-rc5 next-20250506]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/drm-xe-fix-devcoredump-chunk-alignmnent-calculation/20250429-153441
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250429073407.3505712-1-arnd%40kernel.org
patch subject: [PATCH] drm/xe: fix devcoredump chunk alignmnent calculation
config: i386-randconfig-013-20250506 (https://download.01.org/0day-ci/archive/20250507/202505071439.ugStPmtl-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071439.ugStPmtl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071439.ugStPmtl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_devcoredump.c:205:6: error: variable 'chunk_offset' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
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
   1 error generated.


vim +205 drivers/gpu/drm/xe/xe_devcoredump.c

c4a2e5f865b723 Matthew Brost 2025-04-23  173  
4f04d07c0a94b0 Matthew Brost 2024-08-01  174  static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
4f04d07c0a94b0 Matthew Brost 2024-08-01  175  				   size_t count, void *data, size_t datalen)
4f04d07c0a94b0 Matthew Brost 2024-08-01  176  {
4f04d07c0a94b0 Matthew Brost 2024-08-01  177  	struct xe_devcoredump *coredump = data;
4f04d07c0a94b0 Matthew Brost 2024-08-01  178  	struct xe_devcoredump_snapshot *ss;
4f04d07c0a94b0 Matthew Brost 2024-08-01  179  	ssize_t byte_copied;
15ba154d0115c8 Arnd Bergmann 2025-04-29  180  	u32 chunk_offset;
4f04d07c0a94b0 Matthew Brost 2024-08-01  181  
4f04d07c0a94b0 Matthew Brost 2024-08-01  182  	if (!coredump)
4f04d07c0a94b0 Matthew Brost 2024-08-01  183  		return -ENODEV;
4f04d07c0a94b0 Matthew Brost 2024-08-01  184  
4f04d07c0a94b0 Matthew Brost 2024-08-01  185  	ss = &coredump->snapshot;
4f04d07c0a94b0 Matthew Brost 2024-08-01  186  
4f04d07c0a94b0 Matthew Brost 2024-08-01  187  	/* Ensure delayed work is captured before continuing */
4f04d07c0a94b0 Matthew Brost 2024-08-01  188  	flush_work(&ss->work);
4f04d07c0a94b0 Matthew Brost 2024-08-01  189  
c4a2e5f865b723 Matthew Brost 2025-04-23  190  	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
c4a2e5f865b723 Matthew Brost 2025-04-23  191  		xe_pm_runtime_get(gt_to_xe(ss->gt));
c4a2e5f865b723 Matthew Brost 2025-04-23  192  
906c4b306e9340 John Harrison 2024-11-28  193  	mutex_lock(&coredump->lock);
906c4b306e9340 John Harrison 2024-11-28  194  
906c4b306e9340 John Harrison 2024-11-28  195  	if (!ss->read.buffer) {
906c4b306e9340 John Harrison 2024-11-28  196  		mutex_unlock(&coredump->lock);
4f04d07c0a94b0 Matthew Brost 2024-08-01  197  		return -ENODEV;
906c4b306e9340 John Harrison 2024-11-28  198  	}
4f04d07c0a94b0 Matthew Brost 2024-08-01  199  
906c4b306e9340 John Harrison 2024-11-28  200  	if (offset >= ss->read.size) {
906c4b306e9340 John Harrison 2024-11-28  201  		mutex_unlock(&coredump->lock);
4f04d07c0a94b0 Matthew Brost 2024-08-01  202  		return 0;
906c4b306e9340 John Harrison 2024-11-28  203  	}
4f04d07c0a94b0 Matthew Brost 2024-08-01  204  
c4a2e5f865b723 Matthew Brost 2025-04-23 @205  	if (offset >= ss->read.chunk_position + XE_DEVCOREDUMP_CHUNK_MAX ||
c4a2e5f865b723 Matthew Brost 2025-04-23  206  	    offset < ss->read.chunk_position) {
15ba154d0115c8 Arnd Bergmann 2025-04-29  207  		ss->read.chunk_position = div_u64_rem(offset,
15ba154d0115c8 Arnd Bergmann 2025-04-29  208  			XE_DEVCOREDUMP_CHUNK_MAX, &chunk_offset)
15ba154d0115c8 Arnd Bergmann 2025-04-29  209  			* XE_DEVCOREDUMP_CHUNK_MAX;
c4a2e5f865b723 Matthew Brost 2025-04-23  210  
c4a2e5f865b723 Matthew Brost 2025-04-23  211  		__xe_devcoredump_read(ss->read.buffer,
c4a2e5f865b723 Matthew Brost 2025-04-23  212  				      XE_DEVCOREDUMP_CHUNK_MAX,
c4a2e5f865b723 Matthew Brost 2025-04-23  213  				      ss->read.chunk_position, coredump);
c4a2e5f865b723 Matthew Brost 2025-04-23  214  	}
c4a2e5f865b723 Matthew Brost 2025-04-23  215  
4f04d07c0a94b0 Matthew Brost 2024-08-01  216  	byte_copied = count < ss->read.size - offset ? count :
4f04d07c0a94b0 Matthew Brost 2024-08-01  217  		ss->read.size - offset;
15ba154d0115c8 Arnd Bergmann 2025-04-29  218  	memcpy(buffer, ss->read.buffer + chunk_offset, byte_copied);
4f04d07c0a94b0 Matthew Brost 2024-08-01  219  
906c4b306e9340 John Harrison 2024-11-28  220  	mutex_unlock(&coredump->lock);
906c4b306e9340 John Harrison 2024-11-28  221  
c4a2e5f865b723 Matthew Brost 2025-04-23  222  	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
c4a2e5f865b723 Matthew Brost 2025-04-23  223  		xe_pm_runtime_put(gt_to_xe(ss->gt));
c4a2e5f865b723 Matthew Brost 2025-04-23  224  
4f04d07c0a94b0 Matthew Brost 2024-08-01  225  	return byte_copied;
4f04d07c0a94b0 Matthew Brost 2024-08-01  226  }
4f04d07c0a94b0 Matthew Brost 2024-08-01  227  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
