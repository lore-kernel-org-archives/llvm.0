Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5043F800;
	Sat, 11 Oct 2025 20:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760213614; cv=none; b=O+dZLDHlwuc9nVWAG30L35/t3aSx5yewOMbn32gVdtaiQ9ezm9z21vOw/JjyQ26DeD60Ok5Igz5S+DRbPScJqF8LaQQOhgqT4gNRBCBpmj8PxoOx4iTCoWmeWHroK4if7cGYazkC/qtLRbRuuOSv5wemJ6C0OHbDlgmAuzht9Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760213614; c=relaxed/simple;
	bh=LI5uTYkxuxKV0UHwSCGjkUI4X4by6l2SXTTAHOiDWDw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XgLHwWF1PqJwUUgFv/lLUIVKyoJbDJDAW0hpB33tVqdrzkivzDtxddFj8aIq+6YxFqwuTaVt0oxgZYw53ScWbnfWPeuKzoO1oWAb6dftUBPSfvS3gk8bvS3oZ51lhfcqvHisMUvb0Ebwi1kIVKnh5PYXj7fRdzgl7oRwxFGNvtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R6MIjG85; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R6MIjG85"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760213612; x=1791749612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LI5uTYkxuxKV0UHwSCGjkUI4X4by6l2SXTTAHOiDWDw=;
  b=R6MIjG851LCYmARoVclDIv1BK/62gRSVVn15hbuPrlbi8FxTuXM18IFa
   trAxI6jOrE6H72omI6TClsriRnKiQgN80iizz9yYc4Dft8d3blaf0G6nv
   uWhvaELcSslgpYze4ISdxKNhlIa1zcNIQdYMqPZzucN1kA4jXzldo4VUg
   iOfRO+NR49hbULAgfRhxzvANgRGFmp+4QYUOQa7Q2lmaPXUjr1CxPTzGz
   xpevLpa13sA87Z7N6Cierran3VD76glT537U122cs+9O8AHYkUPAL2870
   XI7VGFJB4rteJgFMWgXniojD4nSi4oLzEftUU4TKP2FXewWOMSidW0fVX
   Q==;
X-CSE-ConnectionGUID: 8aMXkWz/SS+MFch5SHLrig==
X-CSE-MsgGUID: pjlYsFV/RZSme2e5r3Mq9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="80040648"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="80040648"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 13:13:31 -0700
X-CSE-ConnectionGUID: wZZDu3gzTRiMT2cQuFbFJQ==
X-CSE-MsgGUID: /Uu0WblFRYGW6ehpOVtzGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="186529435"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Oct 2025 13:13:30 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7fy4-0003y1-0j;
	Sat, 11 Oct 2025 20:13:28 +0000
Date: Sun, 12 Oct 2025 04:13:27 +0800
From: kernel test robot <lkp@intel.com>
To: Brendan Jackman <jackmanb@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Yosry Ahmed <yosryahmed@google.com>
Subject: [bjackman:asi/next 46/50] arch/x86/include/asm/processor.h:247:9:
 error: call to undeclared function '__read_cr3_raw'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202510120458.bMoHJDHN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bjackman/linux asi/next
head:   a6190e0f5b9d575cc97ef8289a7a6c5b0106fc4b
commit: 004f99e324b4f72a19d9a9c7cf4cb749193d5f7a [46/50] mm: asi: exit ASI before accessing CR3 from C code where appropriate
config: x86_64-buildonly-randconfig-003-20251011 (https://download.01.org/0day-ci/archive/20251012/202510120458.bMoHJDHN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510120458.bMoHJDHN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510120458.bMoHJDHN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:60:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/x86/include/asm/thread_info.h:59:
   In file included from arch/x86/include/asm/cpufeature.h:5:
>> arch/x86/include/asm/processor.h:247:9: error: call to undeclared function '__read_cr3_raw'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     247 |         return __read_cr3_raw() & CR3_ADDR_MASK;
         |                ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&


vim +/__read_cr3_raw +247 arch/x86/include/asm/processor.h

   244	
   245	static __always_inline unsigned long read_cr3_pa_raw(void)
   246	{
 > 247		return __read_cr3_raw() & CR3_ADDR_MASK;
   248	}
   249	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
