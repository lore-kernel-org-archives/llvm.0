Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FE41BB698;
	Fri, 16 Aug 2024 17:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723829772; cv=none; b=nq8snuPuF+IpHjNnsMbw06DsrgMaXYT+1SSVvOAwabcrf4RGY1qYQq1nWLVZ8Eb++wW9X2VQBQ/8hRW9QgmCUtbOTQ4LOHPj0vRsjJY5SnEknMUbfUJaPFwJ95J3wrgSWIwCpuebfGmADzbqBVeV+VxQY8Nrh3rQ7vicZVK4T4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723829772; c=relaxed/simple;
	bh=SmUXUkS71xDVFXd29IUTMz4hy+N83HT6xLCcFCwcLEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qp8mKV0+2xowyqOsshSx38OFtjQeCTDr2ja8YwcJHwoJ79bwHoPS+2aH0QykkOdv3WOc5SWASoAyL790asPCKwObiGhAa1bIaOcniIe2iKARp7OfkxBjHDt3rC7D48gRTBgxqGwL4RcPejzLhLTFwn4+nVEdiYxHuOPpb4M4+zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DjW11h47; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DjW11h47"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723829770; x=1755365770;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SmUXUkS71xDVFXd29IUTMz4hy+N83HT6xLCcFCwcLEo=;
  b=DjW11h470iernqgENUDAHKiRda7UPl4PVims7jLn3bb7C9hbIW+ZFEa6
   GI1NaX8AX5u+/Xy6by10kKl6Tn6nW6g1P/sPM4fginEgCRCYAfeFtMG/9
   4/InBqhPw5VRmV1po1aiQldokosJcuADyXtyYjpiHO9SX+2kGgXyxhX5v
   LmZ7XRW9OQykuAOObGhpuNSHfRR/LQrZ+k1DgN1b996GRxHgYeKPUYgvC
   4UeOeS6lRa21JAj5dR5zVl2gku2Pb8v1+vCGjqj3Wks/1e7y7I6EOh/B/
   yzVCcid/4YexDmEZORNHjLsBlkSGJU7/qyKEDwF7OVHhGmTNHHL1ZF2TT
   g==;
X-CSE-ConnectionGUID: J4jwLu2ORu+YUz6r0UCLgQ==
X-CSE-MsgGUID: vrBuSHO9S92sVjHaBopyOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22276470"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="22276470"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 10:36:09 -0700
X-CSE-ConnectionGUID: CLGwQ1QjQDaVyJMpN7FGDA==
X-CSE-MsgGUID: x2Eh+iTlRbmeGJNtaahR3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="82941068"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Aug 2024 10:36:05 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sf0rs-0006gY-0L;
	Fri, 16 Aug 2024 17:36:04 +0000
Date: Sat, 17 Aug 2024 01:35:06 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
	Matthew Brost <matthew.brost@intel.com>,
	dri-devel@lists.freedesktop.org,
	Paulo Zanoni <paulo.r.zanoni@intel.com>
Subject: Re: [PATCH v8 3/6] drm/ttm: Use fault-injection to test error paths
Message-ID: <202408170144.N7YoWTCX-lkp@intel.com>
References: <20240816133717.3102-4-thomas.hellstrom@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816133717.3102-4-thomas.hellstrom@linux.intel.com>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240816]
[also build test ERROR on v6.11-rc3]
[cannot apply to drm-xe/drm-xe-next linus/master v6.11-rc3 v6.11-rc2 v6.11-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Add-a-virtual-base-class-for-graphics-memory-backup/20240816-213947
base:   next-20240816
patch link:    https://lore.kernel.org/r/20240816133717.3102-4-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v8 3/6] drm/ttm: Use fault-injection to test error paths
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240817/202408170144.N7YoWTCX-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408170144.N7YoWTCX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408170144.N7YoWTCX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/ttm/ttm_pool.c:456:8: error: call to undeclared function 'should_fail'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     456 |                             should_fail(&backup_fault_inject, 1)) {
         |                             ^
>> drivers/gpu/drm/ttm/ttm_pool.c:456:21: error: use of undeclared identifier 'backup_fault_inject'
     456 |                             should_fail(&backup_fault_inject, 1)) {
         |                                          ^
   drivers/gpu/drm/ttm/ttm_pool.c:908:44: error: call to undeclared function 'should_fail'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     908 |         if (IS_ENABLED(CONFIG_FAULT_INJECTION) && should_fail(&backup_fault_inject, 1))
         |                                                   ^
   drivers/gpu/drm/ttm/ttm_pool.c:908:57: error: use of undeclared identifier 'backup_fault_inject'
     908 |         if (IS_ENABLED(CONFIG_FAULT_INJECTION) && should_fail(&backup_fault_inject, 1))
         |                                                                ^
   4 errors generated.


vim +/should_fail +456 drivers/gpu/drm/ttm/ttm_pool.c

   434	
   435	static int ttm_pool_restore_tt(struct ttm_pool_tt_restore *restore,
   436				       struct ttm_backup *backup,
   437				       struct ttm_operation_ctx *ctx)
   438	{
   439		static unsigned long __maybe_unused swappedin;
   440		unsigned int i, nr = 1 << restore->order;
   441		int ret = 0;
   442	
   443		if (!ttm_pool_restore_valid(restore))
   444			return 0;
   445	
   446		for (i = restore->restored_pages; i < nr; ++i) {
   447			struct page *p = restore->old_pages[i];
   448	
   449			if (ttm_backup_page_ptr_is_handle(p)) {
   450				unsigned long handle = ttm_backup_page_ptr_to_handle(p);
   451	
   452				if (handle == 0)
   453					continue;
   454	
   455				if (IS_ENABLED(CONFIG_FAULT_INJECTION) && ctx->interruptible &&
 > 456				    should_fail(&backup_fault_inject, 1)) {
   457					ret = -EINTR;
   458					break;
   459				}
   460	
   461				ret = backup->ops->copy_backed_up_page
   462					(backup, restore->first_page[i],
   463					 handle, ctx->interruptible);
   464				if (ret)
   465					break;
   466	
   467				backup->ops->drop(backup, handle);
   468			} else if (p) {
   469				/*
   470				 * We could probably avoid splitting the old page
   471				 * using clever logic, but ATM we don't care.
   472				 */
   473				ttm_pool_split_for_swap(restore->pool, p);
   474				copy_highpage(restore->first_page[i], p);
   475				__free_pages(p, 0);
   476			}
   477	
   478			restore->restored_pages++;
   479			restore->old_pages[i] = NULL;
   480			cond_resched();
   481		}
   482	
   483		return ret;
   484	}
   485	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
