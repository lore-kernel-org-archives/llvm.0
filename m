Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AD63BD247;
	Tue, 17 Mar 2026 12:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773749578; cv=none; b=t8/ljnMOYyORiQ8KTFlGEQ1DAK+TnTnxBzWzgIBEsfC/DV70zAVZYczTCwomvaym7QMFsfzOD7JtwgXiySLaoZ3aKCEUek8WuvfF/xG2P7GC3JsD2lfw6Jps90VNFu16IPwhGd7rf79/uSD2DVpDoF9Uyytg4gCe0pbxEV2qVaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773749578; c=relaxed/simple;
	bh=r6G7Nwqjl+vSixtZqsdkGJl/WjBT8FqQC5kh88mrFHc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=knl3bL5lMegIKWKLOLGrxMDgvrzY2C6wsiFEtnHFBAqrR67XicxGAvlaPZTduHl0LO8FB/OuShIV+yXk0V/NWRhLcqqOMaNJ0STPEO2vrkeUVOvNGwNxXtC2T6WkhUQ2TGVh1/hALPCdjVRZQLVKhV8B5JpBMBF+hiH+2DpeUcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gNwlRNTA; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gNwlRNTA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773749576; x=1805285576;
  h=date:from:to:cc:subject:message-id;
  bh=r6G7Nwqjl+vSixtZqsdkGJl/WjBT8FqQC5kh88mrFHc=;
  b=gNwlRNTAsaHHImFSfzXfYk3vdiUCL0I8Yj6uan2ruEOt3L2pOqgfhLk9
   n0Wma8fSK7s575ZyzyslMtwsA8WOP9BqwiBmfHcH6y1B2ZNuLq526Kequ
   SAuRplWpwKxht0lofhb4yuVJdxriZWKHWwu09fSSG0RsRJq5nkc2HiGZ7
   yGSaAN0REeCXauBGsb1j/8Vq0/s0yAOhxVgrJGqa3H9qoE0aYThAhS12B
   D5gFWz0tYE+vRCexty4BG10dXcsFK0bJuc0sJt3SYUBo2dGWIGQwDEvro
   zVf6btyaunAcU6+PKzWUj+v7t8sY1aPcYHWPOuaPKm6UjM10P5iH1tC+y
   A==;
X-CSE-ConnectionGUID: 19KObUH6Sv+fajN7TGfhyg==
X-CSE-MsgGUID: Z9eHkUY1S0iPUqP54dUx5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="77389303"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="77389303"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 05:12:55 -0700
X-CSE-ConnectionGUID: +ORjRspcQnujsFFQ1YGsxA==
X-CSE-MsgGUID: LwQe4pNJSq+H06j6ZkQDzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="222473507"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Mar 2026 05:12:54 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2TI3-000000000MV-0jxD;
	Tue, 17 Mar 2026 12:12:51 +0000
Date: Tue, 17 Mar 2026 20:12:46 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:locking/futex 2/8]
 include/linux/futex_types.h:52:26: error: expected ';' at end of declaration
 list
Message-ID: <202603172048.EegYZnPt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git locking/futex
head:   226e6782e81c88b9263e006a356f58dd8c15bef5
commit: 2ace2e1df2b9de73d65c1a11bbb4183c42ba5752 [2/8] futex: Move futex related mm_struct data into a struct
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260317/202603172048.EegYZnPt-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603172048.EegYZnPt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603172048.EegYZnPt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/um/kernel/asm-offsets.c:4:
   In file included from include/linux/sched.h:19:
>> include/linux/futex_types.h:52:26: error: expected ';' at end of declaration list
      52 |         unsigned int                    __percpu *phash_ref;
         |                                                  ^
   In file included from arch/um/kernel/asm-offsets.c:8:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:8:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:8:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:8:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:8:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:8:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:8:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:8:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:24: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                                      ^      ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:8:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:139:8: note: expanded from macro '_SIG_SET_BINOP'
     139 |                 b3 = b->sig[3]; b2 = b->sig[2];                         \
         |                      ^      ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];


vim +52 include/linux/futex_types.h

    33	
    34	/**
    35	 * struct futex_mm_data - Futex related per MM data
    36	 * @phash_lock:		Mutex to protect the private hash operations
    37	 * @phash:		RCU managed pointer to the private hash
    38	 * @phash_new:		Pointer to a newly allocated private hash
    39	 * @phash_batches:	Batch state for RCU synchronization
    40	 * @phash_rcu:		RCU head for call_rcu()
    41	 * @phash_atomic:	Aggregate value for @phash_ref
    42	 * @phash_ref:		Per CPU reference counter for a private hash
    43	 */
    44	struct futex_mm_data {
    45	#ifdef CONFIG_FUTEX_PRIVATE_HASH
    46		struct mutex			phash_lock;
    47		struct futex_private_hash	__rcu *phash;
    48		struct futex_private_hash	*phash_new;
    49		unsigned long			phash_batches;
    50		struct rcu_head			phash_rcu;
    51		atomic_long_t			phash_atomic;
  > 52		unsigned int			__percpu *phash_ref;
    53	#endif
    54	};
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
