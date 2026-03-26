Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0F533ADA0;
	Thu, 26 Mar 2026 08:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774512674; cv=none; b=SRW8kbUOX8wBwnAZKRKDobFMNRrlqbEunTb46rlLGAPrzXeTdi2vP6EGvSCyigPCvydDac1WB19exxyGVCN2otea53HbZdVxohXSCrk851yxQPmpVHH04G4J92QDeQ2vYk7PxItOo2OMYcROFDA362e1e4fMMPAdoluz74g3jLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774512674; c=relaxed/simple;
	bh=4SeME93rg1EGoZgDSZgBrb0pUNUlj7shGTwq6yEv+K4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UyZLZx8cuyvFwz6a7mw6IebWPGsQIDOxxVd0+kubyCU3QTQQL4r/PO5LLGN8V7+e2i4j/cBnDbQXOpHAeO4mnPpuFZ3mK+WooglOQkfF61D6Dt8lX/EkgPSikBvwbspqT0QLG5SeomacSUucrqBd+Jcku4fCGK53MWpCt+EHl/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YfaGtng3; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YfaGtng3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774512672; x=1806048672;
  h=date:from:to:cc:subject:message-id;
  bh=4SeME93rg1EGoZgDSZgBrb0pUNUlj7shGTwq6yEv+K4=;
  b=YfaGtng3vKB8BRlPX2wmD4ubJuNIB8Swtgg3CkRLvvLexarh4Vy9AIgP
   pWc7JAFn5XIumDc0O8BqSJfDQZeyE6556HkXYuBhgux4CyHyFg4h6GYT5
   2eoQO0OFnBDMh5HQnja4z5dL7XmpkKBdH2ME5WUF7xjUUuW/Pf1VRtuf+
   WovA2qg2rEGq3Ewbim8H9PHYXYO4/eBXaF6ge/q4qg+3V2KsNQV66QpqF
   aaPmoZZceW78hTRc09cip+9Q8pAPL6vn+J27xQwgXkNNy66NcWreP7c71
   mTdnSTBRfoi9CNbv/V3qSX6WZXA2Pt2bKvYM1aRnzVi1XSPgh2qBBBa9j
   A==;
X-CSE-ConnectionGUID: 3siLG+goRcuwdmRRys/ibw==
X-CSE-MsgGUID: LmzykFTfShiP45w3cbW3wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="79468406"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="79468406"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 01:11:09 -0700
X-CSE-ConnectionGUID: T4aCsA3KQnekBiFxAUNOSg==
X-CSE-MsgGUID: YV+Masw7S9mH9N9JOUnM8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="224117415"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Mar 2026 01:11:07 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5fo0-000000008dh-3DsF;
	Thu, 26 Mar 2026 08:11:04 +0000
Date: Thu, 26 Mar 2026 16:10:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 453/525] drivers/gpu/drm/adp/adp_drv.c:85:3:
 error: field designator 'read' does not refer to any field in type 'const
 struct file_operations'
Message-ID: <202603261655.R6thuPg9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   d5f290ca006c2bdabff8aa383fd3cf9cf9194259
commit: 6227c44455927ebea005dbc4b69c4ba8fc4a4089 [453/525] fs: finally remove ->read() and ->write() from file_operations
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260326/202603261655.R6thuPg9-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603261655.R6thuPg9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603261655.R6thuPg9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/adp/adp_drv.c:85:3: error: field designator 'read' does not refer to any field in type 'const struct file_operations'
      85 |         .read           = drm_read,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +85 drivers/gpu/drm/adp/adp_drv.c

332122eba628d5 Sasha Finkelstein 2025-02-24  77  
332122eba628d5 Sasha Finkelstein 2025-02-24  78  static const struct file_operations adp_fops = {
332122eba628d5 Sasha Finkelstein 2025-02-24  79  	.owner          = THIS_MODULE,
332122eba628d5 Sasha Finkelstein 2025-02-24  80  	.open           = adp_open,
332122eba628d5 Sasha Finkelstein 2025-02-24  81  	.release        = drm_release,
332122eba628d5 Sasha Finkelstein 2025-02-24  82  	.unlocked_ioctl = drm_ioctl,
332122eba628d5 Sasha Finkelstein 2025-02-24  83  	.compat_ioctl   = drm_compat_ioctl,
332122eba628d5 Sasha Finkelstein 2025-02-24  84  	.poll           = drm_poll,
afd750c9e3e8ed Jens Axboe        2026-03-04 @85  	.read           = drm_read,
332122eba628d5 Sasha Finkelstein 2025-02-24  86  	.llseek         = noop_llseek,
332122eba628d5 Sasha Finkelstein 2025-02-24  87  	.mmap           = drm_gem_mmap,
332122eba628d5 Sasha Finkelstein 2025-02-24  88  	.fop_flags      = FOP_UNSIGNED_OFFSET,
332122eba628d5 Sasha Finkelstein 2025-02-24  89  	DRM_GEM_DMA_UNMAPPED_AREA_FOPS
332122eba628d5 Sasha Finkelstein 2025-02-24  90  };
332122eba628d5 Sasha Finkelstein 2025-02-24  91  

:::::: The code at line 85 was first introduced by commit
:::::: afd750c9e3e8ed7975f551be58d3bd50766d8d7c drm: convert remaining fops to read/write iterators

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
