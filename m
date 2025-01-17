Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3AB1A9B5B;
	Fri, 17 Jan 2025 20:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737147579; cv=none; b=bCkbKgCR58/LGzTDfpOPP23gMATlgR8hYAHvGwwdODUk2jDmJzUA6i14qZzZTOMFUyG34d4OqWGnSX2gAwOndJVZpgxdBTH9y+1C5ZxOS/dGVTkEBDxSZ5Sc29j1o1votrvuW8/TimJ1GVo6/vmTVHNPL4GwtU29jsiKpBauPOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737147579; c=relaxed/simple;
	bh=8N31mkICNMaZGX1xA/Vd/HyWcF58vG1N27H8FmDaDxs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HEDz1wHcBxi9t8kdjVTcSgOw7GPJurPT6cW3318KHCt4khHvDRbaSA+DiUjKVx18Te/fmh5gu8lYRtUvV/q6ls0T93S7a0DaGGJYnYliBATuGaTz63EsmRU7xbdXSYZS84E15X/lNhhN1yjQPeYtYeW4LRLv/OdueS0wLcY53zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XoucA2IT; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XoucA2IT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737147577; x=1768683577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8N31mkICNMaZGX1xA/Vd/HyWcF58vG1N27H8FmDaDxs=;
  b=XoucA2ITctP4sBkVc/wa4KMAtzOIx0Z8qkaS1COHbjZnzXeNNZ68gbzu
   lsUCcTU9fie1LANUDmh9SMp6BASC+JGt/t/lJzMLsXLs4ZZWe23HVDLKs
   rGLmOD1rhleUrfv4U1JhQD1GvWRrDhrefL2MpIVoSjNeXXvtvy9JLDg5l
   boykPOwbIepcAOuWhe0BITYYFYoMDO0CHBS/2rE/DMM6kdIN4Qen9Stpb
   Z1gtHmjQyFf/AAG8Y+6TNTaeiZuIYBpw+OcgCEWkDPla35kK0ERicDdWJ
   nZbteTu9BA8MThpohBBXdcp0nCOGHoudl+/8oPYj0aepwpsb/WCo4DCBZ
   g==;
X-CSE-ConnectionGUID: TxU+zh9ITWCiBVoduAedDQ==
X-CSE-MsgGUID: 2Y16RjvtQWa661OZt6i0pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37504474"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="37504474"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 12:59:35 -0800
X-CSE-ConnectionGUID: u6wRFbVRRMSF/VS3IZs4vw==
X-CSE-MsgGUID: +CodYcH1STuecpuxqTMMew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="105756177"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jan 2025 12:59:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYtRD-000ThO-0G;
	Fri, 17 Jan 2025 20:59:31 +0000
Date: Sat, 18 Jan 2025 04:59:29 +0800
From: kernel test robot <lkp@intel.com>
To: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	cgroups@vger.kernel.org, Tejun Heo <tj@kernel.org>
Subject: [tj-cgroup:for-next 5/5] kernel/cgroup/cpuset-v1.c:397:11: error:
 call to undeclared function 'cgroup_path_ns_locked'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202501180416.VoUpllWu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git for-next
head:   03a12b026323247a320495fed3719d39cffdbe9b
commit: 03a12b026323247a320495fed3719d39cffdbe9b [5/5] cgroup/cpuset: Move procfs cpuset attribute under cgroup-v1.c
config: powerpc64-randconfig-002-20250118 (https://download.01.org/0day-ci/archive/20250118/202501180416.VoUpllWu-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501180416.VoUpllWu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180416.VoUpllWu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/cgroup/cpuset-v1.c:3:
   In file included from kernel/cgroup/cpuset-internal.h:6:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> kernel/cgroup/cpuset-v1.c:397:11: error: call to undeclared function 'cgroup_path_ns_locked'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     397 |         retval = cgroup_path_ns_locked(css->cgroup, buf, PATH_MAX,
         |                  ^
   kernel/cgroup/cpuset-v1.c:397:11: note: did you mean 'cgroup_path_ns'?
   include/linux/cgroup.h:786:5: note: 'cgroup_path_ns' declared here
     786 | int cgroup_path_ns(struct cgroup *cgrp, char *buf, size_t buflen,
         |     ^
   4 warnings and 1 error generated.


vim +/cgroup_path_ns_locked +397 kernel/cgroup/cpuset-v1.c

   375	
   376	#ifdef CONFIG_PROC_PID_CPUSET
   377	/*
   378	 * proc_cpuset_show()
   379	 *  - Print tasks cpuset path into seq_file.
   380	 *  - Used for /proc/<pid>/cpuset.
   381	 */
   382	int proc_cpuset_show(struct seq_file *m, struct pid_namespace *ns,
   383			     struct pid *pid, struct task_struct *tsk)
   384	{
   385		char *buf;
   386		struct cgroup_subsys_state *css;
   387		int retval;
   388	
   389		retval = -ENOMEM;
   390		buf = kmalloc(PATH_MAX, GFP_KERNEL);
   391		if (!buf)
   392			goto out;
   393	
   394		rcu_read_lock();
   395		spin_lock_irq(&css_set_lock);
   396		css = task_css(tsk, cpuset_cgrp_id);
 > 397		retval = cgroup_path_ns_locked(css->cgroup, buf, PATH_MAX,
   398					       current->nsproxy->cgroup_ns);
   399		spin_unlock_irq(&css_set_lock);
   400		rcu_read_unlock();
   401	
   402		if (retval == -E2BIG)
   403			retval = -ENAMETOOLONG;
   404		if (retval < 0)
   405			goto out_free;
   406		seq_puts(m, buf);
   407		seq_putc(m, '\n');
   408		retval = 0;
   409	out_free:
   410		kfree(buf);
   411	out:
   412		return retval;
   413	}
   414	#endif /* CONFIG_PROC_PID_CPUSET */
   415	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
