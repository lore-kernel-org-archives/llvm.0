Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE01629E4;
	Tue, 13 Feb 2024 23:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707865770; cv=none; b=FGdNYaTKwl2+xbPMm14NprtjGU2oDTzChrJAxiAGhR7tTwiQNPsvybalQFz6+OMQq97QJNlEfWrafE8VBWuBeVBeHCSxoSXJRuskJvvJcP7RS99Q2KFeiuf2L7dZlGm+HaVYHXSGd4c5nbQZmInyoB/DlbJXpi3ux+a1kx0vGBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707865770; c=relaxed/simple;
	bh=Ruv49r1sZc5AQTJvy6hZxTyUCUODMyOJZvp+oKDoEfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j59AV/L7aavmy9aoGYz/EwYoFIaHhix4N71vdpN7KQ0eE6G4ZrdOn+lCCZ+oYqdgLT8AgKlhwQPJYzrhnn56CVTa95EqXivW/khGg5YuOlGby1ZYREw8Q5mw2lpM0UyuYJF5CaobRMt/dVNjxEx8L2xiaa9Nu5xjl1SmEsz3vxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UZugletF; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UZugletF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707865768; x=1739401768;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ruv49r1sZc5AQTJvy6hZxTyUCUODMyOJZvp+oKDoEfk=;
  b=UZugletFmycMvJSQkKZtJ9IrADxrxfekD+uyAyl93Na+4PzwwhsVb9Rw
   3och0r0MF5NMaQY8mDAw9/6Ou2MRTv7lCzg20K2C1gQH5zaf1+rGM7rIR
   WLFJP6b9lKC1fddyIk/5NbkWxM/CByN+EYaJ79wliJ5L9uz2PME5JwlD4
   5GrIgj/wZ9NUlbEK2BIweBHnnrqTmQgO2ibafxzOq4UbjT9Wt1/IUH69z
   AITal4jEqLdi+D94WSL+BpRrivSp/LXUL/JY5dSnpV5rbpSdKlzCZ/OjW
   +ViO2ifqWIVqnottoIF+E7Xno4me9XgldRv8foInn+/qPf5wFZIJvFycS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="2020511"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="2020511"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 15:09:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="2997406"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Feb 2024 15:09:20 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ra1tt-00088m-2E;
	Tue, 13 Feb 2024 23:09:17 +0000
Date: Wed, 14 Feb 2024 07:09:14 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz,
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de,
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com,
	corbet@lwn.net, void@manifault.com, peterz@infradead.org,
	juri.lelli@redhat.com, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com,
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com,
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org,
	masahiroy@kernel.org, nathan@kernel.org, dennis@kernel.org,
	tj@kernel.org, muchun.song@linux.dev
Subject: Re: [PATCH v3 29/35] mm: vmalloc: Enable memory allocation profiling
Message-ID: <202402140643.Sy6Ng0Rw-lkp@intel.com>
References: <20240212213922.783301-30-surenb@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212213922.783301-30-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-nonmm-unstable]
[also build test ERROR on linus/master v6.8-rc4]
[cannot apply to akpm-mm/mm-everything vbabka-slab/for-next next-20240213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/lib-string_helpers-Add-flags-param-to-string_get_size/20240213-054335
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20240212213922.783301-30-surenb%40google.com
patch subject: [PATCH v3 29/35] mm: vmalloc: Enable memory allocation profiling
config: mips-bmips_stb_defconfig (https://download.01.org/0day-ci/archive/20240214/202402140643.Sy6Ng0Rw-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project c08b90c50bcac9f3f563c79491c8dbcbe7c3b574)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402140643.Sy6Ng0Rw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402140643.Sy6Ng0Rw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:10:
   In file included from include/linux/mm_types.h:5:
   In file included from include/linux/mm_types_task.h:13:
   In file included from arch/mips/include/asm/page.h:200:
   In file included from arch/mips/include/asm/io.h:563:
   In file included from include/asm-generic/io.h:994:
   In file included from include/linux/vmalloc.h:6:
>> include/linux/sched.h:1338:30: error: field has incomplete type 'struct tlbflush_unmap_batch'
    1338 |         struct tlbflush_unmap_batch     tlb_ubc;
         |                                         ^
   include/linux/sched.h:1338:9: note: forward declaration of 'struct tlbflush_unmap_batch'
    1338 |         struct tlbflush_unmap_batch     tlb_ubc;
         |                ^
>> include/linux/sched.h:1343:20: error: field has incomplete type 'struct page_frag'
    1343 |         struct page_frag                task_frag;
         |                                         ^
   include/linux/sched.h:1343:9: note: forward declaration of 'struct page_frag'
    1343 |         struct page_frag                task_frag;
         |                ^
   2 errors generated.
   make[3]: *** [scripts/Makefile.build:116: arch/mips/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1191: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +1338 include/linux/sched.h

af7f588d8f7355 Mathieu Desnoyers 2022-11-22  1337  
72b252aed506b8 Mel Gorman        2015-09-04 @1338  	struct tlbflush_unmap_batch	tlb_ubc;
72b252aed506b8 Mel Gorman        2015-09-04  1339  
5eca1c10cbaa9c Ingo Molnar       2017-02-06  1340  	/* Cache last used pipe for splice(): */
b92ce55893745e Jens Axboe        2006-04-11  1341  	struct pipe_inode_info		*splice_pipe;
5640f7685831e0 Eric Dumazet      2012-09-23  1342  
5640f7685831e0 Eric Dumazet      2012-09-23 @1343  	struct page_frag		task_frag;
5640f7685831e0 Eric Dumazet      2012-09-23  1344  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
