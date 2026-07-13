Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B206F3164D8;
	Mon, 13 Jul 2026 03:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783913322; cv=none; b=GQjfIs9w95jCmEspa13T/5O7SpQ/MOsiuYJvsMRYRYrLaSdepOxjHt28zs8Fe1HHt5FFyJK76Y6n3xR6lz74HYEUJPagD2XNtiSeO24ukmVAdhUQWIQ4qkMXR+YEt82H/q67h9H7tW30QNaCG+rVwYmAPOjBP0jwj0IjzjXjRMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783913322; c=relaxed/simple;
	bh=3BDvRWB/HY1BZ9/NW/t0QUl08l6EdDJ5AS0+RLSD3TE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sLFROr/7nyHWlrXzE6ZtAjFxcJxn51VzseMuC7WjH9Wo3mzVZVbni91cR6P7SNsYPvXA2aJ4UpGQe58wFj3jpwNqi5+F3vUAtaGIM9TVYFQ3Tua8Zu8DyfQvFYeTXPDoklmgRamjpJC8FkeTdm95fJNG43mzOWneqq8r4URxdNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j0DKe2yL; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j0DKe2yL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783913320; x=1815449320;
  h=date:from:to:cc:subject:message-id;
  bh=3BDvRWB/HY1BZ9/NW/t0QUl08l6EdDJ5AS0+RLSD3TE=;
  b=j0DKe2yLv+CCM7zn/MCdkAFHg+X+rCaY6eaoryEg3pT3i+CIMnSSAJQp
   1NuRHamRbrvmPbqs0fW77xabXjdfzccxukaWNVyQBpvoOE7LuSFxFxW0g
   uaFc2Tg+nz14W51RGOItYcsRpqcYWY7O0ZpBWXmsp8ohakSfG+ltCGELE
   eXumNcMdI3GN6CUobT/KXEmJ3Q2MJtU5dE37EVg43hHqiSUQ0ysdGLE60
   U6TfsuK1ID3cmTFVIQYYGQVy173V9PhYTmm5A0+wcwXDNHELX8RNnZ3IT
   FQOGI9NfBCVKY5Tb+MPZ0FRHXIcYe3Z4nWkHZXFaiebaV6knVzPLDP74r
   w==;
X-CSE-ConnectionGUID: EudpNAOZRpC3xrj+bd0I0w==
X-CSE-MsgGUID: DfNCtEThRmacTcxQBajA5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83635423"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83635423"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 20:28:39 -0700
X-CSE-ConnectionGUID: JAfdep6ITceWjcxkyufpLQ==
X-CSE-MsgGUID: UD90Go6zQ9mWDq3x/Ch8qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="257375276"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 12 Jul 2026 20:28:37 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wj7LP-00000000LL8-0POO;
	Mon, 13 Jul 2026 03:28:35 +0000
Date: Mon, 13 Jul 2026 11:28:07 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/cleanup 3/59]
 arch/arm/include/asm/smp.h:73:43: warning: declaration of 'struct completion'
 will not be visible outside of this function
Message-ID: <202607131114.p7YIjoLa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/cleanup
head:   0ad363c8e014568032d53fe2c7ab288de68373f4
commit: 7685fb5c8fe1aebd1a2202b2267a79d5b6775fd2 [3/59] nodemask: Include find.h instead of random.h
config: arm-defconfig (https://download.01.org/0day-ci/archive/20260713/202607131114.p7YIjoLa-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e6e6dabdc02153552a64fc74ff5c7532447eed)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260713/202607131114.p7YIjoLa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607131114.p7YIjoLa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:8:
   In file included from include/linux/prandom.h:13:
   In file included from include/linux/percpu.h:5:
   In file included from include/linux/alloc_tag.h:14:
   In file included from include/linux/smp.h:120:
>> arch/arm/include/asm/smp.h:73:43: warning: declaration of 'struct completion' will not be visible outside of this function [-Wvisibility]
      73 | extern int register_ipi_completion(struct completion *completion, int cpu);
         |                                           ^
   1 warning generated.
--
   In file included from arch/arm/kernel/isa.c:12:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:7:
   In file included from include/linux/list_lru.h:13:
   In file included from include/linux/shrinker.h:8:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:63:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:120:
>> arch/arm/include/asm/smp.h:73:43: warning: declaration of 'struct completion' will not be visible outside of this function [-Wvisibility]
      73 | extern int register_ipi_completion(struct completion *completion, int cpu);
         |                                           ^
   arch/arm/kernel/isa.c:41:33: warning: variable 'isa_sysctl_header' set but not used [-Wunused-but-set-global]
      41 | static struct ctl_table_header *isa_sysctl_header;
         |                                 ^
   2 warnings generated.
--
   In file included from arch/arm/kernel/smp.c:7:
   In file included from include/linux/module.h:18:
   In file included from include/linux/kmod.h:9:
   In file included from include/linux/umh.h:4:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:63:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:120:
>> arch/arm/include/asm/smp.h:73:43: warning: declaration of 'struct completion' will not be visible outside of this function [-Wvisibility]
      73 | extern int register_ipi_completion(struct completion *completion, int cpu);
         |                                           ^
   arch/arm/kernel/smp.c:619:5: error: conflicting types for 'register_ipi_completion'
     619 | int register_ipi_completion(struct completion *completion, int cpu)
         |     ^
   arch/arm/include/asm/smp.h:73:12: note: previous declaration is here
      73 | extern int register_ipi_completion(struct completion *completion, int cpu);
         |            ^
   1 warning and 1 error generated.
--
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:8:
   In file included from include/linux/prandom.h:13:
   In file included from include/linux/percpu.h:5:
   In file included from include/linux/alloc_tag.h:14:
   In file included from include/linux/smp.h:120:
>> arch/arm/include/asm/smp.h:73:43: warning: declaration of 'struct completion' will not be visible outside of this function [-Wvisibility]
      73 | extern int register_ipi_completion(struct completion *completion, int cpu);
         |                                           ^
   1 warning generated.


vim +73 arch/arm/include/asm/smp.h

f6dd9fa5a75a3da include/asm-arm/smp.h      Jens Axboe    2008-06-10  72  
5135d875e1457ef arch/arm/include/asm/smp.h Nicolas Pitre 2012-11-27 @73  extern int register_ipi_completion(struct completion *completion, int cpu);
5135d875e1457ef arch/arm/include/asm/smp.h Nicolas Pitre 2012-11-27  74  

:::::: The code at line 73 was first introduced by commit
:::::: 5135d875e1457ef946a055003d8f80713e862135 ARM: SMP: basic IPI triggered completion support

:::::: TO: Nicolas Pitre <nicolas.pitre@linaro.org>
:::::: CC: Nicolas Pitre <nicolas.pitre@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
