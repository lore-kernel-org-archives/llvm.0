Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA0425632;
	Sun, 11 Aug 2024 10:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723371334; cv=none; b=Vmy7g1nO0b+/4XekNC10uNd6Jb3HXs29tep1TEfoyI+80msO62RmuohqA0EIhw/E3phXF9DfA023drh40CHuG9BVKEaKFMNAdALe6AGwTx1aD0i+hEoQ+gIas6Z8Qc/1Ctmn7Rq6ZLR+JNHHAdEIfX4wwh+w1vnLcXo6JSBQnzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723371334; c=relaxed/simple;
	bh=sDT/P1iCUDpjZ5gGE68o9cvEd1FaqaLTZXocAFZ0CcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LH8cwYLt3ftLYJ4DRIVPYrUN82TPPC2pWTCuQ5uklvfJ69n0P61etFVYQ1Qc/t+8WT2uBcioNCNcJQhfgBJ7XvGy4v0+i4uAWpkF5yl12eOiWEdPXZalzvVCGTw3gxZU55yvUTWK+/hY5sjOpdWjaXBvmGRXuWCnvALymdLeLQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jgcMbI+y; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jgcMbI+y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723371333; x=1754907333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sDT/P1iCUDpjZ5gGE68o9cvEd1FaqaLTZXocAFZ0CcQ=;
  b=jgcMbI+ybkcK2/22gor6+Vs89CuhXfyzctk1qAiY2N4Mxn7ZgxmidHAv
   zzjZ2ReiaLgXYrR2PTHXoOH3NCmUOV4x8YdUOrsr3VU/jgZuhked0/hA6
   BpQpE2VBUz3z3swUoTvxUzjYFchLPkAeaORDOEpyrZV1z3xsbT6iN+Z1D
   JFoJh9ocxsQDtjC0N6N+mAkKVVDmLTSQNtLVFSltY9ED8CHjz447Isi6T
   wJ7REOz3vx6p4zByzP8WmAzmmgNp3iKKArDfJRCeVMTVH4RGtEzQu2f9V
   3Yb4B8ow02pd3lVDvd3ZxRnfCdrTMMXsgUlFx4R7LnQ8MEn82sCyY4mL7
   g==;
X-CSE-ConnectionGUID: xesqHo3yRIiZGjPKdwEPKQ==
X-CSE-MsgGUID: A+gfQRy6SdabSdWt4Ejnfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="32071127"
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="32071127"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 03:15:32 -0700
X-CSE-ConnectionGUID: GCt2bzYkSBeM/ZwqqcW6pQ==
X-CSE-MsgGUID: BGAA+5QaTI+Dkv/6wl+t2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="62647671"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 11 Aug 2024 03:15:30 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sd5bh-000Akp-2w;
	Sun, 11 Aug 2024 10:15:26 +0000
Date: Sun, 11 Aug 2024 18:14:39 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Xu <peterx@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 206/222]
 arch/x86/include/asm/pgtable.h:1420:10: error: invalid output size for
 constraint '+q'
Message-ID: <202408111850.Y7rbVXOo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   7d7894afcca68b40bfca49f4d1303167d224919e
commit: a5c1d6b162e7568305f50186568d6e033ad6d81f [206/222] mm/x86: add missing pud helpers
config: i386-randconfig-002-20240811 (https://download.01.org/0day-ci/archive/20240811/202408111850.Y7rbVXOo-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408111850.Y7rbVXOo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408111850.Y7rbVXOo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:12:
   In file included from arch/x86/include/asm/uaccess.h:17:
   In file included from arch/x86/include/asm/tlbflush.h:16:
>> arch/x86/include/asm/pgtable.h:1420:10: error: invalid output size for constraint '+q'
    1420 |                 return xchg(pudp, pud);
         |                        ^
   include/linux/atomic/atomic-instrumented.h:4758:2: note: expanded from macro 'xchg'
    4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: expanded from macro 'raw_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^
   arch/x86/include/asm/cmpxchg.h:78:27: note: expanded from macro 'arch_xchg'
      78 | #define arch_xchg(ptr, v)       __xchg_op((ptr), (v), xchg, "")
         |                                 ^
   arch/x86/include/asm/cmpxchg.h:48:19: note: expanded from macro '__xchg_op'
      48 |                                       : "+q" (__ret), "+m" (*(ptr))     \
         |                                               ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:117: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=3464415616
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1193: prepare0] Error 2 shuffle=3464415616
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2 shuffle=3464415616
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2 shuffle=3464415616
   make: Target 'prepare' not remade because of errors.


vim +1420 arch/x86/include/asm/pgtable.h

  1414	
  1415	static inline pud_t pudp_establish(struct vm_area_struct *vma,
  1416			unsigned long address, pud_t *pudp, pud_t pud)
  1417	{
  1418		page_table_check_pud_set(vma->vm_mm, pudp, pud);
  1419		if (IS_ENABLED(CONFIG_SMP)) {
> 1420			return xchg(pudp, pud);
  1421		} else {
  1422			pud_t old = *pudp;
  1423			WRITE_ONCE(*pudp, pud);
  1424			return old;
  1425		}
  1426	}
  1427	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
