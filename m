Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD8D3E3C6C;
	Wed,  6 May 2026 08:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778055922; cv=none; b=OSRGODlFVPsonEvzJvv8ypyBBRB/vt1ODlHOhzut7DN5YUBH8GR/ue5IkdIvzW3OAkFAnw0CfFBuBVNzFTpbUYbqD+drHTZZW1qRGOIHWoAMZsiz1A7Ml9Vw1tnWu46RqI1pHDowpDUpHYHF/qAKDHJPoi3CkgL/CsKscAknD1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778055922; c=relaxed/simple;
	bh=5Hk+FCMFR0CzD/49h1NG4jC2NSCRz+b4zYTM2LKo9p8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lCMnrGYFB0ULb7EAoQPhXle6RJFxCP+Le/dpD/6272u0UbCvjuFYYw+Ohu/Q4DL7KgK6QmkGeoVkg3szAhusH6txTQcuM0tUKsLLevUl1VAMErLz1Gr1YmExBgeLlDnf8AzajMzyIpsdgVonkV6tW6rlyo0QPHKkO1vx4NBKUXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hVZX7YgC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hVZX7YgC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778055920; x=1809591920;
  h=date:from:to:cc:subject:message-id;
  bh=5Hk+FCMFR0CzD/49h1NG4jC2NSCRz+b4zYTM2LKo9p8=;
  b=hVZX7YgCpr4qq4UshI9BRIQmH1iD3Et9AefJacD4SbHizoVtoJzA6xUs
   /1+qLM4X2J53XBu/hBiTiRBIq5asuHjH7u1VEgEYanettN94Ov20gvIsi
   eMXlAozotcfC6/SYsMPqTDxuF3WRwNSsvPUJcGaSslnbvk+gOYkVwtjLW
   Z5TRvQ8bTah43fDrhIaAXQ7ce89QpSyrgpMPlFmPEO1oPIrZ8wSJdIdUx
   Md+GjCxqInals81X4dx/ih9ecd2KHwW14RaHDq7tkDl+GFG0B4gJ/8ivW
   aKgJYx7va0IZSkYaGFh+OMQGcw56mPpuMEDAEu+MnQa2Pps15pfDAPuI9
   Q==;
X-CSE-ConnectionGUID: LDd5lQbiQn+YtH4wukLMzQ==
X-CSE-MsgGUID: 9nNHyODDRheFq0HI6UIt6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="66509686"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="66509686"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 01:25:16 -0700
X-CSE-ConnectionGUID: +WCg3WZeRSq2BfKLch2u5g==
X-CSE-MsgGUID: yOpC3qr5SyuFgfD9griZgw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 May 2026 01:25:14 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKXZA-000000000ot-0WDj;
	Wed, 06 May 2026 08:25:12 +0000
Date: Wed, 06 May 2026 16:24:44 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:virtual-subsys.v7 3/7]
 drivers/nvme/host/core.c:3960:30: error: incompatible pointer types passing
 'struct nvme_subsystem *' to parameter of type 'struct nvme_ctrl *'
Message-ID: <202605061647.N9yc9XVx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git virtual-subsys.v7
head:   d28dfc8d88a694c49437ebff946b86d35fb2ce56
commit: 743f32b59ff12e69735b0d0aeb7d289f968a56ce [3/7] nvme: use a subsystem argument in nvme_alloc_ns_head()
config: hexagon-randconfig-002-20260506 (https://download.01.org/0day-ci/archive/20260506/202605061647.N9yc9XVx-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605061647.N9yc9XVx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605061647.N9yc9XVx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nvme/host/core.c:3960:30: error: incompatible pointer types passing 'struct nvme_subsystem *' to parameter of type 'struct nvme_ctrl *' [-Wincompatible-pointer-types]
    3960 |         ret = nvme_mpath_alloc_disk(subsys, head);
         |                                     ^~~~~~
   drivers/nvme/host/nvme.h:1088:59: note: passing argument to parameter 'ctrl' here
    1088 | static inline int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl,
         |                                                           ^
   1 error generated.


vim +3960 drivers/nvme/host/core.c

  3931	
  3932		head = kzalloc(size, GFP_KERNEL);
  3933		if (!head)
  3934			goto out;
  3935		ret = ida_alloc_min(&subsys->ns_ida, 1, GFP_KERNEL);
  3936		if (ret < 0)
  3937			goto out_free_head;
  3938		head->instance = ret;
  3939		INIT_LIST_HEAD(&head->list);
  3940		ret = init_srcu_struct(&head->srcu);
  3941		if (ret)
  3942			goto out_ida_remove;
  3943		head->subsys = subsys;
  3944		head->ns_id = info->nsid;
  3945		head->ids = info->ids;
  3946		head->shared = info->is_shared;
  3947		head->rotational = info->is_rotational;
  3948		head->unique_nsid = head->shared || nvme_ctrl_is_unique_nsid(ctrl);
  3949		ratelimit_state_init(&head->rs_nuse, 5 * HZ, 1);
  3950		ratelimit_set_flags(&head->rs_nuse, RATELIMIT_MSG_ON_RELEASE);
  3951		kref_init(&head->ref);
  3952	
  3953		if (head->ids.csi) {
  3954			ret = nvme_get_effects_log(ctrl, head->ids.csi, &head->effects);
  3955			if (ret)
  3956				goto out_cleanup_srcu;
  3957		} else
  3958			head->effects = ctrl->effects;
  3959	
> 3960		ret = nvme_mpath_alloc_disk(subsys, head);
  3961		if (ret)
  3962			goto out_cleanup_srcu;
  3963	
  3964		list_add_tail(&head->entry, &subsys->nsheads);
  3965	
  3966		kref_get(&subsys->ref);
  3967	
  3968		return head;
  3969	out_cleanup_srcu:
  3970		cleanup_srcu_struct(&head->srcu);
  3971	out_ida_remove:
  3972		ida_free(&subsys->ns_ida, head->instance);
  3973	out_free_head:
  3974		kfree(head);
  3975	out:
  3976		if (ret > 0)
  3977			ret = blk_status_to_errno(nvme_error_status(ret));
  3978		return ERR_PTR(ret);
  3979	}
  3980	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
