Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829B5229B1E;
	Fri, 20 Jun 2025 09:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750413180; cv=none; b=iFaroHeMLU/YZYdCyk+tTbNVvrbPDDUs2I9/RGJ09TLubxQH1khNrZgzRPtuw3PciR6YoY5U6QEEbvb68nh6mQ47HX9l1IVj3XTSLK+I04daXqACKzMj1abl+++bXdS1vzdcDNZQLJYt8HJ05v6c+4RkNnj8p6/P5GV82fjl9ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750413180; c=relaxed/simple;
	bh=i+5sJb61h45Tampy7aTBL6wBUfqqz4pqJwNrRU8EILs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L8tvrDqrV/3sVbsE1lL4pssmw56ed61ieXwO58OubGokhrc/oFA/F80SB4dgIWuLrwkHJE6NO7DB0rrg/cPrpR2UzdghVRWiUaBQ9UgxE4v0j1Hl0hkJEVdoNBtZ3dZtm8SXGiNW8HmbuK36p/j8kzXjlKaafzRRk/QefSD9P54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q+36wSPU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+36wSPU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750413177; x=1781949177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i+5sJb61h45Tampy7aTBL6wBUfqqz4pqJwNrRU8EILs=;
  b=Q+36wSPUZsckx3CtgObLxA3YjMOU+pbsi6GSt8ETPejWtReSPTxSIEi0
   Gj20AF76fogD12E+2fMXq2GzXdUOx/x5t2KjuKu8qo0nkV6/xxB4EFKE2
   Pnk+IAMc5JHfgF4MW3SS4mDshjNB3E2VSwriBOLU4yjXl041Q0+V1iImQ
   BbJycdQwuOZyx8rJNEMlq1mgmmSkEmgWKaXuA4I4yaYrFeVp2YFVzfBJM
   MChyjy13twIJ5y3TbxyeF9FEprzJ36r/KLXZ+Uf5yhI6L1X9ft5d1YSDz
   eKUJaOpgv4lAtwTonbwDIVt0TpyXwU5W8v9mc5qt1R09FFJCE6Zm6SiTL
   A==;
X-CSE-ConnectionGUID: Vp3PmApJQUS2kKdb3cBZ4g==
X-CSE-MsgGUID: 4GxjmqLiRleDGX6b16cmSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="70239345"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="70239345"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 02:52:55 -0700
X-CSE-ConnectionGUID: LHsfzbRDQjem4thF2xgc2A==
X-CSE-MsgGUID: y1b6K6YwQWq7edutcxnA5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="150364979"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Jun 2025 02:52:56 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSYQX-000LaS-0c;
	Fri, 20 Jun 2025 09:52:53 +0000
Date: Fri, 20 Jun 2025 17:52:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_5 3/10] include/linux/ftrace.h:563:5:
 warning: no previous prototype for function 'unregister_ftrace_direct_hash'
Message-ID: <202506201756.lZyUFtip-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_5
head:   b288c6b15d20122d59ddf3bce2fb86afe6ed56c3
commit: 85ce35fa5a72947188457f2189f1e9f83482470b [3/10] ftrace: Add unregister_ftrace_direct_hash function
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250620/202506201756.lZyUFtip-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506201756.lZyUFtip-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506201756.lZyUFtip-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/filemap.c:25:
   In file included from include/linux/syscalls.h:94:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:43:
   include/linux/ftrace.h:558:5: warning: no previous prototype for function 'register_ftrace_direct_hash' [-Wmissing-prototypes]
     558 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:558:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     558 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
>> include/linux/ftrace.h:563:5: warning: no previous prototype for function 'unregister_ftrace_direct_hash' [-Wmissing-prototypes]
     563 | int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:563:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     563 | int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
   2 warnings generated.
--
   In file included from mm/shmem.c:77:
   In file included from include/linux/syscalls.h:94:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:43:
   include/linux/ftrace.h:558:5: warning: no previous prototype for function 'register_ftrace_direct_hash' [-Wmissing-prototypes]
     558 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:558:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     558 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
>> include/linux/ftrace.h:563:5: warning: no previous prototype for function 'unregister_ftrace_direct_hash' [-Wmissing-prototypes]
     563 | int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:563:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     563 | int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
   mm/shmem.c:1686:20: warning: unused function 'shmem_show_mpol' [-Wunused-function]
    1686 | static inline void shmem_show_mpol(struct seq_file *seq, struct mempolicy *mpol)
         |                    ^~~~~~~~~~~~~~~
   3 warnings generated.


vim +/unregister_ftrace_direct_hash +563 include/linux/ftrace.h

   557	
 > 558	int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
   559	{
   560		return -ENODEV;
   561	}
   562	
 > 563	int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
   564	{
   565		return -ENODEV;
   566	}
   567	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
