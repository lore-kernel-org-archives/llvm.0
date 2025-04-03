Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126791624E4;
	Thu,  3 Apr 2025 04:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743654499; cv=none; b=mNdUBWPm7qdzFTnEzvCpyOZH3HbjB3NdHHcw55+fbaUd6qJ/RBIHo8zO2V8JhQxnHzdc5oyoJ/H4UWbneavw5Hoy/E6+9Gz0YHRZRhcnBtHoIKg5nGRFyTKuSyqfqNmlfCucOMUEAGEzql650O/PFDCHKox41LdscfzfMH8vzLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743654499; c=relaxed/simple;
	bh=rMOtSL5ayMJlegwyrh8hAkUEbW7Tp/fR1vlTRSGajeY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P9ceiFMo6SexiJHEt4Ev96oPjjk7PbH1+sb9CDchDiTIZvCxQTQvdIx9fk9twjy3WUH1x91mfWnBDPW2qmY9qBqhyDNAFVMKLpOtgdz/e7EzugAQG5RRZcUEBULpkWJZIYiC4ffNP2qn+6hsDjEdBE82LGGy7nSdAF0qsOkjrP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iREUacdu; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iREUacdu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743654497; x=1775190497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rMOtSL5ayMJlegwyrh8hAkUEbW7Tp/fR1vlTRSGajeY=;
  b=iREUacdu+RwZPJ9lneWOWcZ4RALdyMJXKA8pfzDo+VhPXMmXT2GeGn3f
   teHUQr/o7cxtSGg8eQN8bsekxT3FjvXPW9mpLDN9dWYdL4yf+jLQyd+ui
   vtEM7CdpE/VlCUNkOOTcSkcdCHysTNCfkc5Pi1pBOC2VC20PTpjAR2Tp3
   fKEg49oANk0GLHFXWVoyGmXW4O9zBUgADS1t3hLW435jk6Oi8gDf6a9MK
   QE51kinAMjcfIGR6pKwt92lIDJFFApdC/HehncpVVT0te61j5FQcXb6si
   OcMYjieaGmltcDPEyPQyDJm4h7oOxif6lVKtELcq0QJXKRU67i2L7iU0+
   g==;
X-CSE-ConnectionGUID: FGIE4z2FR0mCodwftP47uw==
X-CSE-MsgGUID: 1zqBJIe2SDmjNH8hJJ+x6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44929380"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="44929380"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 21:28:16 -0700
X-CSE-ConnectionGUID: 36peC8t9QVi7SE5PjXgAmw==
X-CSE-MsgGUID: OGQFHPXmQkWN4KbTebo4kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="157887765"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Apr 2025 21:28:15 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0CBY-00004p-36;
	Thu, 03 Apr 2025 04:28:12 +0000
Date: Thu, 3 Apr 2025 12:27:45 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:ns-migration 17/18]
 drivers/nvme/host/core.c:4179:25: error: no member named 'lock' in 'struct
 nvme_ns_head'
Message-ID: <202504031248.OIkAofGD-lkp@intel.com>
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
commit: c99bbaa789ad558a900b867b376d68801acbbf9a [17/18] nvme: namespace migration
config: i386-buildonly-randconfig-003-20250403 (https://download.01.org/0day-ci/archive/20250403/202504031248.OIkAofGD-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504031248.OIkAofGD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504031248.OIkAofGD-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvme/host/core.c:3727:30: error: incompatible pointer types passing 'struct nvme_subsystem *' to parameter of type 'struct nvme_ctrl *' [-Werror,-Wincompatible-pointer-types]
    3727 |         ret = nvme_mpath_alloc_disk(subsys, head);
         |                                     ^~~~~~
   drivers/nvme/host/nvme.h:1008:59: note: passing argument to parameter 'ctrl' here
    1008 | static inline int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl,
         |                                                           ^
>> drivers/nvme/host/core.c:4179:25: error: no member named 'lock' in 'struct nvme_ns_head'
    4179 |                 mutex_lock(&ns->head->lock);
         |                             ~~~~~~~~  ^
   drivers/nvme/host/core.c:4182:28: error: no member named 'lock' in 'struct nvme_ns_head'
    4182 |                         mutex_unlock(&ns->head->lock);
         |                                       ~~~~~~~~  ^
   drivers/nvme/host/core.c:4193:27: error: no member named 'lock' in 'struct nvme_ns_head'
    4193 |                 mutex_unlock(&ns->head->lock);
         |                               ~~~~~~~~  ^
   drivers/nvme/host/core.c:4449:30: error: no member named 'ana_work' in 'struct nvme_ctrl'; did you mean 'ka_work'?
    4449 |                 queue_work(nvme_wq, &ctrl->ana_work);
         |                                            ^~~~~~~~
         |                                            ka_work
   drivers/nvme/host/nvme.h:356:22: note: 'ka_work' declared here
     356 |         struct delayed_work ka_work;
         |                             ^
   5 errors generated.


vim +4179 drivers/nvme/host/core.c

  4124	
  4125	static void nvme_validate_ns(struct nvme_ns *ns, struct nvme_ns_info *info)
  4126	{
  4127		int ret = NVME_SC_INVALID_NS | NVME_STATUS_DNR;
  4128		struct nvme_ctrl *ctrl = ns->ctrl;
  4129		struct nvme_subsystem *subsys, *old_subsys = NULL;
  4130		struct nvme_ns_head *head;
  4131	
  4132		if (!nvme_ns_ids_equal(&ns->head->ids, &info->ids)) {
  4133			dev_err(ns->ctrl->device,
  4134				"identifiers changed for nsid %d\n", ns->head->ns_id);
  4135			goto out;
  4136		}
  4137	
  4138		if (uuid_is_null(&info->ids.migration_uuid)) {
  4139			/*
  4140			 * Migration UUID not present:
  4141			 * use the controller subsystem
  4142			 */
  4143			subsys = ctrl->subsys;
  4144			kref_get(&subsys->ref);
  4145		} else if (uuid_is_null(&ns->head->ids.migration_uuid)) {
  4146			/*
  4147			 * Migration UUID present, but not set for ns_head:
  4148			 * create migration subsystem
  4149			 */
  4150			subsys = nvme_migration_subsys(info);
  4151			if (!subsys) {
  4152				dev_err(ctrl->device,
  4153					"nsid %u: failed to allocate migration subsys\n",
  4154					ns->head->ns_id);
  4155				goto out;
  4156			}
  4157		} else {
  4158			/*
  4159			 * Migration UUID present, and set for ns_head:
  4160			 * use ns_head subsystem
  4161			 */
  4162			subsys = ns->head->subsys;
  4163			kref_get(&subsys->ref);
  4164		}
  4165	
  4166		mutex_lock(&subsys->lock);
  4167		head = nvme_find_ns_head(subsys, ns->head->ns_id);
  4168		if (head) {
  4169			nvme_put_ns_head(head);
  4170			if (head != ns->head) {
  4171				dev_err(ctrl->device,
  4172					"nsid %u already present in subsys %s\n",
  4173					ns->head->ns_id, subsys->subnqn);
  4174				mutex_unlock(&subsys->lock);
  4175				nvme_put_subsystem(subsys);
  4176				goto out;
  4177			}
  4178		} else {
> 4179			mutex_lock(&ns->head->lock);
  4180			old_subsys = ns->head->subsys;
  4181			if (nvme_mpath_move_head(ns->head, subsys) < 0) {
  4182				mutex_unlock(&ns->head->lock);
  4183				mutex_unlock(&subsys->lock);
  4184				nvme_put_subsystem(subsys);
  4185				dev_err(ctrl->device,
  4186					"failed to move nsid %u to subsystem\n",
  4187					ns->head->ns_id);
  4188				old_subsys = NULL;
  4189				goto out;
  4190			}
  4191			kref_get(&subsys->ref);
  4192			ns->head->ids = info->ids;
  4193			mutex_unlock(&ns->head->lock);
  4194			mutex_unlock(&subsys->lock);
  4195		}
  4196		mutex_unlock(&subsys->lock);
  4197		nvme_put_subsystem(subsys);
  4198		if (old_subsys)
  4199			nvme_put_subsystem(old_subsys);
  4200	
  4201		ret = nvme_update_ns_info(ns, info);
  4202	out:
  4203		/*
  4204		 * Only remove the namespace if we got a fatal error back from the
  4205		 * device, otherwise ignore the error and just move on.
  4206		 *
  4207		 * TODO: we should probably schedule a delayed retry here.
  4208		 */
  4209		if (ret > 0 && (ret & NVME_STATUS_DNR))
  4210			nvme_ns_remove(ns);
  4211	}
  4212	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
