Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810028821;
	Sun,  2 Mar 2025 20:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740946131; cv=none; b=E5Voso2pf6ET0vrmu9ZZ088LJ4526U7CIPAibNxXdTgAKp47r/BbHl97JkhwadZpyz1j329JWcwKF0V3AjnHu9s3O8XimXnbT4u0H/bbzt1YCWf3QKLOTUnwb9IWREgFoelSKnG2i2EqOJToSYAzzKCC5nb4N7jzfrDZ77lp2PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740946131; c=relaxed/simple;
	bh=EGYiKUZX68P/yMVbezzeHWHxiO9iBDf2WnhRJEMwp6k=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k5wo1Qj5AkCXvUbFsw15uXNWuH0GGudyMngYSKUj7J17zqjQq8BIjPYd02Ii7u3g9iGcvKqSnYiBTYoQT8jvxLbOZg6vTGbIcvxgvSdkcS99K8zqfkBu8iJYXKsX5wPGFZPXrFddoYR1cdgUb8PZC2TflwX/MEkRILeMNQsZIPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bQlqj5iE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bQlqj5iE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740946129; x=1772482129;
  h=date:from:cc:subject:message-id:mime-version;
  bh=EGYiKUZX68P/yMVbezzeHWHxiO9iBDf2WnhRJEMwp6k=;
  b=bQlqj5iEPhZ5TXvokVfA/kyaXFV4YGj6VLiweh6wsRV/uCUxtMm5eOjL
   m8XpUWG3ReWdM8zVMR/rrYfdeViSe9pZhqVE8mAsuxuWY3Q+jn2+myN3U
   CVrW2zvVo3uk5/dpWkEjgRmVqiF2QmCru0wiFvpi5GoQB9G/U/cfixMgQ
   skZECVKO0tRqqylE6LXVASjbh0/C9RxwJtHQ51xTzoh7cfDrk9uR8nTEu
   gSwIjJMBi3Q37vd11RqvUaLug5QBIfd5VeV+74LxGKz5l4+zFfXQinnAt
   g1varvSrkZpMqgzWax9yR6RQPumR0Z8tsLDrrq5vu+OmS8LnIeqcK+jYd
   Q==;
X-CSE-ConnectionGUID: 0tdT09pRT9iv+BpsT6mM3A==
X-CSE-MsgGUID: BvgAjDMcQLSgYqgDllpjHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="45470091"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="45470091"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 12:08:49 -0800
X-CSE-ConnectionGUID: mMrxAL+DQDCyLm5Dg6SHgQ==
X-CSE-MsgGUID: Uhi52eJnShKS9h9SZic1zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="118015584"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 02 Mar 2025 12:08:47 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1topcD-000HZe-27;
	Sun, 02 Mar 2025 20:08:45 +0000
Date: Mon, 3 Mar 2025 04:07:18 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: kernel/bpf/task_iter.c:707:27: warning: bitwise operation between
 different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag')
Message-ID: <202503030451.6jE6GEqe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Chuyi Zhou <zhouchuyi@bytedance.com>
CC: Martin KaFai Lau <martin.lau@kernel.org>

Hi Chuyi,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b91872c56940950a6a0852e499d249c3091d4284
commit: 0de4f50de25af79c2a46db55d70cdbd8f985c6d1 bpf: Let verifier consider {task,cgroup} is trusted in bpf_iter_reg
date:   1 year, 4 months ago
config: x86_64-buildonly-randconfig-004-20241224 (https://download.01.org/0day-ci/archive/20250303/202503030451.6jE6GEqe-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250303/202503030451.6jE6GEqe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503030451.6jE6GEqe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/bpf/task_iter.c:6:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2166:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/task_iter.c:707:27: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     707 |                   PTR_TO_BTF_ID_OR_NULL | PTR_TRUSTED },
         |                   ~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   5 warnings generated.


vim +707 kernel/bpf/task_iter.c

   699	
   700	static struct bpf_iter_reg task_reg_info = {
   701		.target			= "task",
   702		.attach_target		= bpf_iter_attach_task,
   703		.feature		= BPF_ITER_RESCHED,
   704		.ctx_arg_info_size	= 1,
   705		.ctx_arg_info		= {
   706			{ offsetof(struct bpf_iter__task, task),
 > 707			  PTR_TO_BTF_ID_OR_NULL | PTR_TRUSTED },
   708		},
   709		.seq_info		= &task_seq_info,
   710		.fill_link_info		= bpf_iter_fill_link_info,
   711		.show_fdinfo		= bpf_iter_task_show_fdinfo,
   712	};
   713	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
