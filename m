Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3032A22256B;
	Wed, 30 Jul 2025 20:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753909097; cv=none; b=kKpQj9OKQsuwx9wBBESKVfTb7otLrPhzIQfaEm17n4GknqnUxdRRyt22QBM5p+vTNb7M+8d6LwFDjAhiRZyVeAYnQ1TQAagMC4R630V+HadBlr/5f2HMXuKf4tLRoXz+akriGwTmzCTigHd1pIf9a4rGQMFleHzrP1xHK2tOdNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753909097; c=relaxed/simple;
	bh=Do5CCNOPzTe7g5KxJq1YM5I1CzH5ZMi5utmnUk5l5go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E0kl5OxMpvySuDDAopiMyx0B0h2dDnbI3aiUY82BqwLRCcaHoGlN7F6DDgF8BDQ9/q3t2Y6r3wZhReWi0ETaZrkL3UTvPCJED4F5X2J3LqKTBSTi6mpZUwaF40l4bi9BbPKl05KJE9nneu4u50b4uF21Rh5x8aJr1UCBLEu5bZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UwcDxzj4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UwcDxzj4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753909095; x=1785445095;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Do5CCNOPzTe7g5KxJq1YM5I1CzH5ZMi5utmnUk5l5go=;
  b=UwcDxzj4mpJEzDjsRZGrzSSs9KQjSz8xhkeYDpJ8NrwQ52JZh2BVp983
   gwKOeec0/TsszMh6PnuXQqC1XBm9xUP02w010my0oNMCjFUvpktHlXTT2
   treCu23VKSb4LsZcqihSMYJYlyLG8SA+HB12CgHoYjLSqueWyVRkkchO+
   7Er5AwsEYCmJrwKuqy026C2bzgF/oteGV0VBUt2PxUybKX0JJ/eGOU2Z2
   ZeN7QnQ2R5sXqvn8UCdi9HuSdjP+JpxhfqzfwrJwHEbRrmKyF0Fp61v/N
   r46z5T1gytXqOJDTNdgOu1BUoemh9C3G/5q0eGql8XCWZHxIeSPOmP+ZM
   w==;
X-CSE-ConnectionGUID: uKFl6GMmQWmb9era2L0DFw==
X-CSE-MsgGUID: bISGqDSqTYe+NYRJAi++5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="66788657"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="66788657"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 13:58:14 -0700
X-CSE-ConnectionGUID: nUv5/WfbQdODdH8vBVvg+Q==
X-CSE-MsgGUID: 88m4dpowTCmxsiWORP48uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="162967134"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Jul 2025 13:58:13 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhDsJ-00039I-0C;
	Wed, 30 Jul 2025 20:58:11 +0000
Date: Thu, 31 Jul 2025 04:57:56 +0800
From: kernel test robot <lkp@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
	intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v5 21/25] drm/xe/madvise: Skip vma invalidation if mem
 attr are unchanged
Message-ID: <202507310458.N20slFKu-lkp@intel.com>
References: <20250730130050.1001648-22-himal.prasad.ghimiray@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730130050.1001648-22-himal.prasad.ghimiray@intel.com>

Hi Himal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250730]
[cannot apply to drm-xe/drm-xe-next linus/master v6.16 v6.16-rc7 v6.16-rc6 v6.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Himal-Prasad-Ghimiray/drm-gpuvm-Pass-map-arguments-through-a-struct/20250731-003813
base:   next-20250730
patch link:    https://lore.kernel.org/r/20250730130050.1001648-22-himal.prasad.ghimiray%40intel.com
patch subject: [PATCH v5 21/25] drm/xe/madvise: Skip vma invalidation if mem attr are unchanged
config: arm-randconfig-004-20250731 (https://download.01.org/0day-ci/archive/20250731/202507310458.N20slFKu-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8f09b03aebb71c154f3bbe725c29e3f47d37c26e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250731/202507310458.N20slFKu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507310458.N20slFKu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_vm_madvise.c:200:4: warning: variable 'tile_mask' is uninitialized when used here [-Wuninitialized]
     200 |                         tile_mask |= xe_svm_ranges_zap_ptes_in_range(vm,
         |                         ^~~~~~~~~
   drivers/gpu/drm/xe/xe_vm_madvise.c:184:18: note: initialize the variable 'tile_mask' to silence this warning
     184 |         u8 id, tile_mask;
         |                         ^
         |                          = '\0'
   1 warning generated.


vim +/tile_mask +200 drivers/gpu/drm/xe/xe_vm_madvise.c

   179	
   180	static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
   181	{
   182		struct drm_gpuva *gpuva;
   183		struct xe_tile *tile;
   184		u8 id, tile_mask;
   185	
   186		lockdep_assert_held_write(&vm->lock);
   187	
   188		/* Wait for pending binds */
   189		if (dma_resv_wait_timeout(xe_vm_resv(vm), DMA_RESV_USAGE_BOOKKEEP,
   190					  false, MAX_SCHEDULE_TIMEOUT) <= 0)
   191			XE_WARN_ON(1);
   192	
   193		drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
   194			struct xe_vma *vma = gpuva_to_vma(gpuva);
   195	
   196			if (vma->skip_invalidation || xe_vma_is_null(vma))
   197				continue;
   198	
   199			if (xe_vma_is_cpu_addr_mirror(vma)) {
 > 200				tile_mask |= xe_svm_ranges_zap_ptes_in_range(vm,
   201									      xe_vma_start(vma),
   202									      xe_vma_end(vma));
   203			} else {
   204				for_each_tile(tile, vm->xe, id) {
   205					if (xe_pt_zap_ptes(tile, vma)) {
   206						tile_mask |= BIT(id);
   207	
   208					/*
   209					 * WRITE_ONCE pairs with READ_ONCE
   210					 * in xe_vm_has_valid_gpu_mapping()
   211					 */
   212					WRITE_ONCE(vma->tile_invalidated,
   213						   vma->tile_invalidated | BIT(id));
   214					}
   215				}
   216			}
   217		}
   218	
   219		return tile_mask;
   220	}
   221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
