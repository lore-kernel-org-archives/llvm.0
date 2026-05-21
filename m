Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0753314B9;
	Thu, 21 May 2026 09:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354027; cv=none; b=Dz7AuZ0jIqkzfeNBJurQqkNshMCz1JGZBfS/uIMAOIAFsZOtD6tyHB6qMTsDNNnBoqcMAcg7scL2TvcdUFQ3/ivASG0XjcTL9ssjYiK4uo6yfElSH0ifD1Tu4mrP8Z9L9SmkfzgGkuIf2GPD4Y//5SmXAXzu2Ruk8ube5x0Ashc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354027; c=relaxed/simple;
	bh=D3GdjWMKVwIqqU8ou6T0SuA8am+ZcaLpQo0U6trJIUo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b0Ff6BS0kYqK1CaXPad0bTwrL4wDL5rA6aCZlMTx0l3mEYdQ71JExf8Lp2uCJq4nQsRF/1MNen9x9zxTUXQnHyMfGFaZMWQYvvVxjibAXRYnFaL7xl+E4+y1Mqjn5kDYgpu3adi6LhLlX7msi2qXhKk9DhMHry9cAPOZiGm0E5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SPmJa5L8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SPmJa5L8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779354025; x=1810890025;
  h=date:from:to:cc:subject:message-id;
  bh=D3GdjWMKVwIqqU8ou6T0SuA8am+ZcaLpQo0U6trJIUo=;
  b=SPmJa5L8T/IgIK+n0BVnpMvcIKHehS3gKTHBwiGEuwZ7H6urClrNy5Cg
   H/vJpK747qJJtWS5o5Wge1JqTdp9ougQpuANv3/mR68vUdkLxmdt9GbPT
   IfF5+o3qvOUbaRNNWeVFxSgM7O68mfMLYbY0B9IrKWi2N1DWoyNemXmCQ
   JYBVUxHEJOKr1gt9zMYb3QmXvxZy0JgSXBSwQ2GzeMSm7qXdHHslyyQTb
   1S1GpL8UBiJl6ZLSS4Im3jn2g+BPjXGjkmRbxYHo2BtC0soiFzdJA16kV
   G01Ib7C3NKKtco2FIN+sJHOqivPO36DCRECymbtSJ1AcnKsU4FAcHKR5u
   w==;
X-CSE-ConnectionGUID: CrBVTWkuTvOp9pU22aDgxQ==
X-CSE-MsgGUID: MBNH6V6dT4+rpfu51w4w4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="82846714"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="82846714"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 02:00:25 -0700
X-CSE-ConnectionGUID: vL6ahn7LRo+DRUxn31bnGw==
X-CSE-MsgGUID: Iym7aqQOSE6CEglOir/VWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="234123119"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 May 2026 02:00:24 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPzGP-000000004i2-2aIS;
	Thu, 21 May 2026 09:00:21 +0000
Date: Thu, 21 May 2026 16:53:52 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 315/1130]
 ipc/sem.c:1824:1: error: conflicting types for 'compat_sys_semctl'
Message-ID: <202605211617.CcC4ovh2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 3d1d8b271178c5662677df53a4e81df2f47a9f2f [315/1130] [CHERRY-PICK] ipc/sem: Adapt semctl syscall for compat64
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260521/202605211617.CcC4ovh2-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211617.CcC4ovh2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211617.CcC4ovh2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ipc/sem.c:1824:1: error: conflicting types for 'compat_sys_semctl'
    1824 | COMPAT_SYSCALL_DEFINE4(semctl, int, semid, int, semnum, int, cmd, compat_ulong_t, arg)
         | ^
   include/linux/compat.h:66:2: note: expanded from macro 'COMPAT_SYSCALL_DEFINE4'
      66 |         COMPAT_SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |         ^
   include/linux/compat.h:82:18: note: expanded from macro 'COMPAT_SYSCALL_DEFINEx'
      82 |         asmlinkage long compat_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))        \
         |                         ^
   <scratch space>:79:1: note: expanded from here
      79 | compat_sys_semctl
         | ^
   include/linux/compat.h:912:17: note: previous declaration is here
     912 | asmlinkage long compat_sys_semctl(int semid, int semnum, int cmd, int arg);
         |                 ^
   1 error generated.


vim +/compat_sys_semctl +1824 ipc/sem.c

  1823	
> 1824	COMPAT_SYSCALL_DEFINE4(semctl, int, semid, int, semnum, int, cmd, compat_ulong_t, arg)
  1825	{
  1826		return compat_ksys_semctl(semid, semnum, cmd, arg, IPC_64);
  1827	}
  1828	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
