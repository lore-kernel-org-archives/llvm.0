Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F99716F903;
	Fri, 12 Jul 2024 14:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720794649; cv=none; b=tQqC1WB86tTXJRFYdWl1bHJroc7w5XPaUSy/uO0wH91bK7K7fghDQYlZ+aIkYXuxwDmZQG50f0GOSBCd461iT2EB6rFcRCQGQo6gJ2QSbEgV38xz12vHiELeklXFZHeHYJ2Y2ky62rhQdZhKqQ3+jRYIGYvoHg/Nes92gwPuJDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720794649; c=relaxed/simple;
	bh=80CMPgOmfzJvpqZ/vROMHL9991Ra85xdhPOWQ4t0vGM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cFxQZOqqXoxz7Q+Q+1amKDWLfvPwJYQaI5QrWgqYCFf+ZtEj6Cbn2Au7nAUaUwWuKER38E3uFwh1OpZjDI/sclYhlZi90eJdZlGMMrYnOF/xiqQzcWSSkSAbo9zMJtepnO/BPq1ph2Os4w7NG4Cu0dkWT1TZ9C6MOVwaL5saBCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VBqiGOIf; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VBqiGOIf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720794647; x=1752330647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=80CMPgOmfzJvpqZ/vROMHL9991Ra85xdhPOWQ4t0vGM=;
  b=VBqiGOIfq7qK9wZeciVbNDd7isGX3IcDsl79fhkqUq0+VtHF8TkZ2UrT
   Ea3NXoj02ckYj+dB+9cwdXwxFn+Y7+YZYHNAErdua7ZuyM7+klkzvG+iD
   8nYIxbpu32q1CI556mJJAoGb5IZRR5Gyw4sTRc4RywtE00jg6NY7QpbD6
   UYGjKkQ276iCGnrRHwkPDKwmHqn0ms0eHQrjtsG8eMhF64UQCMj/jmH2h
   0EHmOo48gPLuEDD+12Kg6vJh6HbRyZ2STPzUzHwWNABFGhuYZnPBl6LvF
   2BVBjq+FGu1XRYpkxF0Y6/+rjE2b+xRqTmpX73gU5QkSzxHiRXhAn166E
   A==;
X-CSE-ConnectionGUID: Y1FCgkWvSeiJkPpM3JkeLw==
X-CSE-MsgGUID: vDmLvxNhQFy72GtvAqRDow==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="43650007"
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; 
   d="scan'208";a="43650007"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 07:30:29 -0700
X-CSE-ConnectionGUID: lOEF6dEISrqljf3XkBk+2Q==
X-CSE-MsgGUID: X0LQ5jAkRJC8am/5PyMfSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; 
   d="scan'208";a="53220617"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Jul 2024 07:30:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSHI1-000ar8-0t;
	Fri, 12 Jul 2024 14:30:25 +0000
Date: Fri, 12 Jul 2024 22:29:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt 9/10]
 drivers/iommu/generic_pt/fmt/../pt_defs.h:85:9: error: assigning to 'typeof
 (*(__ai_ptr))' (aka 'unsigned long long') from incompatible type 'void'
Message-ID: <202407122239.hm6vXIFd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   262ff230b5cf17a8a573be8dbee522de7a36a87a
commit: e1b5d15c8bfc979a91c9072b2f329051ab672887 [9/10] iommupt: Add the 64 bit ARM page table format
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240712/202407122239.hm6vXIFd-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407122239.hm6vXIFd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407122239.hm6vXIFd-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:11:
>> drivers/iommu/generic_pt/fmt/../pt_defs.h:85:9: error: assigning to 'typeof (*(__ai_ptr))' (aka 'unsigned long long') from incompatible type 'void'
      85 |         return try_cmpxchg64_release(entryp, &old_entry, table_entry);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4937:2: note: expanded from macro 'try_cmpxchg64_release'
    4937 |         raw_try_cmpxchg64_release(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:295:7: note: expanded from macro 'raw_try_cmpxchg64_release'
     295 |         ___r = raw_cmpxchg64_release((_ptr), ___o, (_new)); \
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:332:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:332:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:332:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:332:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:332:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:332:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
--
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:11:
>> drivers/iommu/generic_pt/fmt/../pt_defs.h:85:9: error: assigning to 'typeof (*(__ai_ptr))' (aka 'unsigned long long') from incompatible type 'void'
      85 |         return try_cmpxchg64_release(entryp, &old_entry, table_entry);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4937:2: note: expanded from macro 'try_cmpxchg64_release'
    4937 |         raw_try_cmpxchg64_release(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:295:7: note: expanded from macro 'raw_try_cmpxchg64_release'
     295 |         ___r = raw_cmpxchg64_release((_ptr), ___o, (_new)); \
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:332:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:332:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:332:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:332:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:332:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:332:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
--
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:174:10: note: expanded from macro '_SIG_SET_OP'
     174 |         case 4: set->sig[3] = op(set->sig[3]);                          \
         |                 ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:332:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:175:20: note: expanded from macro '_SIG_SET_OP'
     175 |                 set->sig[2] = op(set->sig[2]);                          \
         |                                  ^        ~
   include/linux/signal.h:186:24: note: expanded from macro '_sig_not'
     186 | #define _sig_not(x)     (~(x))
         |                            ^
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:332:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:175:3: note: expanded from macro '_SIG_SET_OP'
     175 |                 set->sig[2] = op(set->sig[2]);                          \
         |                 ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:332:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:332:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:332:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:332:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:17:
>> drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:202:5: warning: shift count is negative [-Wshift-count-negative]
     202 |                                 GENMASK(PT_MAX_OUTPUT_ADDRESS_LG2 - 1, 0);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:17:
   drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:216:31: warning: shift count is negative [-Wshift-count-negative]
     216 |                 do_map(test, cur_va, addr & GENMASK(63, pgsz), len);
         |                                             ^~~~~~~~~~~~~~~~~
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:17:
   drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:217:35: warning: shift count is negative [-Wshift-count-negative]
     217 |                 check_iova(test, cur_va, addr & GENMASK(63, pgsz), len);
         |                                                 ^~~~~~~~~~~~~~~~~
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:17:
   drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:254:5: warning: shift count is negative [-Wshift-count-negative]
     254 |                                 GENMASK(PT_MAX_OUTPUT_ADDRESS_LG2 - 1, 0);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:17:
   drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:274:31: warning: shift count is negative [-Wshift-count-negative]
     274 |                 do_map(test, cur_va, addr & GENMASK(63, pgsz), max_pgsize);
         |                                             ^~~~~~~~~~~~~~~~~
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:17:
   drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:276:35: warning: shift count is negative [-Wshift-count-negative]
     276 |                 check_iova(test, cur_va, addr & GENMASK(63, pgsz), max_pgsize);
         |                                                 ^~~~~~~~~~~~~~~~~
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   41 warnings and 1 error generated.


vim +85 drivers/iommu/generic_pt/fmt/../pt_defs.h

bbf2b5ad3856c1 Jason Gunthorpe 2024-06-28  68  
bbf2b5ad3856c1 Jason Gunthorpe 2024-06-28  69  /*
bbf2b5ad3856c1 Jason Gunthorpe 2024-06-28  70   * Try to install a new table pointer. The locking methodology requires this to
bbf2b5ad3856c1 Jason Gunthorpe 2024-06-28  71   * be atomic, multiple threads can race to install a pointer, the loosing
bbf2b5ad3856c1 Jason Gunthorpe 2024-06-28  72   * threads will fail the atomic and return false. They should free any memory
bbf2b5ad3856c1 Jason Gunthorpe 2024-06-28  73   * and reparse the table level again.
bbf2b5ad3856c1 Jason Gunthorpe 2024-06-28  74   */
bbf2b5ad3856c1 Jason Gunthorpe 2024-06-28  75  static inline bool pt_table_install64(u64 *entryp, u64 table_entry)
bbf2b5ad3856c1 Jason Gunthorpe 2024-06-28  76  {
bbf2b5ad3856c1 Jason Gunthorpe 2024-06-28  77  	u64 old_entry = 0;
bbf2b5ad3856c1 Jason Gunthorpe 2024-06-28  78  
bbf2b5ad3856c1 Jason Gunthorpe 2024-06-28  79  	/*
bbf2b5ad3856c1 Jason Gunthorpe 2024-06-28  80  	 * Ensure the zero'd table content itself is visible before its PTE can
bbf2b5ad3856c1 Jason Gunthorpe 2024-06-28  81  	 * be, be careful about !SMP
bbf2b5ad3856c1 Jason Gunthorpe 2024-06-28  82  	 */
bbf2b5ad3856c1 Jason Gunthorpe 2024-06-28  83  	if (!IS_ENABLED(CONFIG_SMP))
bbf2b5ad3856c1 Jason Gunthorpe 2024-06-28  84  		dma_wmb();
bbf2b5ad3856c1 Jason Gunthorpe 2024-06-28 @85  	return try_cmpxchg64_release(entryp, &old_entry, table_entry);
bbf2b5ad3856c1 Jason Gunthorpe 2024-06-28  86  }
bbf2b5ad3856c1 Jason Gunthorpe 2024-06-28  87  

:::::: The code at line 85 was first introduced by commit
:::::: bbf2b5ad3856c10151c068c290071d9bb388ea68 genpt: Generic Page Table base API

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
