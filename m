Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011503FB01;
	Thu, 28 Mar 2024 07:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711609987; cv=none; b=B93HuLVYtETWYWdHs7m8uwLXP4xfgpJr54L1qdwvpUUC4B0Xp3M2GcrlfNM0LfNoWBllf1pHGAlbmC8dTtEavqbfCYGaTs77IwibF6nLnJCwD9+ISeR77ay+GjapJkSV8eifsnGz7FO9Q/zgfoYMjn/+8EFLtD1jKCUeTG17IEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711609987; c=relaxed/simple;
	bh=uBoOPYRuzAYB+Xhj3UlGP0IFbArzBr8Czza6+Gec6O0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kWPbxYEEI6pwc+nZ+5YNnIR9dEm7UuNb3L3N5LM0yewOfTJ5JlPX57Z1A+4UNSvWiI3T1pEQJn/u0UierEDsCNTk2uFDYgCk0bEoKvDH1ci2ruqAbc3sms7uOY0oIaFpl2OXBegt+R6Jh8vX212JYY5GfG3cMqUSORB5rfGsWT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qm7+lM0F; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qm7+lM0F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711609983; x=1743145983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uBoOPYRuzAYB+Xhj3UlGP0IFbArzBr8Czza6+Gec6O0=;
  b=Qm7+lM0FGQwC0yyWYH51rKmOSjXRCga5v2YfH9Dc/LG+tjwB7f63fJRN
   Csd6SxilnieIL5w/FLrmqo327vutIEZeSNRIcN8xNMLYLMVcIq7arSGMq
   5AqxFVC3Oml6iNfFGcZly8DYvCtPE26uLgLOZvpYqEUMctSra/AwS5vp9
   lfKzI0UL4rMiPGb/dx5RmzF/DVjaKbpqI64xMbjRL9+ewlYD4XJJj6tr4
   WiI+AAZfZjVdFGp7MHbtGtXY+iZdIWXH2UJn/uOyyikY9caySkUUZKcPh
   qPN5r+VydBMLTv5p8Bg4D0vRXMrBmCA0wmcarRO+V/dM2+0urIWOIvqEZ
   Q==;
X-CSE-ConnectionGUID: Yn4C42JZQbW5Xx+jh5KWcw==
X-CSE-MsgGUID: cL7cETfjTsOnOE7nw0oXOQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6576392"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="6576392"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 00:12:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="39679380"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Mar 2024 00:12:56 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpjwU-0001tq-1h;
	Thu, 28 Mar 2024 07:12:54 +0000
Date: Thu, 28 Mar 2024 15:12:21 +0800
From: kernel test robot <lkp@intel.com>
To: KONDO =?utf-8?B?S0FaVU1BKOi/keiXpOOAgOWSjOecnyk=?= <kazuma-kondo@nec.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [ardb:x86-efi-peheader-backport-for-v5.15 53/76]
 drivers/firmware/efi/libstub/randomalloc.c:120:21: warning: comparison of
 distinct pointer types ('typeof (md->phys_addr) *' (aka 'unsigned long long
 *') and 'typeof (alloc_min) *' (aka 'unsigned long *'))
Message-ID: <202403281516.fs6dciRP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-peheader-backport-for-v5.15
head:   3ba33165646e7e13eb8dfe32ecce281deea942c7
commit: b176142f52c9b4632281b6a89c221c4ff0b72409 [53/76] efi/libstub: fix efi_random_alloc() to allocate memory at alloc_min or higher address
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240328/202403281516.fs6dciRP-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240328/202403281516.fs6dciRP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403281516.fs6dciRP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/firmware/efi/libstub/randomalloc.c:6:
   In file included from include/linux/efi.h:20:
   In file included from include/linux/rtc.h:17:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:1608:
   include/linux/vmstat.h:450:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     450 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/firmware/efi/libstub/randomalloc.c:120:21: warning: comparison of distinct pointer types ('typeof (md->phys_addr) *' (aka 'unsigned long long *') and 'typeof (alloc_min) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
     120 |                 target = round_up(max(md->phys_addr, alloc_min), align) + target_slot * align;
         |                          ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
      52 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                                   ^
   include/linux/math.h:24:28: note: expanded from macro 'round_up'
      24 | #define round_up(x, y) ((((x)-1) | __round_mask(x, y))+1)
         |                            ^
>> drivers/firmware/efi/libstub/randomalloc.c:120:21: warning: comparison of distinct pointer types ('typeof (md->phys_addr) *' (aka 'unsigned long long *') and 'typeof (alloc_min) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
     120 |                 target = round_up(max(md->phys_addr, alloc_min), align) + target_slot * align;
         |                          ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
      52 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                                   ^
   include/linux/math.h:24:49: note: expanded from macro 'round_up'
      24 | #define round_up(x, y) ((((x)-1) | __round_mask(x, y))+1)
         |                                    ~~~~~~~~~~~~~^~~~~
   include/linux/math.h:14:41: note: expanded from macro '__round_mask'
      14 | #define __round_mask(x, y) ((__typeof__(x))((y)-1))
         |                                         ^
   3 warnings generated.


vim +120 drivers/firmware/efi/libstub/randomalloc.c

    53	
    54	efi_status_t efi_random_alloc(unsigned long size,
    55				      unsigned long align,
    56				      unsigned long *addr,
    57				      unsigned long random_seed,
    58				      int memory_type,
    59				      unsigned long alloc_min,
    60				      unsigned long alloc_max)
    61	{
    62		unsigned long map_size, desc_size, total_slots = 0, target_slot;
    63		unsigned long buff_size;
    64		efi_status_t status;
    65		efi_memory_desc_t *memory_map;
    66		int map_offset;
    67		struct efi_boot_memmap map;
    68	
    69		map.map =	&memory_map;
    70		map.map_size =	&map_size;
    71		map.desc_size =	&desc_size;
    72		map.desc_ver =	NULL;
    73		map.key_ptr =	NULL;
    74		map.buff_size =	&buff_size;
    75	
    76		status = efi_get_memory_map(&map);
    77		if (status != EFI_SUCCESS)
    78			return status;
    79	
    80		if (align < EFI_ALLOC_ALIGN)
    81			align = EFI_ALLOC_ALIGN;
    82	
    83		size = round_up(size, EFI_ALLOC_ALIGN);
    84	
    85		/* count the suitable slots in each memory map entry */
    86		for (map_offset = 0; map_offset < map_size; map_offset += desc_size) {
    87			efi_memory_desc_t *md = (void *)memory_map + map_offset;
    88			unsigned long slots;
    89	
    90			slots = get_entry_num_slots(md, size, ilog2(align), alloc_min,
    91						    alloc_max);
    92			MD_NUM_SLOTS(md) = slots;
    93			total_slots += slots;
    94		}
    95	
    96		/* find a random number between 0 and total_slots */
    97		target_slot = (total_slots * (u64)(random_seed & U32_MAX)) >> 32;
    98	
    99		/*
   100		 * target_slot is now a value in the range [0, total_slots), and so
   101		 * it corresponds with exactly one of the suitable slots we recorded
   102		 * when iterating over the memory map the first time around.
   103		 *
   104		 * So iterate over the memory map again, subtracting the number of
   105		 * slots of each entry at each iteration, until we have found the entry
   106		 * that covers our chosen slot. Use the residual value of target_slot
   107		 * to calculate the randomly chosen address, and allocate it directly
   108		 * using EFI_ALLOCATE_ADDRESS.
   109		 */
   110		for (map_offset = 0; map_offset < map_size; map_offset += desc_size) {
   111			efi_memory_desc_t *md = (void *)memory_map + map_offset;
   112			efi_physical_addr_t target;
   113			unsigned long pages;
   114	
   115			if (target_slot >= MD_NUM_SLOTS(md)) {
   116				target_slot -= MD_NUM_SLOTS(md);
   117				continue;
   118			}
   119	
 > 120			target = round_up(max(md->phys_addr, alloc_min), align) + target_slot * align;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
