Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCED182DF;
	Thu, 13 Jul 2023 17:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689267784; x=1720803784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qs5RdyRBsop7RVJjBwpY/sgTYxI7pQqhIG7M016EMpQ=;
  b=K/wqY2GdRuK1b4de7iv7ygWnrt1vNHHS/dZZkjO4fftfNEoRojf0OUxF
   akNP2KPVBgHTCM84keArdOFhI0QfGE3G/H9ImwWr4JbLpd0ZIdejpo4x9
   NHEl4fPWZFWI73Pa6yHDHU3zrOarGXzxrRr8hAPpW36jRFN5DyJyRlsPU
   l/Pl2NPZWENzK9sXbpJCX8vQkA/Tvlk27iCNqsCFRyrKAVgeGY9LSKeuN
   roF6qyZRpdA4/jVIH0Q7rrEWWoqFtdMnGRUmL7fLUWUg5gExPxTp2e+Mp
   Uik3SpdcVl8JSdDZDbAyqHjQNTbDow/2dGiiXIjf5a6AMY/PZGdxaJ9bc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="451616835"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="451616835"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 10:02:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="792116504"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="792116504"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Jul 2023 10:02:03 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJzhb-0006mU-0Y;
	Thu, 13 Jul 2023 17:02:03 +0000
Date: Fri, 14 Jul 2023 01:01:18 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/new-api-tcx6 2/10] kernel/bpf/mprog.c:285:15: error: use
 of undeclared identifier 'dtuple'; did you mean 'tuple'?
Message-ID: <202307140028.56nRJ5L1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/new-api-tcx6
head:   aac84f1fa4da4148575d5fc7456a439edc67dda0
commit: acf6b4cd3de8224fca4d205c76f48400cb4ca1f1 [2/10] bpf: Add generic attach/detach/query API for multi-progs
config: mips-randconfig-r012-20230713 (https://download.01.org/0day-ci/archive/20230714/202307140028.56nRJ5L1-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307140028.56nRJ5L1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307140028.56nRJ5L1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/mprog.c:285:15: error: use of undeclared identifier 'dtuple'; did you mean 'tuple'?
     285 |         WARN_ON_ONCE(dtuple->prog && dtuple->prog != prog);
         |                      ^~~~~~
         |                      tuple
   include/asm-generic/bug.h:181:41: note: expanded from macro 'WARN_ON_ONCE'
     181 | #define WARN_ON_ONCE(condition) WARN_ON(condition)
         |                                         ^
   include/asm-generic/bug.h:168:25: note: expanded from macro 'WARN_ON'
     168 |         int __ret_warn_on = !!(condition);                              \
         |                                ^
   kernel/bpf/mprog.c:262:25: note: 'tuple' declared here
     262 |                            struct bpf_tuple *tuple, int idx)
         |                                              ^
   kernel/bpf/mprog.c:285:31: error: use of undeclared identifier 'dtuple'; did you mean 'tuple'?
     285 |         WARN_ON_ONCE(dtuple->prog && dtuple->prog != prog);
         |                                      ^~~~~~
         |                                      tuple
   include/asm-generic/bug.h:181:41: note: expanded from macro 'WARN_ON_ONCE'
     181 | #define WARN_ON_ONCE(condition) WARN_ON(condition)
         |                                         ^
   include/asm-generic/bug.h:168:25: note: expanded from macro 'WARN_ON'
     168 |         int __ret_warn_on = !!(condition);                              \
         |                                ^
   kernel/bpf/mprog.c:262:25: note: 'tuple' declared here
     262 |                            struct bpf_tuple *tuple, int idx)
         |                                              ^
   kernel/bpf/mprog.c:286:15: error: use of undeclared identifier 'dtuple'; did you mean 'tuple'?
     286 |         WARN_ON_ONCE(dtuple->link && dtuple->link != link);
         |                      ^~~~~~
         |                      tuple
   include/asm-generic/bug.h:181:41: note: expanded from macro 'WARN_ON_ONCE'
     181 | #define WARN_ON_ONCE(condition) WARN_ON(condition)
         |                                         ^
   include/asm-generic/bug.h:168:25: note: expanded from macro 'WARN_ON'
     168 |         int __ret_warn_on = !!(condition);                              \
         |                                ^
   kernel/bpf/mprog.c:262:25: note: 'tuple' declared here
     262 |                            struct bpf_tuple *tuple, int idx)
         |                                              ^
   kernel/bpf/mprog.c:286:31: error: use of undeclared identifier 'dtuple'; did you mean 'tuple'?
     286 |         WARN_ON_ONCE(dtuple->link && dtuple->link != link);
         |                                      ^~~~~~
         |                                      tuple
   include/asm-generic/bug.h:181:41: note: expanded from macro 'WARN_ON_ONCE'
     181 | #define WARN_ON_ONCE(condition) WARN_ON(condition)
         |                                         ^
   include/asm-generic/bug.h:168:25: note: expanded from macro 'WARN_ON'
     168 |         int __ret_warn_on = !!(condition);                              \
         |                                ^
   kernel/bpf/mprog.c:262:25: note: 'tuple' declared here
     262 |                            struct bpf_tuple *tuple, int idx)
         |                                              ^
   kernel/bpf/mprog.c:287:2: error: use of undeclared identifier 'dtuple'; did you mean 'tuple'?
     287 |         dtuple->prog = prog;
         |         ^~~~~~
         |         tuple
   kernel/bpf/mprog.c:262:25: note: 'tuple' declared here
     262 |                            struct bpf_tuple *tuple, int idx)
         |                                              ^
   kernel/bpf/mprog.c:288:2: error: use of undeclared identifier 'dtuple'; did you mean 'tuple'?
     288 |         dtuple->link = link;
         |         ^~~~~~
         |         tuple
   kernel/bpf/mprog.c:262:25: note: 'tuple' declared here
     262 |                            struct bpf_tuple *tuple, int idx)
         |                                              ^
   6 errors generated.


vim +285 kernel/bpf/mprog.c

   260	
   261	static int bpf_mprog_fetch(struct bpf_mprog_entry *entry,
   262				   struct bpf_tuple *tuple, int idx)
   263	{
   264		int total = bpf_mprog_total(entry);
   265		struct bpf_mprog_cp *cp;
   266		struct bpf_mprog_fp *fp;
   267		struct bpf_prog *prog;
   268		struct bpf_link *link;
   269	
   270		if (idx == -1)
   271			idx = 0;
   272		else if (idx == total)
   273			idx = total - 1;
   274		bpf_mprog_read(entry, idx, &fp, &cp);
   275		prog = READ_ONCE(fp->prog);
   276		link = cp->link;
   277		/* If deletion request can either be without filled tuple in which
   278		 * case it gets populated here based on idx, or with filled tuple
   279		 * where the only thing we end up doing is the WARN_ON_ONCE() assert.
   280		 * If we hit a BPF link at the given index, it must not be removed
   281		 * from opts path.
   282		 */
   283		if (link && !tuple->link)
   284			return -EBUSY;
 > 285		WARN_ON_ONCE(dtuple->prog && dtuple->prog != prog);
   286		WARN_ON_ONCE(dtuple->link && dtuple->link != link);
   287		dtuple->prog = prog;
   288		dtuple->link = link;
   289		return 0;
   290	}
   291	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
