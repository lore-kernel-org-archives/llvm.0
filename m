Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7750F2744E;
	Thu, 28 Nov 2024 16:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732811331; cv=none; b=DOGtDDjmpHF/nAIqFXttjy2Z8cY/TBzqn5Vd/5EW4xnQxwzkqdAyOiWTDJEeBGLSTc+YRS9fa18SL9T/NFXXMlrSXDiD3ntwmvfM5qTJqT0xO5cdXKct6ayJVvVpsvk+nb/jodF2QoAphsmm5dqsQNd2i5iT/CdmS+y8D23KueA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732811331; c=relaxed/simple;
	bh=wLwRYDpsrFi/3uVieV9mOYPv3KGsX2YylOGpZUV6/ZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IO+GYNG2pAvoj8+jFb4Dt1aexnFCEQia0XloH+mKs+gYj9jPK0pgARKWhREqW56uP706Yb6GtvgFx5eIApgfdCkNHYxtEanFAxbkIbjgBzB7Z2MTArxaX1bwi0GjP6PTB5WGO1z8lNRHKIaie0OL/iiTSBJo8T9KmcdKcfr3EMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RwGXGken; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RwGXGken"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732811330; x=1764347330;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wLwRYDpsrFi/3uVieV9mOYPv3KGsX2YylOGpZUV6/ZY=;
  b=RwGXGkennwtjkmJt99rhCwzqHur2aHprUmqBbe6SG5HQVFy2VUPqKeKg
   7TScJimSsEip/MjQ4lhV9Yao2jwAlYrd8j/5+7Do2soFF1f2i7CRAYNk4
   oRa7f5VDrnC0klrx8Eh+viMSTItsYUBSPgCTBlrijHYywvqiNc+V/jgvl
   4wI/BqZEssqzIfLFS0P71lz9K8yPIf55/NWLTi713ZYJeHPeI7AzS3UJw
   LKITjNeS9VzkUXhXgt+uUlrdZgrmOcSjdM4OdOEzeFM1WeeeZr3x5IHK7
   +n9c5rxetk9CgKygo7rtX687ZierK3mG0PypOiseXAZU0FBtI3UlyLLR0
   Q==;
X-CSE-ConnectionGUID: szYOfO7+TI+YkqJpvdEAMQ==
X-CSE-MsgGUID: 9to82+YJT4iUIoKz0ig7JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="44110538"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="44110538"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 08:28:49 -0800
X-CSE-ConnectionGUID: CF27rMhDSOei0+pq/b27/Q==
X-CSE-MsgGUID: n/Ku9g1hT3+AdohAoWOIGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="123237790"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Nov 2024 08:28:48 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGhNl-0009nn-2T;
	Thu, 28 Nov 2024 16:28:45 +0000
Date: Fri, 29 Nov 2024 00:28:38 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] fs: don't block write during exec on pre-content watched
 files
Message-ID: <202411290029.NPdQREi1-lkp@intel.com>
References: <20241128142532.465176-1-amir73il@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128142532.465176-1-amir73il@gmail.com>

Hi Amir,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on next-20241128]
[cannot apply to kees/for-next/execve brauner-vfs/vfs.all jack-fs/for_next v6.12]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amir-Goldstein/fs-don-t-block-write-during-exec-on-pre-content-watched-files/20241128-222743
base:   linus/master
patch link:    https://lore.kernel.org/r/20241128142532.465176-1-amir73il%40gmail.com
patch subject: [PATCH] fs: don't block write during exec on pre-content watched files
config: powerpc-taishan_defconfig (https://download.01.org/0day-ci/archive/20241129/202411290029.NPdQREi1-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290029.NPdQREi1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290029.NPdQREi1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
>> include/linux/fs.h:3068:15: error: call to undeclared function 'FMODE_FSNOTIFY_HSM'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3068 |         if (unlikely(FMODE_FSNOTIFY_HSM(exe_file->f_mode)))
         |                      ^
   include/linux/fs.h:3074:15: error: call to undeclared function 'FMODE_FSNOTIFY_HSM'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3074 |         if (unlikely(FMODE_FSNOTIFY_HSM(exe_file->f_mode)))
         |                      ^
   In file included from arch/powerpc/kernel/asm-offsets.c:19:
   In file included from include/linux/mman.h:6:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from arch/powerpc/kernel/asm-offsets.c:19:
   include/linux/mman.h:158:9: warning: division by zero is undefined [-Wdivision-by-zero]
     158 |                _calc_vm_trans(flags, MAP_LOCKED,     VM_LOCKED    ) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:137:21: note: expanded from macro '_calc_vm_trans'
     137 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:159:9: warning: division by zero is undefined [-Wdivision-by-zero]
     159 |                _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:137:21: note: expanded from macro '_calc_vm_trans'
     137 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:160:9: warning: division by zero is undefined [-Wdivision-by-zero]
     160 |                _calc_vm_trans(flags, MAP_STACK,      VM_NOHUGEPAGE) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:137:21: note: expanded from macro '_calc_vm_trans'
     137 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   4 warnings and 2 errors generated.
   make[3]: *** [scripts/Makefile.build:102: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1211: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/FMODE_FSNOTIFY_HSM +3068 include/linux/fs.h

  3062	
  3063	/*
  3064	 * Do not prevent write to executable file when watched by pre-content events.
  3065	 */
  3066	static inline int exe_file_deny_write_access(struct file *exe_file)
  3067	{
> 3068		if (unlikely(FMODE_FSNOTIFY_HSM(exe_file->f_mode)))
  3069			return 0;
  3070		return deny_write_access(exe_file);
  3071	}
  3072	static inline void exe_file_allow_write_access(struct file *exe_file)
  3073	{
  3074		if (unlikely(FMODE_FSNOTIFY_HSM(exe_file->f_mode)))
  3075			return;
  3076		allow_write_access(exe_file);
  3077	}
  3078	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
