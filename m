Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B98279E1;
	Fri, 13 Jun 2025 23:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749857493; cv=none; b=kpOKTkOo2JMrRcJnlyad2ELaW1vxG8lmrwN7BtzkNc2pg393KdVaERiVRbGQgTCFKqdWTth/Eus6WdGRVFgXUtVkoQEAVD+UnU3JvOqknCiwXYLrTX/FZIok68Cv5xFs5UJGqa+/HryE1Y521oLBZdZRNPiPghq07aenN++yid4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749857493; c=relaxed/simple;
	bh=iUs8Isc8CCyS4Z0N7iAPKqJD0A97jCBCSqjlQNyoRaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nn2g/9pR4Sxu0s0hoo5u9KXYcPfz8BWkLhaDFb2ih2aMGM12PbREXvwwQ5EGvE77yRNb3abvVondUn4dg3nOSqXv++Fi9oa+D4Qn8g61ve3fZkZjW6aE8xnjPoqE40bZb80YmoG9l8WcCMPDgvnqDdC44FgEH+SRe+DJHIvJ47Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EJeYV3r+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJeYV3r+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749857492; x=1781393492;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iUs8Isc8CCyS4Z0N7iAPKqJD0A97jCBCSqjlQNyoRaA=;
  b=EJeYV3r+9CA03yAQ7UW8GuRttKwgJBAOpJwu5TRwTKjhp7ymP5xwZouS
   gp8eIztP7jQfOi/a0fW8ub+hGA7kveG2adgrvJ3DGzueWr5ndGu0mbldz
   zTs4HwLPOUjJpIRWt73stmAdRGYrK5M2SNt3RWY/bxL6g3YInli6WN5ii
   wFg59IsL8SGK+DJc2HoyqT1aligLxi884UrIyPyTIPWO85RAunOU+rXvo
   EpRq2LYk8HEYdmsy4ldVjnoiaR6NLiPCuMYi+ocuDqx/A2pWt0j8FYRc+
   uOubUt4k6mmBzVxaYcVsZDp2N+mvKKjhVE7ZCVfo4Gnv5Kh6d45ZOivwA
   w==;
X-CSE-ConnectionGUID: mIzvZXUxTPyS0s7ThYFwiQ==
X-CSE-MsgGUID: x0LBhdhxQb+RKSzegA9Uaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="51196286"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="51196286"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 16:31:31 -0700
X-CSE-ConnectionGUID: GDDyr6glRTi9CH4KTZO+jg==
X-CSE-MsgGUID: rbTEnckhSX2EXELDsJFzTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="178840676"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Jun 2025 16:31:30 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQDrr-000D5O-0F;
	Fri, 13 Jun 2025 23:31:27 +0000
Date: Sat, 14 Jun 2025 07:31:04 +0800
From: kernel test robot <lkp@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
	intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
	Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v4 13/20] drm/xe/madvise: Update migration policy based
 on preferred location
Message-ID: <202506140711.9Ogt4vi6-lkp@intel.com>
References: <20250613125558.2607665-14-himal.prasad.ghimiray@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613125558.2607665-14-himal.prasad.ghimiray@intel.com>

Hi Himal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on next-20250613]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Himal-Prasad-Ghimiray/Introduce-drm_gpuvm_sm_map_ops_flags-enums-for-sm_map_ops/20250614-003138
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250613125558.2607665-14-himal.prasad.ghimiray%40intel.com
patch subject: [PATCH v4 13/20] drm/xe/madvise: Update migration policy based on preferred location
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250614/202506140711.9Ogt4vi6-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506140711.9Ogt4vi6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506140711.9Ogt4vi6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_vm_madvise.c:201:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     201 |                 s32 fd = (s32)args->preferred_mem_loc.devmem_fd;
         |                 ^
   1 warning generated.


vim +201 drivers/gpu/drm/xe/xe_vm_madvise.c

   177	
   178	static int drm_xe_madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madvise *args)
   179	{
   180		if (XE_IOCTL_DBG(xe, !args))
   181			return -EINVAL;
   182	
   183		if (XE_IOCTL_DBG(xe, !IS_ALIGNED(args->start, SZ_4K)))
   184			return -EINVAL;
   185	
   186		if (XE_IOCTL_DBG(xe, !IS_ALIGNED(args->range, SZ_4K)))
   187			return -EINVAL;
   188	
   189		if (XE_IOCTL_DBG(xe, args->range < SZ_4K))
   190			return -EINVAL;
   191	
   192		switch (args->type) {
   193		case DRM_XE_VMA_ATTR_ATOMIC:
   194			if (XE_IOCTL_DBG(xe, args->atomic.val > DRM_XE_VMA_ATOMIC_CPU))
   195				return -EINVAL;
   196			break;
   197		case DRM_XE_VMA_ATTR_PAT:
   198			/*TODO: Add valid pat check */
   199			break;
   200		case DRM_XE_VMA_ATTR_PREFERRED_LOC:
 > 201			s32 fd = (s32)args->preferred_mem_loc.devmem_fd;
   202	
   203			if (XE_IOCTL_DBG(xe, fd < DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM))
   204				return -EINVAL;
   205	
   206			if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.migration_policy >
   207					     DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES))
   208				return -EINVAL;
   209			break;
   210		default:
   211			if (XE_IOCTL_DBG(xe, 1))
   212				return -EINVAL;
   213		}
   214	
   215		if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
   216			return -EINVAL;
   217	
   218		return 0;
   219	}
   220	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
