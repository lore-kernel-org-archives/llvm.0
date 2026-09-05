Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4919738330A;
	Sat,  5 Sep 2026 14:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788617633; cv=none; b=ep13tMVA0fbf/60ExH4x7j3DdoUMAXgPyV6kiKvNy0loUzknwQMD3FVn3goXNc9EelvL36iYjUWfh8lqbvpZQTaHCNQfIPQQcg5fFAVU0kQ4xCQpQr+OFgi3Jf0QiC44KQ13yebkaWfv+GigXuHnfEMrm6NM2ystqlYUaGOgNYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788617633; c=relaxed/simple;
	bh=w2qUzmS/jSoznmrlm99D8SA3ql4CWptGQgc6XIaCqxk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IDau2QB1TPNAixZIKKJxXYiyI/eSYEvoHWpA+wSn+JFtu5mD4saEnqZyN96suvUGqw7U+qEjKVK3E4iy7TcFlM9TAsNywiJ6C63COgxTg6foyYFNaDdvRtXmRHGxWkijWhxNHtdQAqbO6NS76Eg8QInU/PI68zvsjI+7D7SvUQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7pC9zL7; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7pC9zL7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788617628; x=1820153628;
  h=date:from:to:cc:subject:message-id;
  bh=w2qUzmS/jSoznmrlm99D8SA3ql4CWptGQgc6XIaCqxk=;
  b=l7pC9zL7Sg3PTg1UP7tGFPV4dGy1Q3y2l4AmeWGpr+sEb7l4tLE6Tt3u
   kSm6U6rZo/x5ay1qa+uJ+56xXnnPCfFr00YIHBFGqhkeKoqVv2wzT1xzL
   /FMcecEe5wH21QhKpeaynkbQGeaIef4/uUAVd7pPtYYewAucTxrgJOHSe
   D/0i7sUDhI2r1yUm4c2K5ELIduEPaIJExe7PlrsDGeyD4rI0mlsyeBtZn
   D9h82+zIQKhZuZqH3J54n183r7JjR19Fla4WMq3yguGHxxpLc5K78/WlT
   TCIeNm4TSnaMmpkYlRgsZzJmcCdT7QpHbbjxPf+2vl6zBoJC9Supv4Qt6
   g==;
X-CSE-ConnectionGUID: 41MbwtqeRgqttp9zlDzlCQ==
X-CSE-MsgGUID: 7E/hSneXRcC5Y2dxQsyGaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89148493"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="89148493"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 07:13:43 -0700
X-CSE-ConnectionGUID: C0KXCoJtSpyWU4ZKWdiB7A==
X-CSE-MsgGUID: P7M5QbjkQ6iqXLiYOnZWjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="267728186"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Sep 2026 07:13:41 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2r9G-000000000YZ-2kE9;
	Sat, 05 Sep 2026 14:13:38 +0000
Date: Sat, 05 Sep 2026 22:13:11 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irqflags 14/22] include/linux/irqflags.h:205:2:
 error: call to undeclared function 'arch_safe_halt'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202609052250.YHjJQHnT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irqflags
head:   60735555f9a14d6c3e0a576e9ea7bcdb883ce747
commit: ca3baf1f465a10907f3cdb979a8c24f3ea6894c1 [14/22] irqflags: Cleanup wrappers
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260905/202609052250.YHjJQHnT-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 0edd1b088cc36b4faee80358c925a91e16006258)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609052250.YHjJQHnT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609052250.YHjJQHnT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/hexagon/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:14:
   In file included from include/linux/sem.h:5:
   In file included from include/uapi/linux/sem.h:5:
   In file included from include/linux/ipc.h:7:
   In file included from include/linux/rhashtable-types.h:12:
   In file included from include/linux/alloc_tag.h:16:
>> include/linux/irqflags.h:205:2: error: call to undeclared function 'arch_safe_halt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     205 |         arch_safe_halt();
         |         ^
   include/linux/irqflags.h:205:2: note: did you mean 'raw_safe_halt'?
   include/linux/irqflags.h:203:29: note: 'raw_safe_halt' declared here
     203 | static __always_inline void raw_safe_halt(void)
         |                             ^
     204 | {
     205 |         arch_safe_halt();
         |         ~~~~~~~~~~~~~~
         |         raw_safe_halt
   In file included from arch/hexagon/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/hexagon/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/hexagon/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/hexagon/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/hexagon/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/hexagon/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/hexagon/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:


vim +/arch_safe_halt +205 include/linux/irqflags.h

   202	
   203	static __always_inline void raw_safe_halt(void)
   204	{
 > 205		arch_safe_halt();
   206	}
   207	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
