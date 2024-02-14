Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE672F23;
	Wed, 14 Feb 2024 14:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707921357; cv=none; b=aOUogLimCDbQY83GiGKSk6IZmJQBGqP3s9sw8r4q6eIgx5a6ysiiUXvF7FhWOkt8NIcm0OBoZvljiY9+gjMreJirT2L5x2QaRZKtwxlTn+riQCI3yPa2VSOyPtRLFxu4At6zfcOzToRcFPV62tWGCnjyxZ0N08EH7/n/ANpVpBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707921357; c=relaxed/simple;
	bh=lajX3V/+e43N7d8XoI10P6vDu013k6EqiZ4gVuzz+eM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ofavdtBX6M7C/Eocvxc+RJ3ZjyUTspBA0rAhHibEdEVR3R7qWbzJQUxdFs0m1p8s6DWUczGrDbMJ0gyHTRhKiqoOs2lyC310eVj+WmykYaE0cMo7ZIqKVB4vDg8WyfvbauXgEryzfgLb7nPllM21pOoZz3RTPHFmV0vdRaQVoso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XvNtpjwl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XvNtpjwl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707921356; x=1739457356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lajX3V/+e43N7d8XoI10P6vDu013k6EqiZ4gVuzz+eM=;
  b=XvNtpjwl/adbp/ha3HLF98T0rksePmNToRtTiPQO1U3/eKxsi9IZ4wvr
   ExHXsoY+gXPdRoYro+4KsxRxrjDLwfjtYzNqvrkqDubJHm+MlKObIsXe3
   3Fx+92R5rrIDYOxfFx2D1aIuw5LEhILbY9SB6VfGKRsgPxWrYqtn7Mz2+
   xoaRsfQ5BLaQXMu2Iq7WkpLlH4fGt35F7xJyvxZ0LTRMf3JY9OlcCY7O1
   2S0gVZ6/WX/fuTwKrrD4tF8AuJ1drIqlVE4FSxIfHIhClYiMvb/HWJrkW
   DbGgBHKxGt4V1jfV8wCLstAQBWER5k/oa02DsWwjpBid1OllVfRjtfThA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1875547"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="1875547"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 06:35:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="40695236"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Feb 2024 06:35:54 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raGMY-0008po-1R;
	Wed, 14 Feb 2024 14:35:50 +0000
Date: Wed, 14 Feb 2024 22:35:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:dlserver-feb-fixes 1/9] kernel/sched/fair.c:8535:9: warning:
 incompatible integer to pointer conversion returning 'int' from a function
 with result type 'struct task_struct *'
Message-ID: <202402142202.wl4IpWoW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git dlserver-feb-fixes
head:   a81d7e41130fa46e91bde4dd820f673250934286
commit: 60503246d2cf0d7b91d18325cb21c24c13f1d40d [1/9] sched/core: Add clearing of ->dl_server in put_prev_task_balance()
config: powerpc-mpc834x_itxgp_defconfig (https://download.01.org/0day-ci/archive/20240214/202402142202.wl4IpWoW-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402142202.wl4IpWoW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402142202.wl4IpWoW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/fair.c:8535:9: error: implicit declaration of function 'pick_task_fair' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           return pick_task_fair(dl_se->rq);
                  ^
>> kernel/sched/fair.c:8535:9: warning: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct task_struct *' [-Wint-conversion]
           return pick_task_fair(dl_se->rq);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13122:6: warning: no previous prototype for function 'free_fair_sched_group' [-Wmissing-prototypes]
   void free_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair.c:13122:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void free_fair_sched_group(struct task_group *tg) { }
   ^
   static 
   kernel/sched/fair.c:13124:5: warning: no previous prototype for function 'alloc_fair_sched_group' [-Wmissing-prototypes]
   int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
       ^
   kernel/sched/fair.c:13124:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
   ^
   static 
   kernel/sched/fair.c:13129:6: warning: no previous prototype for function 'online_fair_sched_group' [-Wmissing-prototypes]
   void online_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair.c:13129:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void online_fair_sched_group(struct task_group *tg) { }
   ^
   static 
   kernel/sched/fair.c:13131:6: warning: no previous prototype for function 'unregister_fair_sched_group' [-Wmissing-prototypes]
   void unregister_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair.c:13131:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void unregister_fair_sched_group(struct task_group *tg) { }
   ^
   static 
   5 warnings and 1 error generated.


vim +8535 kernel/sched/fair.c

  8532	
  8533	static struct task_struct *fair_server_pick_task(struct sched_dl_entity *dl_se)
  8534	{
> 8535		return pick_task_fair(dl_se->rq);
  8536	}
  8537	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
