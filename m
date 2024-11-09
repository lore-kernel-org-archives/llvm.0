Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432BB194AFB;
	Sat,  9 Nov 2024 23:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731196629; cv=none; b=FjprSNNzDWglbuNuLblT3sh3/i2tQOwc9ZG7olwM+OXPGosDVruJ9cfrG5jVXq2fDZgWGQafAs958zHQcxXn0dOxJxjXs6ZbK1+IaHm2iNN2V/kOaIQRICZ/SLpTb4VsL2a1rzW6GYZEf78gnRBIWb1ULBRtO2iR+JMhZMkKAbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731196629; c=relaxed/simple;
	bh=dKAgHJZZvOFr+heWDCpsFUk9DYtKmjRghL7zdlTh6U0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k/HG4UOZVBltJ44W1C/bE8RyNWrQO79YJhenDnCiWDPt5fKtb4s/9dlu1YN2M11Foj8qZxXERwUDremS5eZDAo7wQaiMzuqGctP/5mR1byEnOvOEvHCF93HMIa32Ko/2NoVjWSbui2WaHFzMKtCJEKa25gpgprRYEPeVR+Au46A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hS5sz2kq; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hS5sz2kq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731196628; x=1762732628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dKAgHJZZvOFr+heWDCpsFUk9DYtKmjRghL7zdlTh6U0=;
  b=hS5sz2kqn4bAiWxQUPmLTWow7oO63PtD1TSM5FHwBPWlUZ8f/Hk4uTwQ
   lUhVhtPc31lBcIf/ua154vCFmVpVhrEdi7LC0qPVEMBN+WO+J+8buZIyw
   W6nXLcwqPbmCJMWbh+ZeCnqAJ5Rr+LLV0Sq2twvMEUnHwE0+qoez6MWxT
   K3McDXz/bKSbnNX9YzrxxHhLXrshkqwdm54qQaeWM5E5nYb15Vm6cpgGZ
   4IfreiqLYWY/IzmuQgdz1BmsshE6z2V4GUGvBxGqlkX6IpJZ5AnVzu3kT
   9YggxVZZIKpeOYogsek7xNbMPZmYRm6qE1OoKd6CiScZ80IbLxgIyYjdQ
   w==;
X-CSE-ConnectionGUID: AnuUnAGJR/CUEmuvcBBXRg==
X-CSE-MsgGUID: F/30fGXqQOyvk/u1LBIdBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31204929"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31204929"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 15:57:07 -0800
X-CSE-ConnectionGUID: 9kdPLtHRRpyo6rPMvT+IAQ==
X-CSE-MsgGUID: BtZ+4GNFTLSuxUpngAR8rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="117131868"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Nov 2024 15:57:05 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9vKB-000smQ-0X;
	Sat, 09 Nov 2024 23:57:03 +0000
Date: Sun, 10 Nov 2024 07:56:09 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dvyukov:dvyukov-prot-kernonly 1/1] include/linux/mman.h:109:67:
 error: use of undeclared identifier 'PROT_KERNONLY'
Message-ID: <202411100710.Xsw5WJSG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dvyukov/linux dvyukov-prot-kernonly
head:   37187db99b42dfb9784b42cb759c3f628de0d808
commit: 37187db99b42dfb9784b42cb759c3f628de0d808 [1/1] mm: add PROT_KERNONLY
config: mips-mtx1_defconfig (https://download.01.org/0day-ci/archive/20241110/202411100710.Xsw5WJSG-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411100710.Xsw5WJSG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411100710.Xsw5WJSG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/filemap.c:26:
>> include/linux/mman.h:109:67: error: use of undeclared identifier 'PROT_KERNONLY'
           return (prot & ~(PROT_READ | PROT_WRITE | PROT_EXEC | PROT_SEM | PROT_KERNONLY)) == 0;
                                                                            ^
   include/linux/mman.h:147:30: error: use of undeclared identifier 'PROT_KERNONLY'
                  _calc_vm_trans(prot, PROT_KERNONLY,  VM_KERNONLY) |
                                       ^
   include/linux/mman.h:147:30: error: use of undeclared identifier 'PROT_KERNONLY'
   include/linux/mman.h:147:30: error: use of undeclared identifier 'PROT_KERNONLY'
   include/linux/mman.h:147:30: error: use of undeclared identifier 'PROT_KERNONLY'
   include/linux/mman.h:147:30: error: use of undeclared identifier 'PROT_KERNONLY'
   include/linux/mman.h:147:30: error: use of undeclared identifier 'PROT_KERNONLY'
   include/linux/mman.h:159:9: warning: division by zero is undefined [-Wdivision-by-zero]
                  _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:135:48: note: expanded from macro '_calc_vm_trans'
     ((bit1) <= (bit2) ? ((x) & (bit1)) * ((bit2) / (bit1)) \
                                                  ^ ~~~~~~
   include/linux/mman.h:159:9: warning: division by zero is undefined [-Wdivision-by-zero]
                  _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
      : ((x) & (bit1)) / ((bit1) / (bit2))))
                       ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:160:9: warning: division by zero is undefined [-Wdivision-by-zero]
                  _calc_vm_trans(flags, MAP_STACK,      VM_NOHUGEPAGE) |
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
      : ((x) & (bit1)) / ((bit1) / (bit2))))
                       ^ ~~~~~~~~~~~~~~~~~
   3 warnings and 7 errors generated.
--
   In file included from mm/swap.c:21:
>> include/linux/mman.h:109:67: error: use of undeclared identifier 'PROT_KERNONLY'
           return (prot & ~(PROT_READ | PROT_WRITE | PROT_EXEC | PROT_SEM | PROT_KERNONLY)) == 0;
                                                                            ^
   include/linux/mman.h:147:30: error: use of undeclared identifier 'PROT_KERNONLY'
                  _calc_vm_trans(prot, PROT_KERNONLY,  VM_KERNONLY) |
                                       ^
   include/linux/mman.h:147:30: error: use of undeclared identifier 'PROT_KERNONLY'
   include/linux/mman.h:147:30: error: use of undeclared identifier 'PROT_KERNONLY'
   include/linux/mman.h:147:30: error: use of undeclared identifier 'PROT_KERNONLY'
   include/linux/mman.h:147:30: error: use of undeclared identifier 'PROT_KERNONLY'
   include/linux/mman.h:147:30: error: use of undeclared identifier 'PROT_KERNONLY'
   include/linux/mman.h:159:9: warning: division by zero is undefined [-Wdivision-by-zero]
                  _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:135:48: note: expanded from macro '_calc_vm_trans'
     ((bit1) <= (bit2) ? ((x) & (bit1)) * ((bit2) / (bit1)) \
                                                  ^ ~~~~~~
   include/linux/mman.h:159:9: warning: division by zero is undefined [-Wdivision-by-zero]
                  _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
      : ((x) & (bit1)) / ((bit1) / (bit2))))
                       ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:160:9: warning: division by zero is undefined [-Wdivision-by-zero]
                  _calc_vm_trans(flags, MAP_STACK,      VM_NOHUGEPAGE) |
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
      : ((x) & (bit1)) / ((bit1) / (bit2))))
                       ^ ~~~~~~~~~~~~~~~~~
   In file included from mm/swap.c:44:
   In file included from include/trace/events/pagemap.h:83:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:21:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:7:
   include/linux/poll.h:136:27: warning: division by zero is undefined [-Wdivision-by-zero]
                   M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
                                           ^~~~~~~~~
   include/linux/poll.h:134:32: note: expanded from macro 'M'
   #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:120:51: note: expanded from macro '__MAP'
           (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
                                                            ^ ~~~~~~~~~
   include/linux/poll.h:136:39: warning: division by zero is undefined [-Wdivision-by-zero]
                   M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
                                                       ^~~~~~~~~
   include/linux/poll.h:134:32: note: expanded from macro 'M'
   #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:120:51: note: expanded from macro '__MAP'
           (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
                                                            ^ ~~~~~~~~~
   5 warnings and 7 errors generated.


vim +/PROT_KERNONLY +109 include/linux/mman.h

    99	
   100	#ifndef arch_validate_prot
   101	/*
   102	 * This is called from mprotect().  PROT_GROWSDOWN and PROT_GROWSUP have
   103	 * already been masked out.
   104	 *
   105	 * Returns true if the prot flags are valid
   106	 */
   107	static inline bool arch_validate_prot(unsigned long prot, unsigned long addr)
   108	{
 > 109		return (prot & ~(PROT_READ | PROT_WRITE | PROT_EXEC | PROT_SEM | PROT_KERNONLY)) == 0;
   110	}
   111	#define arch_validate_prot arch_validate_prot
   112	#endif
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
