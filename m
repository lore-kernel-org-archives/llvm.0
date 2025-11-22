Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44972227E83;
	Sat, 22 Nov 2025 17:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763833754; cv=none; b=BEm+xSUgTrjvSDMLw8HczdMjVujEMfgzTtesdXbcC2LNCWA2WFeLIQ9fKcdUmIBhaikDqGunT+5I95prVuQZ3Fw8WyCUnxssZMZ4wmeJEG7+eG3hIXpO7mArhNTozye8zvnzguPgZw89LLrJaagnK3vOp3OH5BzxwMRfEh/7epo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763833754; c=relaxed/simple;
	bh=YUur6DbwKTKWFOrhDPHTes0/J1kDIJkq4u0+VBq/R0w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lf+exWY4uetlaAGWrlbJuVepZjs6eBGgipvfVA++3KNmFmTulIGwoSr0Jcb8uGOVeY65mHIjN7P9gamsJAxs+1kgBT+n3iQteauP5vEOmGW/VAIHTVKzXeESVzZKSyilnBvlgmalv2sTBkelHvaeC5dcByMbTJBvA5OnxrMmNAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WdkkdI8b; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WdkkdI8b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763833752; x=1795369752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YUur6DbwKTKWFOrhDPHTes0/J1kDIJkq4u0+VBq/R0w=;
  b=WdkkdI8bcBhb+loY6jQ8DVSPQnwyNV7SInb4rJHsOn9BQq22gdhEU0L6
   wph9vRvqPcQhUTscZ4/UE5X9km+P4yHXHf02t/76EZDQIgYnnIuGM6qVy
   oL2Sf3eYQSXmueAq8qHiQMO8JSk3fzHzsyD2dTJ96IiF2PDkzjcZc4B4U
   tvPHPpFGVDwxSaBNzIkRVw9t9ERRlz0UBW8VFltNvpy9aiPh+bqrtoQLn
   lEaE7rGWbpp2nZArmZ1pWcwc6SzgbObjuCd2FOIuXJQlyiqg/S6w4tqqI
   5F+h43YYQ1cBvn9koIHNfQ4kuTxggGN9eQQDP6yoIf4mAnilk1ulbj8Sp
   A==;
X-CSE-ConnectionGUID: O8Yu3tq9TQew3dbi5hHLTQ==
X-CSE-MsgGUID: OMJguwdrS+qLjEIS/o964Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="76586306"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="76586306"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 09:49:11 -0800
X-CSE-ConnectionGUID: molzxrzFQ2a2AjxpgrLA9w==
X-CSE-MsgGUID: hJUvlbifRG2JF/9gsvWIQA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 22 Nov 2025 09:49:10 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMrjP-0007jT-1n;
	Sat, 22 Nov 2025 17:49:07 +0000
Date: Sun, 23 Nov 2025 01:48:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 955/957] fs/bcachefs/btree/iter.h:387:3:
 error: call to undeclared function 'trace_and_count'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202511230110.7BnaTkH2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   018e946b823e2a10e054aa0516e254e060af3fd5
commit: e90865a4bd9471b154779be27f4e4a8ebce69d02 [955/957] bcachefs: move count_event() to sb/counters.h
config: hexagon-randconfig-002-20251122 (https://download.01.org/0day-ci/archive/20251123/202511230110.7BnaTkH2-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511230110.7BnaTkH2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511230110.7BnaTkH2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/data/ec.c:7:
   In file included from fs/bcachefs/alloc/accounting.h:5:
   In file included from fs/bcachefs/btree/update.h:5:
>> fs/bcachefs/btree/iter.h:387:3: error: call to undeclared function 'trace_and_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     387 |                 trace_and_count(trans->c, trans_restart_injected, trans, ip);
         |                 ^
>> fs/bcachefs/btree/iter.h:387:29: error: use of undeclared identifier 'trans_restart_injected'; did you mean 'trace_trans_restart_injected'?
     387 |                 trace_and_count(trans->c, trans_restart_injected, trans, ip);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
         |                                           trace_trans_restart_injected
   fs/bcachefs/debug/trace.h:959:1: note: 'trace_trans_restart_injected' declared here
     959 | DEFINE_EVENT(transaction_event, trans_restart_injected,
         | ^
   include/linux/tracepoint.h:608:2: note: expanded from macro 'DEFINE_EVENT'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:481:2: note: expanded from macro 'DECLARE_TRACE_EVENT'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^
   include/linux/tracepoint.h:409:2: note: expanded from macro '__DECLARE_TRACE'
     409 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto))
         |         ^
   include/linux/tracepoint.h:385:21: note: expanded from macro '__DECLARE_TRACE_COMMON'
     385 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:127:1: note: expanded from here
     127 | trace_trans_restart_injected
         | ^
   2 errors generated.
--
   In file included from fs/bcachefs/init/fs.c:12:
   In file included from fs/bcachefs/alloc/backpointers.h:7:
>> fs/bcachefs/btree/iter.h:387:3: error: call to undeclared function 'trace_and_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     387 |                 trace_and_count(trans->c, trans_restart_injected, trans, ip);
         |                 ^
>> fs/bcachefs/btree/iter.h:387:29: error: use of undeclared identifier 'trans_restart_injected'; did you mean 'trace_trans_restart_injected'?
     387 |                 trace_and_count(trans->c, trans_restart_injected, trans, ip);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
         |                                           trace_trans_restart_injected
   fs/bcachefs/debug/trace.h:959:1: note: 'trace_trans_restart_injected' declared here
     959 | DEFINE_EVENT(transaction_event, trans_restart_injected,
         | ^
   include/linux/tracepoint.h:608:2: note: expanded from macro 'DEFINE_EVENT'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:481:2: note: expanded from macro 'DECLARE_TRACE_EVENT'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^
   include/linux/tracepoint.h:409:2: note: expanded from macro '__DECLARE_TRACE'
     409 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto))
         |         ^
   include/linux/tracepoint.h:385:21: note: expanded from macro '__DECLARE_TRACE_COMMON'
     385 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:127:1: note: expanded from here
     127 | trace_trans_restart_injected
         | ^
   fs/bcachefs/init/fs.c:1123:25: warning: result of comparison of constant 262144 with expression of type 'u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
    1123 |             c->opts.block_size > PAGE_SIZE) {
         |             ~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~
   1 warning and 2 errors generated.


vim +/trace_and_count +387 fs/bcachefs/btree/iter.h

e5af273fcefb13 fs/bcachefs/btree_iter.h Kent Overstreet 2021-07-25  382  
9cf6b84b71adb9 fs/bcachefs/btree_iter.h Kent Overstreet 2024-09-23  383  static inline int trans_maybe_inject_restart(struct btree_trans *trans, unsigned long ip)
9cf6b84b71adb9 fs/bcachefs/btree_iter.h Kent Overstreet 2024-09-23  384  {
9cf6b84b71adb9 fs/bcachefs/btree_iter.h Kent Overstreet 2024-09-23  385  #ifdef CONFIG_BCACHEFS_INJECT_TRANSACTION_RESTARTS
9cf6b84b71adb9 fs/bcachefs/btree_iter.h Kent Overstreet 2024-09-23  386  	if (!(ktime_get_ns() & ~(~0ULL << min(63, (10 + trans->restart_count_this_trans))))) {
9cf6b84b71adb9 fs/bcachefs/btree_iter.h Kent Overstreet 2024-09-23 @387  		trace_and_count(trans->c, trans_restart_injected, trans, ip);
9cf6b84b71adb9 fs/bcachefs/btree_iter.h Kent Overstreet 2024-09-23  388  		return btree_trans_restart_ip(trans,
9cf6b84b71adb9 fs/bcachefs/btree_iter.h Kent Overstreet 2024-09-23  389  					BCH_ERR_transaction_restart_fault_inject, ip);
9cf6b84b71adb9 fs/bcachefs/btree_iter.h Kent Overstreet 2024-09-23  390  	}
9cf6b84b71adb9 fs/bcachefs/btree_iter.h Kent Overstreet 2024-09-23  391  #endif
9cf6b84b71adb9 fs/bcachefs/btree_iter.h Kent Overstreet 2024-09-23  392  	return 0;
9cf6b84b71adb9 fs/bcachefs/btree_iter.h Kent Overstreet 2024-09-23  393  }
9cf6b84b71adb9 fs/bcachefs/btree_iter.h Kent Overstreet 2024-09-23  394  

:::::: The code at line 387 was first introduced by commit
:::::: 9cf6b84b71adb97f3c19476ebb5a42228fad89b5 bcachefs: CONFIG_BCACHEFS_INJECT_TRANSACTION_RESTARTS

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
