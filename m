Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0C0158DA3;
	Fri, 22 Nov 2024 19:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732304290; cv=none; b=f6+gqfFWZ4JuPTgTHuN9hCUrjJWblPNKhAjYWFv5Kj+lP3SJSIKFuTF5IhMZ1uZdT8JAnO1BpGhql3895jTX8MV7YBQSv8jPv3wEY+aFuxrzsqbm0DRRLOlJ+s2hf2VxRIEv0QoJPHPPbvXxpE+TGajyx25SDR7L9FtL+jF6Oo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732304290; c=relaxed/simple;
	bh=ibL2e7E9hR59pIsSHWfw93yujCD0mKk4Gs097TRUJ+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E2h6ALeTIid4HB7ykA6eQx5jhpem67492Mx1/Ag87wStlQMIeeij8MiBYWEmgqdfdsjGdWVInDUMYF542QzlhUSuKog8g89xPO6ZkEVCN2KCDcVoRUjeWil2EDpfsLbfCPKPL41T/vVCcFyn/RthNrxDH4rQASHPUfIiEHiK3rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ges8kgyF; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ges8kgyF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732304289; x=1763840289;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ibL2e7E9hR59pIsSHWfw93yujCD0mKk4Gs097TRUJ+o=;
  b=ges8kgyFxaXgJ3nH5bpfJLD26iBU2BekC9RaIsmUwRquBHHynUdEvPFx
   aRPFoku8ndsFO+x0NUd3bel9i+8TQAaNAaY7SiyWaC8fmgiFajPlX9BkJ
   Fq1mQvxDNdOu5saSkojQDNRh9tf8kHU3nptKJ8UHPluIjTHQJC13STNbu
   vxnByXEnYYVX6Rgv03zcuFVn4G8Kjki/1q+IZSFzx2zvBiaJXExo2Abbh
   C8zrg64r/B82qk1gJamF5hSOGbnlBLENDlMjbYSUSyJE71QzdVVjmaRHZ
   psXsORSGmroGR+7MyefJWuuYS13hUBuJvjecWBI+otRELtMTLs69xEYa7
   w==;
X-CSE-ConnectionGUID: UW/PftQrSo2TYozQM7l47w==
X-CSE-MsgGUID: syR4iTL6QOSXHoKHTkjIJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="43118446"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="43118446"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 11:38:08 -0800
X-CSE-ConnectionGUID: Oe9wIpEfTfCdxaHiXMZpSQ==
X-CSE-MsgGUID: H5PCyu/USiuBaq8VtDEBoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="91088483"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Nov 2024 11:38:07 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEZTf-0004Ah-2P;
	Fri, 22 Nov 2024 19:38:03 +0000
Date: Sat, 23 Nov 2024 03:37:24 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/3] mm: convert mm_lock_seq to a proper seqcount
Message-ID: <202411230304.3VXv880b-lkp@intel.com>
References: <20241121162826.987947-2-surenb@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241121162826.987947-2-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build errors:

[auto build test ERROR on 43fb83c17ba2d63dfb798f0be7453ed55ca3f9c2]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/mm-convert-mm_lock_seq-to-a-proper-seqcount/20241122-003050
base:   43fb83c17ba2d63dfb798f0be7453ed55ca3f9c2
patch link:    https://lore.kernel.org/r/20241121162826.987947-2-surenb%40google.com
patch subject: [PATCH v2 2/3] mm: convert mm_lock_seq to a proper seqcount
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241123/202411230304.3VXv880b-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230304.3VXv880b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411230304.3VXv880b-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/char/tpm/tpm-chip.c:24:
   In file included from include/linux/tpm_eventlog.h:6:
   In file included from include/linux/tpm.h:24:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:16:
>> include/linux/mmap_lock.h:140:30: error: no member named 'mm_lock_seq' in 'struct mm_struct'
     140 |         ASSERT_EXCLUSIVE_WRITER(mm->mm_lock_seq);
         |                                 ~~  ^
   include/linux/kcsan-checks.h:371:25: note: expanded from macro 'ASSERT_EXCLUSIVE_WRITER'
     371 |         __kcsan_check_access(&(var), sizeof(var), KCSAN_ACCESS_ASSERT)
         |                                ^~~
   In file included from drivers/char/tpm/tpm-chip.c:24:
   In file included from include/linux/tpm_eventlog.h:6:
   In file included from include/linux/tpm.h:24:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:16:
>> include/linux/mmap_lock.h:140:30: error: no member named 'mm_lock_seq' in 'struct mm_struct'
     140 |         ASSERT_EXCLUSIVE_WRITER(mm->mm_lock_seq);
         |                                 ~~  ^
   include/linux/kcsan-checks.h:371:38: note: expanded from macro 'ASSERT_EXCLUSIVE_WRITER'
     371 |         __kcsan_check_access(&(var), sizeof(var), KCSAN_ACCESS_ASSERT)
         |                                             ^~~
   In file included from drivers/char/tpm/tpm-chip.c:24:
   In file included from include/linux/tpm_eventlog.h:6:
   In file included from include/linux/tpm.h:24:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2225:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/char/tpm/tpm-chip.c:24:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
     167 |         int mapping_size;
         |             ^
   2 warnings and 2 errors generated.
--
   In file included from drivers/char/tpm/tpm-buf.c:8:
   In file included from include/linux/tpm.h:24:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:16:
>> include/linux/mmap_lock.h:140:30: error: no member named 'mm_lock_seq' in 'struct mm_struct'
     140 |         ASSERT_EXCLUSIVE_WRITER(mm->mm_lock_seq);
         |                                 ~~  ^
   include/linux/kcsan-checks.h:371:25: note: expanded from macro 'ASSERT_EXCLUSIVE_WRITER'
     371 |         __kcsan_check_access(&(var), sizeof(var), KCSAN_ACCESS_ASSERT)
         |                                ^~~
   In file included from drivers/char/tpm/tpm-buf.c:8:
   In file included from include/linux/tpm.h:24:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:16:
>> include/linux/mmap_lock.h:140:30: error: no member named 'mm_lock_seq' in 'struct mm_struct'
     140 |         ASSERT_EXCLUSIVE_WRITER(mm->mm_lock_seq);
         |                                 ~~  ^
   include/linux/kcsan-checks.h:371:38: note: expanded from macro 'ASSERT_EXCLUSIVE_WRITER'
     371 |         __kcsan_check_access(&(var), sizeof(var), KCSAN_ACCESS_ASSERT)
         |                                             ^~~
   In file included from drivers/char/tpm/tpm-buf.c:8:
   In file included from include/linux/tpm.h:24:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2225:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning and 2 errors generated.
--
   In file included from drivers/char/tpm/tpm_tis_spi_main.c:32:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:16:
>> include/linux/mmap_lock.h:140:30: error: no member named 'mm_lock_seq' in 'struct mm_struct'
     140 |         ASSERT_EXCLUSIVE_WRITER(mm->mm_lock_seq);
         |                                 ~~  ^
   include/linux/kcsan-checks.h:371:25: note: expanded from macro 'ASSERT_EXCLUSIVE_WRITER'
     371 |         __kcsan_check_access(&(var), sizeof(var), KCSAN_ACCESS_ASSERT)
         |                                ^~~
   In file included from drivers/char/tpm/tpm_tis_spi_main.c:32:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:16:
>> include/linux/mmap_lock.h:140:30: error: no member named 'mm_lock_seq' in 'struct mm_struct'
     140 |         ASSERT_EXCLUSIVE_WRITER(mm->mm_lock_seq);
         |                                 ~~  ^
   include/linux/kcsan-checks.h:371:38: note: expanded from macro 'ASSERT_EXCLUSIVE_WRITER'
     371 |         __kcsan_check_access(&(var), sizeof(var), KCSAN_ACCESS_ASSERT)
         |                                             ^~~
   In file included from drivers/char/tpm/tpm_tis_spi_main.c:32:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1132:
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
   In file included from drivers/char/tpm/tpm_tis_spi_main.c:32:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1132:
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
   In file included from drivers/char/tpm/tpm_tis_spi_main.c:32:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1132:
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
   In file included from drivers/char/tpm/tpm_tis_spi_main.c:32:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1132:
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
   In file included from drivers/char/tpm/tpm_tis_spi_main.c:32:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1132:
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
   In file included from drivers/char/tpm/tpm_tis_spi_main.c:32:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1132:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/char/tpm/tpm_tis_spi_main.c:32:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1132:
   In file included from include/linux/huge_mm.h:8:


vim +140 include/linux/mmap_lock.h

   128	
   129	/*
   130	 * Drop all currently-held per-VMA locks.
   131	 * This is called from the mmap_lock implementation directly before releasing
   132	 * a write-locked mmap_lock (or downgrading it to read-locked).
   133	 * This should normally NOT be called manually from other places.
   134	 * If you want to call this manually anyway, keep in mind that this will release
   135	 * *all* VMA write locks, including ones from further up the stack.
   136	 */
   137	static inline void vma_end_write_all(struct mm_struct *mm)
   138	{
   139		mmap_assert_write_locked(mm);
 > 140		ASSERT_EXCLUSIVE_WRITER(mm->mm_lock_seq);
   141		mm_lock_seqcount_end(mm);
   142	}
   143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
