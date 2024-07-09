Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28AB3E467;
	Tue,  9 Jul 2024 01:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720487563; cv=none; b=nEEo2CG93emCKvLjgdPK82fvXRR1I3w95Ftn2jooKeD0I+ZIPzkoYMmCPmplBzylpJUrGvZfz3E6z3s5LMTQwDm8jBZmG7d+jhtUHr5BpbLSbz0P5tH/qCJ6LZ8i1uc8G71KMSYMOO2c3ZDCTQSFSeWoefdp6sau+CfpnRYhjvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720487563; c=relaxed/simple;
	bh=CAZpRMCgZuiP+GEi3NFXRprbWl77BPCKpHJOZkKVP5s=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HoV1cvx5K7B4QEelDWpimbzt4iAYyb8GLCNq1zj7CEul5nMsWHJxotQTe1Ew99lMIVuqDWJrLyySpIJxXvsmFHF2xOQrsuzU4Ep8vGXmdbsnMuzBrXFjROgkVPlUqaQExVS1LbYyRlQA0XN9xZ8gHJIu1nFdUzebHZYHDlBa3cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RhlPhKMI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RhlPhKMI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720487562; x=1752023562;
  h=date:from:cc:subject:message-id:mime-version;
  bh=CAZpRMCgZuiP+GEi3NFXRprbWl77BPCKpHJOZkKVP5s=;
  b=RhlPhKMIz+IKnAL2R6yw8wwqD8tRmltaCL7SvBe6cN9ASAIrHiYCMWk/
   amVwWkr8vPuojfWFywiiWunyb7tZ3055BZ5a98QAqUHOVlIsnZoosItip
   easgkt4Kz3uKWkHBRssW3NJoyGsM51uIMweGMjiK1z2T53de7UoakKFPP
   diQi/izCOzLRHNPcLuR+hjdBuCsIVyqm00fZyYrnQlrTtivxAZ4KoI5bo
   dFtJhkdGPAafD2cQpGhOHQZdMc7mu14ZH5WsifjHB72OXJICQX2P7E0oF
   ru1d6ieuLCS0SnVEpqUx37k/cyv3qDohkFVNqeS7kaFhZ08C0IIrR6CBu
   g==;
X-CSE-ConnectionGUID: LqLdSAiuQfGILu+G9Om+JA==
X-CSE-MsgGUID: 9eaxUAMcSoSKrRB419RYqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="28316124"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="28316124"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 18:12:42 -0700
X-CSE-ConnectionGUID: hyyQMy/XR/uSZL2o1cK4CQ==
X-CSE-MsgGUID: z48skikuREqdo8bU1rXeqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="47567232"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Jul 2024 18:12:40 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQzPK-000WBs-0m;
	Tue, 09 Jul 2024 01:12:38 +0000
Date: Tue, 9 Jul 2024 09:11:56 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH v2 1/2] riscv: vdso: Prevent gcc from inserting calls to
 memset()
Message-ID: <202407090830.0J7GGX5h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20240705060902.113294-2-alexghiti@rivosinc.com>
References: <20240705060902.113294-2-alexghiti@rivosinc.com>
TO: Alexandre Ghiti <alexghiti@rivosinc.com>
TO: Vladimir Isaev <vladimir.isaev@syntacore.com>
TO: Roman Artemev <roman.artemev@syntacore.com>
TO: Guo Ren <guoren@kernel.org>
TO: Paul Walmsley <paul.walmsley@sifive.com>
TO: Palmer Dabbelt <palmer@dabbelt.com>
TO: Albert Ou <aou@eecs.berkeley.edu>
TO: linux-riscv@lists.infradead.org
TO: linux-kernel@vger.kernel.org
CC: Alexandre Ghiti <alexghiti@rivosinc.com>

Hi Alexandre,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.10-rc7 next-20240703]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/riscv-vdso-Prevent-gcc-from-inserting-calls-to-memset/20240705-203414
base:   linus/master
patch link:    https://lore.kernel.org/r/20240705060902.113294-2-alexghiti%40rivosinc.com
patch subject: [PATCH v2 1/2] riscv: vdso: Prevent gcc from inserting calls to memset()
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240709/202407090830.0J7GGX5h-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407090830.0J7GGX5h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407090830.0J7GGX5h-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   5 warnings generated.
>> clang: error: unknown argument: '-fno-tree-loop-distribute-patterns'
   make[3]: *** [scripts/Makefile.build:244: arch/riscv/kernel/vdso/vgettimeofday.o] Error 1
>> clang: error: unknown argument: '-fno-tree-loop-distribute-patterns'
   make[3]: *** [scripts/Makefile.build:244: arch/riscv/kernel/vdso/hwprobe.o] Error 1
   make[3]: Target 'include/generated/vdso-offsets.h' not remade because of errors.
   make[2]: *** [arch/riscv/Makefile:179: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
