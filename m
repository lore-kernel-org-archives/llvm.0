Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3710417C200;
	Sun, 20 Oct 2024 11:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729422946; cv=none; b=THQ3NPfoYmQ7BheSohmWTMFhRhYlZJhpUTv+dvD+vvST07ypeN1ae1ME4KsAIqKdoqWj0AjFvGXo2WqmXXnUC6KjuBCLS7snpgbMP+eND0HiVzGdK7G6sQNDgfA+zoHUSnz4kvuY3FwIDjVlnYkGTvEFoMvz/Co5+xNmQMABrW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729422946; c=relaxed/simple;
	bh=dNaIP19J6t4liRQU078lv5AlRenmylPH0pYmXw92tqg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xw7l5pI7a7lAveNlFRoDTp4Yk7YItxo8r4RmC20E7nQt4DTRwtxg1oMsgalSH5c10C/ASDUBOS+fhrk0rod4dxdZ5MWSUWsAVXRH8/p87YlKZca8N059F+RsA1Qe9m9F9DuSOi/o7HXncmUdBv62xW3jE0wR43GQZ7JMxfyQ3MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nrNhfY4k; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrNhfY4k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729422945; x=1760958945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dNaIP19J6t4liRQU078lv5AlRenmylPH0pYmXw92tqg=;
  b=nrNhfY4kl3tp1cvs98eT/vAs8YNBXZMT7rB1A6h39ltmNLeFmrN7GGft
   T9ATmRBwlPcYa8iPsLKTZgle47jNkvjKHgbxNv2BsT1bkjuwksWHtMWGd
   5P4mhb5Oh80svGpIICsWGvezld9FO0L+Hh+apjB+w5GPQuIn1W6aCU2F7
   UHNQwmafSb9kd2jLNg2hT9GtVMbacJoJJNbAd2snsHl+cu/IoKAc1PF4b
   btSkfFl7U7PxzCvxQS/2D1iv6TYOPtABCeJfWuchMEEmkw3cn+LeMTaj1
   VVwFzbHB19In4kxVGYQWpfzpbQ3y3YqsTl5PnfgTDbH/ARlyE10Nz4XCL
   Q==;
X-CSE-ConnectionGUID: Dy2dIGjNRu+wi/OuqhCuxg==
X-CSE-MsgGUID: sQU4rFVPT76Hda8ehKcsdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="32824829"
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="32824829"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 04:15:41 -0700
X-CSE-ConnectionGUID: A6B/A7DvQ/iP0D80kWE+og==
X-CSE-MsgGUID: 1Vkx7wxuS6qZ7Auow41H/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="84061052"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Oct 2024 04:15:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2TuL-000QEB-1B;
	Sun, 20 Oct 2024 11:15:37 +0000
Date: Sun, 20 Oct 2024 19:15:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20241015-2 1/20]
 kernel/sched/ext.c:3454:10: error: incompatible pointer types returning
 'struct cgroup_hdr *' from a function with result type 'struct cgroup *'
Message-ID: <202410201911.RjSrvRuo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20241015-2
head:   f4f8ca5cd7f039bcab816194342c7b6101e891fe
commit: 7c9abd83f6b3412752cbb1a76954568b5316ad61 [1/20] cgroup: Avoid -Wflex-array-member-not-at-end warnings
config: i386-buildonly-randconfig-003-20241020 (https://download.01.org/0day-ci/archive/20241020/202410201911.RjSrvRuo-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410201911.RjSrvRuo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410201911.RjSrvRuo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:63:
>> kernel/sched/ext.c:3454:10: error: incompatible pointer types returning 'struct cgroup_hdr *' from a function with result type 'struct cgroup *' [-Werror,-Wincompatible-pointer-types]
    3454 |                 return &cgrp_dfl_root.cgrp;
         |                        ^~~~~~~~~~~~~~~~~~~
>> kernel/sched/ext.c:7152:17: error: incompatible pointer types initializing 'struct cgroup *' with an expression of type 'struct cgroup_hdr *' [-Werror,-Wincompatible-pointer-types]
    7152 |         struct cgroup *cgrp = &cgrp_dfl_root.cgrp;
         |                        ^      ~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +3454 kernel/sched/ext.c

f0e1a0643a59bf Tejun Heo 2024-06-18  3442  
8195136669661f Tejun Heo 2024-09-04  3443  #ifdef CONFIG_EXT_GROUP_SCHED
8195136669661f Tejun Heo 2024-09-04  3444  static struct cgroup *tg_cgrp(struct task_group *tg)
8195136669661f Tejun Heo 2024-09-04  3445  {
8195136669661f Tejun Heo 2024-09-04  3446  	/*
8195136669661f Tejun Heo 2024-09-04  3447  	 * If CGROUP_SCHED is disabled, @tg is NULL. If @tg is an autogroup,
8195136669661f Tejun Heo 2024-09-04  3448  	 * @tg->css.cgroup is NULL. In both cases, @tg can be treated as the
8195136669661f Tejun Heo 2024-09-04  3449  	 * root cgroup.
8195136669661f Tejun Heo 2024-09-04  3450  	 */
8195136669661f Tejun Heo 2024-09-04  3451  	if (tg && tg->css.cgroup)
8195136669661f Tejun Heo 2024-09-04  3452  		return tg->css.cgroup;
8195136669661f Tejun Heo 2024-09-04  3453  	else
8195136669661f Tejun Heo 2024-09-04 @3454  		return &cgrp_dfl_root.cgrp;
8195136669661f Tejun Heo 2024-09-04  3455  }
8195136669661f Tejun Heo 2024-09-04  3456  

:::::: The code at line 3454 was first introduced by commit
:::::: 8195136669661fdfe54e9a8923c33b31c92fc1da sched_ext: Add cgroup support

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
