Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A382E339D;
	Thu,  3 Apr 2025 03:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743650170; cv=none; b=I89WqL48tD8f5rJVQAaWpOpAvylcz084UWdgwgoS797+ek/OS39RIwfYrvwcFPCFxK9dW3cnIxgkzo+nM616nIQqGxQYuxTr79QQkB0kFATtM5Kc8+wLUPHiOufe60bwj2k3ilb8NBYdRxbhD/c3T5MdfGXVJGrpEJ2vU4yi2mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743650170; c=relaxed/simple;
	bh=hDj2tk1SC6zmWf1AVFo3R4ER1CtPczdzfyxza3AdjYU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y8BKR49pJPDB32KOkAMtiYafmM2J805AAZ2xfor4VI4fnqHnP3WpHldmkkpVbNgCIbwCqod8S7O8PH+jPFIDDoxxuK9vrLr3VWPOIBv4kyLZUEjiHy4+4OQwNAZCP2d5dLgd2EwVq4K4INQDzFFb1wMzujefRPMX1EzXACF/cC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IBygkK+A; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IBygkK+A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743650168; x=1775186168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hDj2tk1SC6zmWf1AVFo3R4ER1CtPczdzfyxza3AdjYU=;
  b=IBygkK+A5cULnbCYTfq0VSvyFJZmW68WJDY7X0a69ZgeyFGft7xuZm/F
   rxiBnoVujFNzZxfaUZuVunP2PIx1cA7l1iJWxdAVo4VfI4iOjyxhqYUJu
   DzMuOcPJScmUaUpi+BBtb0XLyJJ5HQEowyqYrskTIu5ZTiUSf8BGaXZ1V
   dMQyVKePGMWkIgOsO2CTvTHA+DrWYirB/5WqcNbRkmfJEH/5Jjp/8QJnC
   XeeqS9DCbwFSW3YnZavBrZ/z3hKTNT55lvlNTR7FhjNc038DLyCydPqu6
   RRsuI1qF5Saj+0gfHfAP6JkG8VVB4wT3TtIGpf2cSGuK6drahBi3gqubl
   w==;
X-CSE-ConnectionGUID: nZ+Ep8XjR/20dDIBDfOS/w==
X-CSE-MsgGUID: U+neEuQWTMSUQ0jiYbdsXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44924871"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="44924871"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 20:16:06 -0700
X-CSE-ConnectionGUID: DQ0rVZ2CSw6s3gmu8+ZffA==
X-CSE-MsgGUID: 2y/tfa8bT6+Ya2loeGG/hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="132005096"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Apr 2025 20:16:05 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0B3j-00001j-0L;
	Thu, 03 Apr 2025 03:16:03 +0000
Date: Thu, 3 Apr 2025 11:15:51 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:ns-migration 10/18]
 drivers/nvme/host/core.c:3704:30: error: incompatible pointer types passing
 'struct nvme_subsystem *' to parameter of type 'struct nvme_ctrl *'
Message-ID: <202504031106.LFdMV2AX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git ns-migration
head:   1cd2ac8db713fdf42bc7bb10329d795f7aee4f1f
commit: 0ba654ee6c31e479dd7236afec32fcd3ba7e7578 [10/18] nvme: use a subsystem argument in nvme_alloc_ns_head()
config: i386-buildonly-randconfig-003-20250403 (https://download.01.org/0day-ci/archive/20250403/202504031106.LFdMV2AX-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504031106.LFdMV2AX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504031106.LFdMV2AX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nvme/host/core.c:3704:30: error: incompatible pointer types passing 'struct nvme_subsystem *' to parameter of type 'struct nvme_ctrl *' [-Werror,-Wincompatible-pointer-types]
    3704 |         ret = nvme_mpath_alloc_disk(subsys, head);
         |                                     ^~~~~~
   drivers/nvme/host/nvme.h:1005:59: note: passing argument to parameter 'ctrl' here
    1005 | static inline int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl,
         |                                                           ^
   drivers/nvme/host/core.c:4310:30: error: no member named 'ana_work' in 'struct nvme_ctrl'; did you mean 'ka_work'?
    4310 |                 queue_work(nvme_wq, &ctrl->ana_work);
         |                                            ^~~~~~~~
         |                                            ka_work
   drivers/nvme/host/nvme.h:356:22: note: 'ka_work' declared here
     356 |         struct delayed_work ka_work;
         |                             ^
   2 errors generated.


vim +3704 drivers/nvme/host/core.c

  3675	
  3676		head = kzalloc(size, GFP_KERNEL);
  3677		if (!head)
  3678			goto out;
  3679		ret = ida_alloc_min(&subsys->ns_ida, 1, GFP_KERNEL);
  3680		if (ret < 0)
  3681			goto out_free_head;
  3682		head->instance = ret;
  3683		INIT_LIST_HEAD(&head->list);
  3684		ret = init_srcu_struct(&head->srcu);
  3685		if (ret)
  3686			goto out_ida_remove;
  3687		head->subsys = subsys;
  3688		head->ns_id = info->nsid;
  3689		head->ids = info->ids;
  3690		head->shared = info->is_shared;
  3691		head->rotational = info->is_rotational;
  3692		head->unique_nsid = head->shared || nvme_ctrl_is_unique_nsid(ctrl);
  3693		ratelimit_state_init(&head->rs_nuse, 5 * HZ, 1);
  3694		ratelimit_set_flags(&head->rs_nuse, RATELIMIT_MSG_ON_RELEASE);
  3695		kref_init(&head->ref);
  3696	
  3697		if (head->ids.csi) {
  3698			ret = nvme_get_effects_log(ctrl, head->ids.csi, &head->effects);
  3699			if (ret)
  3700				goto out_cleanup_srcu;
  3701		} else
  3702			head->effects = ctrl->effects;
  3703	
> 3704		ret = nvme_mpath_alloc_disk(subsys, head);
  3705		if (ret)
  3706			goto out_cleanup_srcu;
  3707	
  3708		list_add_tail(&head->entry, &subsys->nsheads);
  3709	
  3710		kref_get(&subsys->ref);
  3711	
  3712		return head;
  3713	out_cleanup_srcu:
  3714		cleanup_srcu_struct(&head->srcu);
  3715	out_ida_remove:
  3716		ida_free(&subsys->ns_ida, head->instance);
  3717	out_free_head:
  3718		kfree(head);
  3719	out:
  3720		if (ret > 0)
  3721			ret = blk_status_to_errno(nvme_error_status(ret));
  3722		return ERR_PTR(ret);
  3723	}
  3724	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
