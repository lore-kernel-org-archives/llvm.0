Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A333176025;
	Sun,  9 Mar 2025 22:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741560398; cv=none; b=ajl+xvImTyhJR8fx/1nMd8BLlisTKjtEMZnctMOsuGKsjXNZxq0xcgDVqmX5d2NYYdA4q3W/m0j2lhEfPuYbZT2065Mb2ISaYgFdzyU84kNeBq1VsqmX/CaXPuH8odpI2N/nzoSGf7PPyogDYa8WAFmk+7xzC30Njr9U66f6Bp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741560398; c=relaxed/simple;
	bh=Z0elQAkFg7WZRdHxm7JdE1CZedmmoNxJo8T4URxm1DU=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yv1umcnmtN6fF2Pp78YB03xNkqhbijumJt+0VyCtOaDmvqFoA+oYxRS7P5lmVsPLGtxix5uPrrVcUEfqqBbRhTGeNb5p4XBz0+epD0ES2YViaRmHqabjWKryH5jWmHGRwhmgOWpfnr36vP/PNh1wkUYT0kBh1Inwi7V8PMSLo70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GRE59cIh; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GRE59cIh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741560397; x=1773096397;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Z0elQAkFg7WZRdHxm7JdE1CZedmmoNxJo8T4URxm1DU=;
  b=GRE59cIhMKiV2iODFoAXDKlGcUfMlbeVBgrQk4CG80CCjk29mVqmIa2p
   yX+9Q2Wv8/VdxhRl1uezflvzqVR9B4oxGh9bft/mCG4hbniHP/Yu0JNc3
   dc2WWUnp7hELFbShffeecOd6AHSTVPAnGMdGS33NwSAoOgVV24l2DeUT/
   zIB+OdeWmmkauf5yxSEcRXHPgpBtvrF00wICmDhtrbI8fZ5B9JSfi5Flq
   AI5ccBaazETN19Zrp7s1N2LonBQrOlcBmluAhpgywwyEgVnB3XmDoFmSh
   p1bvAUGYi+USSsQ++DdWdwnzJuO7EafsUJlrOxpniE97lFRnwV5dTJUBb
   Q==;
X-CSE-ConnectionGUID: Rxs3g+7FRzyMAs+V5jQXiQ==
X-CSE-MsgGUID: GeTAXLEpTQmygGi3tcCYgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="53926491"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="53926491"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 15:46:36 -0700
X-CSE-ConnectionGUID: 4iyjH7beTnu4f+NXG82EUQ==
X-CSE-MsgGUID: SRzJlYu9TCKqUkrN1dIJSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="124906734"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 09 Mar 2025 15:46:35 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trPPl-0003XG-0d;
	Sun, 09 Mar 2025 22:46:33 +0000
Date: Mon, 10 Mar 2025 06:46:01 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: kernel/bpf/task_iter.c:707:27: warning: bitwise operation between
 different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag')
Message-ID: <202503100632.ZO4IXUbn-lkp@intel.com>
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
head:   9712d38c87087ae34f8cede6583092c272507c52
commit: 0de4f50de25af79c2a46db55d70cdbd8f985c6d1 bpf: Let verifier consider {task,cgroup} is trusted in bpf_iter_reg
date:   1 year, 4 months ago
config: x86_64-buildonly-randconfig-006-20250127 (https://download.01.org/0day-ci/archive/20250310/202503100632.ZO4IXUbn-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250310/202503100632.ZO4IXUbn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503100632.ZO4IXUbn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/bpf/task_iter.c:6:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2166:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/bpf/task_iter.c:707:27: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     707 |                   PTR_TO_BTF_ID_OR_NULL | PTR_TRUSTED },
         |                   ~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   2 warnings generated.


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
