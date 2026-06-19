Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78986379C52;
	Fri, 19 Jun 2026 13:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781874097; cv=none; b=dk+aU0AsUJVuo456RpxYqRXMPX3UvKB0HGqDfSUjoVgij9c+XKgFIG/1ka2XYRhOoPjE5QMTgRaN90fnddZM9XjatQ9jiMCelYNabDS4j8ObekLch4a6xH6Z11R+5lsHJjt61/KnXI0NzLbqGwHsIEzLlp4RVG07KPMwIA83W4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781874097; c=relaxed/simple;
	bh=1296WH2+0t6lKY6FU4tZ9pO8hIvB2/Y44/CF7T/GLI0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I1qLklI7StMisB4FJRHA69UOx4pMlIQYjz9eEZ6zHsCpLgRiF/ZIkDxs7zNTOpRoyMXOIYrBIIKr5+S7bCCgePnC1mlY8zX7mU2QXMgSOhHKCVvedE/1rIhD6DSc9t0YDclDvQWmAEzkU1YVVc4oeV658vjlOAfIUfVDay1+3Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FoDnCJYI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FoDnCJYI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781874096; x=1813410096;
  h=date:from:to:cc:subject:message-id;
  bh=1296WH2+0t6lKY6FU4tZ9pO8hIvB2/Y44/CF7T/GLI0=;
  b=FoDnCJYIaj8yDdKr4oenib8rHilHEsKUUP1gONnpHNzL6D3CZfmxuM6a
   WFWUaErvbOVi8xkiUgdI1dK9Rl7CkR49Xk8uMrPdGWnF4E0l7GeTcJZxb
   3jUNjGgqFvchuj7aWb581knRRPM3rao4AYETk3nfsr/hit+8JyP+bYiWm
   zpjS6cnetJwKpteVu3B0eae86K3y6ZR78xaClr13v1Aqb8HQ0+1MyYBPp
   RSN6/kkavX0vONxkzt1nBHM7/9EirIASyf7dZ1YfqlVeNMvHjulcO9+l7
   mhxy1XMvJ7mMXrFdgow9mmNFo9e4LwKxEtsG5pyPKnWIJD1I+/nKQr+dM
   g==;
X-CSE-ConnectionGUID: IXPM8D+pTEKOqPE23PocYA==
X-CSE-MsgGUID: RV0ZutC7QZWLGQU2ro16DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="93084972"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; 
   d="scan'208";a="93084972"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2026 06:01:31 -0700
X-CSE-ConnectionGUID: 3SUCedNfRo2XwXILxvdr9w==
X-CSE-MsgGUID: 1IsQW8qhTky9Jiy133tPew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; 
   d="scan'208";a="244275770"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 19 Jun 2026 06:01:30 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1waYqd-000000005fF-1oMh;
	Fri, 19 Jun 2026 13:01:27 +0000
Date: Fri, 19 Jun 2026 15:00:49 +0200
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v2 10/12]
 drivers/nvme/target/configfs.c:2360:6: warning: variable 'old_nqn' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202606191414.Amupn6Cg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v2
head:   55b4ace3bb49490cca072cf61a14f8a2a6da407e
commit: 56136fea189403be018d8adc4e368c22c976a823 [10/12] nvmet: make discovery subsystem dynamic
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260619/202606191414.Amupn6Cg-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260619/202606191414.Amupn6Cg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606191414.Amupn6Cg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvme/target/configfs.c:2360:6: warning: variable 'old_nqn' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    2360 |         if (disc_subsys) {
         |             ^~~~~~~~~~~
   drivers/nvme/target/configfs.c:2366:8: note: uninitialized use occurs here
    2366 |         kfree(old_nqn);
         |               ^~~~~~~
   drivers/nvme/target/configfs.c:2360:2: note: remove the 'if' if its condition is always true
    2360 |         if (disc_subsys) {
         |         ^~~~~~~~~~~~~~~~
   drivers/nvme/target/configfs.c:2336:15: note: initialize the variable 'old_nqn' to silence this warning
    2336 |         char *old_nqn, *new_nqn;
         |                      ^
         |                       = NULL
   1 warning generated.


vim +2360 drivers/nvme/target/configfs.c

  2330	
  2331	static ssize_t nvmet_root_discovery_nqn_store(struct config_item *item,
  2332			const char *page, size_t count)
  2333	{
  2334		struct nvmet_subsys *disc_subsys;
  2335		struct list_head *entry;
  2336		char *old_nqn, *new_nqn;
  2337		size_t len;
  2338	
  2339		len = strcspn(page, "\n");
  2340		if (!len || len > NVMF_NQN_FIELD_LEN - 1)
  2341			return -EINVAL;
  2342	
  2343		new_nqn = kstrndup(page, len, GFP_KERNEL);
  2344		if (!new_nqn)
  2345			return -ENOMEM;
  2346	
  2347		down_write(&nvmet_config_sem);
  2348		list_for_each(entry, &nvmet_subsystems_group.cg_children) {
  2349			struct config_item *item =
  2350				container_of(entry, struct config_item, ci_entry);
  2351	
  2352			if (!strncmp(config_item_name(item), page, len)) {
  2353				pr_err("duplicate NQN %s\n", config_item_name(item));
  2354				up_write(&nvmet_config_sem);
  2355				kfree(new_nqn);
  2356				return -EINVAL;
  2357			}
  2358		}
  2359		disc_subsys = nvmet_get_disc_subsys(&init_net);
> 2360		if (disc_subsys) {
  2361			old_nqn = disc_subsys->subsysnqn;
  2362			disc_subsys->subsysnqn = new_nqn;
  2363		}
  2364		up_write(&nvmet_config_sem);
  2365	
  2366		kfree(old_nqn);
  2367		return disc_subsys ? len : -ENOENT;
  2368	}
  2369	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
