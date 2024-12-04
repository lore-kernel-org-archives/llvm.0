Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB602182D9;
	Wed,  4 Dec 2024 15:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733326217; cv=none; b=TkRk9C26JSNu+FcvFGmhnHrLvqFPH7aEPQNcoQ5WrdV4ov0Si6SDUu5J7A6vJ6RtKNFrrBp0E1eLNGg4WaqIQ7DkGs5JLzvEA9uZIZ3+lSXsZhmxIFejXM1SFnUID5WIHqDKuaWSov9GXi5U6p9QVbjnZKN30/YoTuThgYah1Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733326217; c=relaxed/simple;
	bh=sqwV7krO8QQpt0gIpdeqn+4ELfbYilvQVrkrTPkOFiI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LAX2QQt3sjDV5Ln5Nooxx5kx0u5I9zOo4ESN2E/tCPfsaCJDyyEKB7hAJeC7fa9GSFkTPoWrlY4cVq47QHaJeYfC0kKyV3FIai2ZI9bzOfU8Z19F+yWB9iTcvw/Vsy6tS/OnScavwu3vlEQVqsWe0DynVoKtxKuHeMYH8IuXDI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zpy817P/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zpy817P/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733326215; x=1764862215;
  h=date:from:cc:subject:message-id:mime-version;
  bh=sqwV7krO8QQpt0gIpdeqn+4ELfbYilvQVrkrTPkOFiI=;
  b=Zpy817P/wuB3B4n/7f+mdeGaxgxax417bQK5Of05J9K/Z6N9hcW07VA5
   OL9PuDeRqyeAcWaXYLbizkcAHEITgWc5oXW5LHZVbTbVUZVoj7VVw//CL
   6lDfHQBTz6bWCEOlXEoT10UJdyV5T54LLZpygqnpdQz6wZUSixkd4S1eV
   6Wia0mX8mbriMRgL8idixSRpuOTEUM4Lrz/5H7TcYeJNX/MNQ3498ORuO
   xIwnY71TECSUftSBOvesmDv+1W/D/bpNhtarTJAdBH8o8aRqFgRVzjTUx
   WtESuWl2uAwTrd9glOyOExu2F2TYAIwYCfT0zhB4Na27gbGo0kYTZ/eDp
   Q==;
X-CSE-ConnectionGUID: dmp116DAS32ovMlQRE4j3w==
X-CSE-MsgGUID: YIG7dvbVTSqwgJYnNntP3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44989738"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="44989738"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 07:30:14 -0800
X-CSE-ConnectionGUID: ivzYvinoQ7qofhHBqMpX6g==
X-CSE-MsgGUID: SlyuRd03QMOeAomhf7C3+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="94258192"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 04 Dec 2024 07:30:13 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIrKN-0003D7-01;
	Wed, 04 Dec 2024 15:30:11 +0000
Date: Wed, 4 Dec 2024 23:30:06 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH v4 4/4] powerpc/static_call: Implement inline static calls
Message-ID: <202412042329.3iSFKUe8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <3dbd0b2ba577c942729235d0211d04a406653d81.1733245362.git.christophe.leroy@csgroup.eu>
References: <3dbd0b2ba577c942729235d0211d04a406653d81.1733245362.git.christophe.leroy@csgroup.eu>
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
TO: Shrikanth Hegde <sshegde@linux.ibm.com>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Josh Poimboeuf <jpoimboe@kernel.org>
TO: Jason Baron <jbaron@akamai.com>
TO: Steven Rostedt <rostedt@goodmis.org>
TO: Ard Biesheuvel <ardb@kernel.org>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: Ingo Molnar <mingo@redhat.com>
TO: Borislav Petkov <bp@alien8.de>
TO: Dave Hansen <dave.hansen@linux.intel.com>
TO: x86@kernel.org
TO: "H. Peter Anvin" <hpa@zytor.com>
TO: Michael Ellerman <mpe@ellerman.id.au>
TO: Nicholas Piggin <npiggin@gmail.com>
TO: Naveen N Rao <naveen@kernel.org>
TO: Madhavan Srinivasan <maddy@linux.ibm.com>
CC: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: linux-kernel@vger.kernel.org
CC: linuxppc-dev@lists.ozlabs.org

Hi Christophe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.13-rc1 next-20241203]
[cannot apply to tip/x86/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/static_call_inline-Provide-trampoline-address-when-updating-sites/20241204-120612
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/3dbd0b2ba577c942729235d0211d04a406653d81.1733245362.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH v4 4/4] powerpc/static_call: Implement inline static calls
config: powerpc-linkstation_defconfig (https://download.01.org/0day-ci/archive/20241204/202412042329.3iSFKUe8-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412042329.3iSFKUe8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412042329.3iSFKUe8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/prom_init.c:24:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   arch/powerpc/kernel/prom_init.c:666:26: warning: unused function 'prom_getproplen' [-Wunused-function]
     666 | static inline int __init prom_getproplen(phandle node, const char *pname)
         |                          ^~~~~~~~~~~~~~~
   2 warnings generated.
>> arch/powerpc/kernel/prom_init.o: warning: objtool: prom_init+0x34: unannotated intra-function call

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
