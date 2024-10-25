Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561CE22A484;
	Fri, 25 Oct 2024 12:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729859544; cv=none; b=TkYZs9+Ydn4Q73iN20ogUPNy56mWd0yUnF5qS9u7klkFURhLR+UwJDQe7AZyCbzL2O1ItXWgKpP+d1p1P1MfFxOJ88fDTnq8YUxkQxIGE8QVeir6DaQrpTOu4NTdySjnzzuq45D2Jc77Yh9QAy0I+lXmluPw3f2v5aqaG1Zt9oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729859544; c=relaxed/simple;
	bh=c72fQ9je8zre3/f5QPlSU+E4er8gPX3WhIwgdZS3t9k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b2IfxuCTuQpaMvfSZNOG7b0Wov1B7Dbuq29b/stdV+LJonVosu98cm3n3tUuzWhw9YQflVNhpNuw96PixZoRgaNYlpEBuNdvYH6RRQOJkK/5RMxW5gyPEQThY0Gyb60fGPtXpsYL7aw28gl8BHyEAIpk776GV2F3Nvzqa5cssIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CnxJbN0W; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CnxJbN0W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729859542; x=1761395542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c72fQ9je8zre3/f5QPlSU+E4er8gPX3WhIwgdZS3t9k=;
  b=CnxJbN0WaiAx4WwjElbYTohkCUwps3tB78XEIKesjDLLhYS6ZKvlJQb5
   TNeXG3jef5bV7IiPlvKLlt3SiJfJlc6GiUBBf9igG9svC/UQ+KfMa5fcN
   Pdlc0OzmT9cawC5+BGRDtymjPfJmO8NqE6Pt1hzd0/ShsMgicCTamj4be
   wPHof9VN8vqgLO87VxK58Zc5DHWr4YYyb9fKOkz5y5DgIv9kuHzZN0G0W
   Gp73nSVafgdF3v5RJcgPKwZ4TIgsJDq861OR42NYXd6j6+x8f//KtOYbz
   c62g8RPQPCVIigwGFhWiYaH98EMwWBp85zy24XHVdEi4zGo03NXYHAqYm
   w==;
X-CSE-ConnectionGUID: b32sPrtyTlqQGjkTym0Ygg==
X-CSE-MsgGUID: 49E3FNt9QVCmkTNE1slm0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="28978914"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="28978914"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 05:32:07 -0700
X-CSE-ConnectionGUID: r1blk5NYTLS0qTau/Q9SHQ==
X-CSE-MsgGUID: lCgx6Ws+RVC4SmaoSzntkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="111717054"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Oct 2024 05:32:04 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4JU2-000YFe-1l;
	Fri, 25 Oct 2024 12:32:02 +0000
Date: Fri, 25 Oct 2024 20:31:09 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 16/17] kernel/unwind/user.c:210:8: error: no member
 named 'nr_entries' in 'struct unwind_user_info'; did you mean 'entries'?
Message-ID: <202410252011.eFEIsaJK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   7f54f6a91246a746ba799c52c97effb41e28a88b
commit: 7a409ba76d997448b80fddf0b3fc96f554aeff14 [16/17] ctx_ctr
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241025/202410252011.eFEIsaJK-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410252011.eFEIsaJK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410252011.eFEIsaJK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/unwind/user.c:15:
   In file included from include/linux/mm.h:2232:
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:510:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     510 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     511 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:523:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     523 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     524 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> kernel/unwind/user.c:210:8: error: no member named 'nr_entries' in 'struct unwind_user_info'; did you mean 'entries'?
     210 |         info->nr_entries = trace.nr;
         |               ^~~~~~~~~~
         |               entries
   include/linux/unwind_user.h:12:18: note: 'entries' declared here
      12 |         unsigned long           *entries;
         |                                  ^
>> kernel/unwind/user.c:211:8: error: no member named 'last_cookie' in 'struct unwind_user_info'; did you mean 'ctx_cookie'?
     211 |         info->last_cookie = cookie;
         |               ^~~~~~~~~~~
         |               ctx_cookie
   include/linux/unwind_user.h:13:8: note: 'ctx_cookie' declared here
      13 |         u64                     ctx_cookie;
         |                                 ^
   4 warnings and 2 errors generated.


vim +210 kernel/unwind/user.c

f16e616d9fd585 Josh Poimboeuf 2024-09-16  172  
f16e616d9fd585 Josh Poimboeuf 2024-09-16  173  static void unwind_user_task_work(struct callback_head *unused)
f16e616d9fd585 Josh Poimboeuf 2024-09-16  174  {
f16e616d9fd585 Josh Poimboeuf 2024-09-16  175  	struct unwind_user_info *info = &current->unwind_user_info;
f16e616d9fd585 Josh Poimboeuf 2024-09-16  176  	struct unwind_stacktrace trace;
f16e616d9fd585 Josh Poimboeuf 2024-09-16  177  	unsigned long pending_callbacks;
f16e616d9fd585 Josh Poimboeuf 2024-09-16  178  	u64 cookie;
f16e616d9fd585 Josh Poimboeuf 2024-09-16  179  	u64 cpu, ctx_ctr;
f16e616d9fd585 Josh Poimboeuf 2024-09-16  180  	int i;
f16e616d9fd585 Josh Poimboeuf 2024-09-16  181  
f16e616d9fd585 Josh Poimboeuf 2024-09-16  182  	BUILD_BUG_ON(UNWIND_MAX_CALLBACKS > 32);
f16e616d9fd585 Josh Poimboeuf 2024-09-16  183  
f16e616d9fd585 Josh Poimboeuf 2024-09-16  184  	if (WARN_ON_ONCE(!info->ctx_cookie || !info->pending_callbacks))
f16e616d9fd585 Josh Poimboeuf 2024-09-16  185  		return;
f16e616d9fd585 Josh Poimboeuf 2024-09-16  186  
f16e616d9fd585 Josh Poimboeuf 2024-09-16  187  	scoped_guard(irqsave) {
f16e616d9fd585 Josh Poimboeuf 2024-09-16  188  		pending_callbacks = info->pending_callbacks;
f16e616d9fd585 Josh Poimboeuf 2024-09-16  189  		cookie = info->ctx_cookie;
f16e616d9fd585 Josh Poimboeuf 2024-09-16  190  
f16e616d9fd585 Josh Poimboeuf 2024-09-16  191  		info->pending_callbacks = 0;
f16e616d9fd585 Josh Poimboeuf 2024-09-16  192  		info->ctx_cookie = 0;
f16e616d9fd585 Josh Poimboeuf 2024-09-16  193  
f16e616d9fd585 Josh Poimboeuf 2024-09-16  194  		cpu = raw_smp_processor_id();
f16e616d9fd585 Josh Poimboeuf 2024-09-16  195  		ctx_ctr = __this_cpu_read(unwind_ctx_ctr);
f16e616d9fd585 Josh Poimboeuf 2024-09-16  196  	}
f16e616d9fd585 Josh Poimboeuf 2024-09-16  197  
f16e616d9fd585 Josh Poimboeuf 2024-09-16  198  	if (!info->entries) {
f16e616d9fd585 Josh Poimboeuf 2024-09-16  199  		info->entries = kmalloc(UNWIND_MAX_ENTRIES * sizeof(long),
f16e616d9fd585 Josh Poimboeuf 2024-09-16  200  					GFP_KERNEL);
f16e616d9fd585 Josh Poimboeuf 2024-09-16  201  		if (!info->entries)
f16e616d9fd585 Josh Poimboeuf 2024-09-16  202  			return;
f16e616d9fd585 Josh Poimboeuf 2024-09-16  203  	}
f16e616d9fd585 Josh Poimboeuf 2024-09-16  204  
f16e616d9fd585 Josh Poimboeuf 2024-09-16  205  	trace.entries = info->entries;
f16e616d9fd585 Josh Poimboeuf 2024-09-16  206  
f16e616d9fd585 Josh Poimboeuf 2024-09-16  207  	trace.nr = 0;
f16e616d9fd585 Josh Poimboeuf 2024-09-16  208  	unwind_user(&trace, UNWIND_MAX_ENTRIES);
f16e616d9fd585 Josh Poimboeuf 2024-09-16  209  
f16e616d9fd585 Josh Poimboeuf 2024-09-16 @210  	info->nr_entries = trace.nr;
f16e616d9fd585 Josh Poimboeuf 2024-09-16 @211  	info->last_cookie = cookie;
f16e616d9fd585 Josh Poimboeuf 2024-09-16  212  
f16e616d9fd585 Josh Poimboeuf 2024-09-16  213  	guard(rwsem_read)(&callbacks_rwsem);
f16e616d9fd585 Josh Poimboeuf 2024-09-16  214  
f16e616d9fd585 Josh Poimboeuf 2024-09-16  215  	for_each_set_bit(i, &pending_callbacks, UNWIND_MAX_CALLBACKS) {
f16e616d9fd585 Josh Poimboeuf 2024-09-16  216  		if (callbacks[i])
f16e616d9fd585 Josh Poimboeuf 2024-09-16  217  			callbacks[i]->func(&trace, cookie, info->privs[i]);
f16e616d9fd585 Josh Poimboeuf 2024-09-16  218  	}
f16e616d9fd585 Josh Poimboeuf 2024-09-16  219  }
f16e616d9fd585 Josh Poimboeuf 2024-09-16  220  

:::::: The code at line 210 was first introduced by commit
:::::: f16e616d9fd58524e2200a34c267279e578816a7 unwind: Add deferred userspace unwinding API

:::::: TO: Josh Poimboeuf <jpoimboe@kernel.org>
:::::: CC: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
