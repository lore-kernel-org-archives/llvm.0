Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D423BD224;
	Mon, 30 Mar 2026 23:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774914665; cv=none; b=k+TZ101bQIKmqEiYI4c67Pv+3Wq/nMhogZYTKMzZXQwUu+rnIcGbv5f8KKxoukk/252wv7naczwTL0Nh54eimUy2MGo1A9w6a/q44TQ9ZUAesCS8x1iCFnbRaAncHeUTl8UeYB1Ml94JAw2oJyY1ETeh/zdhVZ8HJmqXCgiR7Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774914665; c=relaxed/simple;
	bh=TgWCs/w9Y4GwomCQZlkFuBOWZw+W0BN5aypKDPLCl50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YspUwZKvsEbP6BPoIgl6vapuv1gwNYmB0ZiYW/lPid3H2CWSEWGhm17kk4gBongRwkxzU1H80IAgVvoZNWm9pgOXz3PCDBCOC4ToMjdZsfqAzq531jZhm3mHlRQYOALeg7QrBBKuumbvQBmOwttcXcXHQwPNDh2lAvn+7bWHvpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HfK+ac0I; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HfK+ac0I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774914664; x=1806450664;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TgWCs/w9Y4GwomCQZlkFuBOWZw+W0BN5aypKDPLCl50=;
  b=HfK+ac0ISRCqZ+9KtrsnOjpoaba/0Z8TEda5HjDHXSYxliHaoCOrmU5i
   mKu3p/Zg7xh6YmkmGiG6fgj4j9RGP1CTqdQwPrp/tix9pIG6xrDxxKcwb
   82/lpR251M22FcN0SPrIVsw7nlrkZseOUHRgMw5ubdDEe8JcQVC1tTOJ1
   tq0I5kZJsYdMx9bkpS24e0EFEhv6ykqPQfnZtxv3TUj2lizkfZpntKZBy
   PGs4/U7PdR0ZgMtyTBM8BAwLGZbkm3dYv16Q5DEfz9mEG/rDFefji9qrv
   paPLFlWZMBzs+zo6/m7xnayB/ya66DifdDDnGLQ2v9XKrumI+1it5tZoa
   g==;
X-CSE-ConnectionGUID: Lbio50FtT9emrCVTK0LJtg==
X-CSE-MsgGUID: Cp3/xgwlTUOvTQnVTTqC2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75978964"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="75978964"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 16:51:01 -0700
X-CSE-ConnectionGUID: p6uh+cCuShq/E4R9KZc5wQ==
X-CSE-MsgGUID: xZC1HKLCR2GedeLjG94qCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="226075225"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Mar 2026 16:50:59 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7MNl-000000001sr-0B1f;
	Mon, 30 Mar 2026 23:50:57 +0000
Date: Tue, 31 Mar 2026 07:50:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] x86/topo: Unify srat_detect_node among
 amd/intel/hygon
Message-ID: <202603310756.AoXVYvDd-lkp@intel.com>
References: <20260329120841.2118684-1-zlatistiv@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329120841.2118684-1-zlatistiv@gmail.com>

Hi Nikola,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on tip/x86/core v7.0-rc6 next-20260327]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nikola-Z-Ivanov/x86-topo-Unify-srat_detect_node-among-amd-intel-hygon/20260330-114947
base:   linus/master
patch link:    https://lore.kernel.org/r/20260329120841.2118684-1-zlatistiv%40gmail.com
patch subject: [RFC PATCH] x86/topo: Unify srat_detect_node among amd/intel/hygon
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260331/202603310756.AoXVYvDd-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 2cd67b8b69f78e3f95918204320c3075a74ba16c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603310756.AoXVYvDd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603310756.AoXVYvDd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/s390/kernel/asm-offsets.c:12:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/s390/include/asm/pgtable.h:19:
   In file included from include/linux/radix-tree.h:21:
   In file included from include/linux/xarray.h:16:
   In file included from include/linux/gfp.h:8:
>> include/linux/topology.h:44:30: warning: declaration of 'struct cpuinfo_x86' will not be visible outside of this function [-Wvisibility]
      44 | void srat_detect_node(struct cpuinfo_x86 *c);
         |                              ^
   1 warning generated.
--
   In file included from mm/oom_kill.c:21:
   In file included from include/linux/oom.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:13:
   In file included from arch/s390/include/asm/uaccess.h:16:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/s390/include/asm/pgtable.h:19:
   In file included from include/linux/radix-tree.h:21:
   In file included from include/linux/xarray.h:16:
   In file included from include/linux/gfp.h:8:
>> include/linux/topology.h:44:30: warning: declaration of 'struct cpuinfo_x86' will not be visible outside of this function [-Wvisibility]
      44 | void srat_detect_node(struct cpuinfo_x86 *c);
         |                              ^
   mm/oom_kill.c:511:28: warning: variable 'oom_reaper_th' set but not used [-Wunused-but-set-global]
     511 | static struct task_struct *oom_reaper_th;
         |                            ^
   2 warnings generated.
--
   In file included from mm/util.c:2:
   In file included from include/linux/mm.h:8:
   In file included from include/linux/gfp.h:8:
>> include/linux/topology.h:44:30: warning: declaration of 'struct cpuinfo_x86' will not be visible outside of this function [-Wvisibility]
      44 | void srat_detect_node(struct cpuinfo_x86 *c);
         |                              ^
   mm/util.c:198:22: warning: variable 'user_buckets' set but not used [-Wunused-but-set-global]
     198 | static kmem_buckets *user_buckets __ro_after_init;
         |                      ^
   2 warnings generated.
--
   scripts/mod/modpost.c:59:13: warning: variable 'extra_warn' set but not used [-Wunused-but-set-global]
      59 | static bool extra_warn;
         |             ^
   1 warning generated.
   In file included from arch/s390/kernel/asm-offsets.c:12:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/s390/include/asm/pgtable.h:19:
   In file included from include/linux/radix-tree.h:21:
   In file included from include/linux/xarray.h:16:
   In file included from include/linux/gfp.h:8:
>> include/linux/topology.h:44:30: warning: declaration of 'struct cpuinfo_x86' will not be visible outside of this function [-Wvisibility]
      44 | void srat_detect_node(struct cpuinfo_x86 *c);
         |                              ^
   1 warning generated.
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:15:
   In file included from include/linux/sched/mm.h:9:
   In file included from include/linux/gfp.h:8:
>> include/linux/topology.h:44:30: warning: declaration of 'struct cpuinfo_x86' will not be visible outside of this function [-Wvisibility]
      44 | void srat_detect_node(struct cpuinfo_x86 *c);
         |                              ^
   1 warning generated.


vim +44 include/linux/topology.h

    42	
    43	int arch_update_cpu_topology(void);
  > 44	void srat_detect_node(struct cpuinfo_x86 *c);
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
