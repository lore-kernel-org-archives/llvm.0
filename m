Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E48013CA8A;
	Fri, 28 Feb 2025 03:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740714268; cv=none; b=CmjKVOh0yQQdoN5i/E/fQ9LdhvxBKdQguKAk1hBWeBAEaKzEFBSSAjRhGQyofDvIJYlfGRhEtasgMnSrG6+ES04GCmT8H6NbHa7uXvNSAunpJrW9slCAOPt759ehAQ4/+V1G6DZCUrxd6CdghJBt/jssSToBmsEVcmDda9qLhj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740714268; c=relaxed/simple;
	bh=piPSJeKsAzse+Qlz6LA0inN02V2FwQ/BiO/HAZqPHLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TJxsDQZvPfJ5KkJpAnkyMwBVniH6sn7bQ6dgDlzun0m8iwX7C8lsZncP7DoPBD8T5U1HioxhnNrZIkb1mKMsFJYQZVvtyT45zYlu0/IKj6ud4o98Xwpspp0qmgG/oytrWT02Yj7CJkMr+r0OXguKE8jeX8PKNUy9Bb0dBc89FVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D4NcmGY3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D4NcmGY3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740714266; x=1772250266;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=piPSJeKsAzse+Qlz6LA0inN02V2FwQ/BiO/HAZqPHLk=;
  b=D4NcmGY3ZMAPoS5sEpgMVX+3ABB42zEE+pzDFN0JW1NrgEsFo0wGtB8e
   SwsBnu8CTY2uZ1/QpSaOI/YTNa4y20e3/0yO4CRtMsjfS78jHMbxqg1/s
   +hL/9AVB3ZT2IvydEttXMRUMm2RLdKEvvFHanvFcSITryukxZqG8DVajp
   9H39wXX53KQZNbbigNrhbtj9HpKpEDxF8wfmWQirXEsTkNbO+JlfnW2UJ
   9ucfxG2R5EBbK2fVvCPbKLA9exCNCENTO2+U9bdG2Uo4zb+ewTKsJm7hP
   UwcZ+WR+oX8iOLg0zUjkBIqiwU3fkliBzI1T1rLxkcqogP7Tte9cOYaSw
   Q==;
X-CSE-ConnectionGUID: +XuOFqGxSkCwD6O5nxX3fQ==
X-CSE-MsgGUID: r4vID7orQ9KscVxiDjfzag==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="59045518"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; 
   d="scan'208";a="59045518"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 19:44:26 -0800
X-CSE-ConnectionGUID: O2sJrFilQl+vJWvf8bsa7Q==
X-CSE-MsgGUID: kbWFrUReTXOm2AmS4DKZMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; 
   d="scan'208";a="117018258"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 27 Feb 2025 19:44:23 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnrIT-000EOE-0u;
	Fri, 28 Feb 2025 03:44:21 +0000
Date: Fri, 28 Feb 2025 11:44:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
	intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	saurabhg.gupta@intel.com, alex.zuo@intel.com,
	jonathan.cavitt@intel.com, joonas.lahtinen@linux.intel.com,
	matthew.brost@intel.com, jianxun.zhang@intel.com,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 8/8] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Message-ID: <202502281118.XNrfLzlo-lkp@intel.com>
References: <20250227191457.84035-9-jonathan.cavitt@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227191457.84035-9-jonathan.cavitt@intel.com>

Hi Jonathan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on next-20250227]
[cannot apply to linus/master v6.14-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cavitt/drm-xe-xe_gt_pagefault-Disallow-writes-to-read-only-VMAs/20250228-032204
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250227191457.84035-9-jonathan.cavitt%40intel.com
patch subject: [PATCH v2 8/8] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
config: i386-buildonly-randconfig-002-20250228 (https://download.01.org/0day-ci/archive/20250228/202502281118.XNrfLzlo-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502281118.XNrfLzlo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502281118.XNrfLzlo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_vm.c:3267:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    3267 |                 struct xe_exec_queue_ban_entry *entry;
         |                 ^
   1 warning generated.


vim +3267 drivers/gpu/drm/xe/xe_vm.c

  3260	
  3261	static u32 xe_vm_get_property_size(struct xe_vm *vm, u32 property)
  3262	{
  3263		u32 size = 0;
  3264	
  3265		switch (property) {
  3266		case DRM_XE_VM_GET_PROPERTY_FAULTS:
> 3267			struct xe_exec_queue_ban_entry *entry;
  3268	
  3269			spin_lock(&vm->bans.lock);
  3270			list_for_each_entry(entry, &vm->bans.list, list) {
  3271				struct xe_pagefault *pf = entry->pf;
  3272	
  3273				size += pf ? sizeof(struct drm_xe_ban) : 0;
  3274			}
  3275			spin_unlock(&vm->bans.lock);
  3276			return size;
  3277		case DRM_XE_VM_GET_PROPERTY_BANS:
  3278			spin_lock(&vm->bans.lock);
  3279			size = vm->bans.len * sizeof(struct drm_xe_ban);
  3280			spin_unlock(&vm->bans.lock);
  3281			return size;
  3282		case DRM_XE_VM_GET_PROPERTY_NUM_RESETS:
  3283			return 0;
  3284		default:
  3285			return -EINVAL;
  3286		}
  3287	}
  3288	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
