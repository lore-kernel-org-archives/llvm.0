Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC3C24521;
	Thu, 24 Aug 2023 03:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692847643; x=1724383643;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A3iZPqngUyTbrB3YhDz9wWKRazwFt+VVj9sYzPiGUAs=;
  b=DTwul3Zdm0WEE3A8Sqxtiy/1KFGqNObrP7C9RDeVOsA+5hoaXOWy7CdH
   JiTgfd17+hoDc9Y+Y/sp3qzzVIrHWTdHRMRy8bS7sCAGaOl8JXWihDY2O
   QKOHrQmUCvOgXOfhRWLNdBk7fThdiJ6ZyA49l7VUsjzG6Ic0IQaPa0Fis
   vDjrohAR8CYn+NqkFkhNlrPu7Y8fD89ltBFOAhFg+lbGjBQw3F5OlMtzM
   3TktALSZYnHRNfmaE6/KNX+UYtiUStquzMrLjqvGlmaYwMuTTgvMGat6j
   dnC7hJHUjzBL5kxz684hqNYegI/EECbE7qolvB2CE5RIfJ6G4MIIoJsBt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="364504220"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="364504220"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 20:27:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="766379501"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="766379501"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 23 Aug 2023 20:27:16 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZ108-0001j2-0Z;
	Thu, 24 Aug 2023 03:27:16 +0000
Date: Thu, 24 Aug 2023 11:26:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/4] perf: Use folios for the aux ringbuffer &
 pagefault path
Message-ID: <202308241126.5y4WcO3T-lkp@intel.com>
References: <20230821202016.2910321-5-willy@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230821202016.2910321-5-willy@infradead.org>

Hi Matthew,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on acme/perf/core]
[also build test WARNING on tip/perf/core akpm-mm/mm-everything linus/master v6.5-rc7 next-20230823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/perf-Convert-perf_mmap_-alloc-free-_page-to-folios/20230822-042131
base:   https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git perf/core
patch link:    https://lore.kernel.org/r/20230821202016.2910321-5-willy%40infradead.org
patch subject: [RFC PATCH 4/4] perf: Use folios for the aux ringbuffer & pagefault path
config: mips-randconfig-r003-20230824 (https://download.01.org/0day-ci/archive/20230824/202308241126.5y4WcO3T-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308241126.5y4WcO3T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308241126.5y4WcO3T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/events/ring_buffer.c:11:
   In file included from include/linux/perf_event.h:18:
   In file included from include/uapi/linux/bpf_perf_event.h:11:
   In file included from ./arch/mips/include/generated/uapi/asm/bpf_perf_event.h:1:
   In file included from include/uapi/asm-generic/bpf_perf_event.h:4:
   In file included from include/linux/ptrace.h:6:
   In file included from include/linux/sched.h:12:
   In file included from ./arch/mips/include/generated/asm/current.h:1:
   In file included from include/asm-generic/current.h:5:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/mips/include/asm/thread_info.h:16:
   In file included from arch/mips/include/asm/processor.h:14:
   In file included from include/linux/atomic.h:7:
>> arch/mips/include/asm/atomic.h:155:1: warning: used $at (currently $1) without ".set noat" [-Winline-asm]
     155 | ATOMIC_OPS(atomic, add, int, +=, addu, ll, sc)
         | ^
   arch/mips/include/asm/atomic.h:151:2: note: expanded from macro 'ATOMIC_OPS'
     151 |         ATOMIC_OP(pfx, op, type, c_op, asm_op, ll, sc)                  \
         |         ^
   arch/mips/include/asm/atomic.h:74:3: note: expanded from macro 'ATOMIC_OP'
      74 |         "       " #asm_op " %0, %2                              \n"     \
         |          ^
   <inline asm>:5:11: note: instantiated into assembly here
       5 |         addu $3, $1                             
         |                  ^
   1 warning generated.


vim +155 arch/mips/include/asm/atomic.h

4edac529eb629c arch/mips/include/asm/atomic.h Peter Zijlstra 2016-04-18  148  
1da7bce8591d58 arch/mips/include/asm/atomic.h Paul Burton    2019-10-01  149  #undef ATOMIC_OPS
a38ee6bb14a41b arch/mips/include/asm/atomic.h Paul Burton    2019-10-01  150  #define ATOMIC_OPS(pfx, op, type, c_op, asm_op, ll, sc)			\
a38ee6bb14a41b arch/mips/include/asm/atomic.h Paul Burton    2019-10-01  151  	ATOMIC_OP(pfx, op, type, c_op, asm_op, ll, sc)			\
a38ee6bb14a41b arch/mips/include/asm/atomic.h Paul Burton    2019-10-01  152  	ATOMIC_OP_RETURN(pfx, op, type, c_op, asm_op, ll, sc)		\
a38ee6bb14a41b arch/mips/include/asm/atomic.h Paul Burton    2019-10-01  153  	ATOMIC_FETCH_OP(pfx, op, type, c_op, asm_op, ll, sc)
^1da177e4c3f41 include/asm-mips/atomic.h      Linus Torvalds 2005-04-16  154  
a38ee6bb14a41b arch/mips/include/asm/atomic.h Paul Burton    2019-10-01 @155  ATOMIC_OPS(atomic, add, int, +=, addu, ll, sc)
a38ee6bb14a41b arch/mips/include/asm/atomic.h Paul Burton    2019-10-01  156  ATOMIC_OPS(atomic, sub, int, -=, subu, ll, sc)
0004a9dfeaa709 include/asm-mips/atomic.h      Ralf Baechle   2006-10-31  157  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
