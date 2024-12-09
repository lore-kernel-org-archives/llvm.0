Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC41156F41;
	Mon,  9 Dec 2024 04:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718133; cv=none; b=CtYqRukztCDyqMWn677s65gUXeigWXnr5eaO/FgJpy6PgEieOo4TpxWkSY2DA9aDLzoPt3B2l+GhxJRcE2NqKtWLY9kD9cncq5FEGptQ4SvIt/SW1m7EsCb0+gcP6Hn9GRRrnPP5N+0A7fQ9D5+q81sFwfA+GWf3vccuf7w7hG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718133; c=relaxed/simple;
	bh=fioZyazK2wMAHB48EwQV0DGRd/URREtjodnsulS02Ck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=urX/4yMWg3Bl+GDcR3KaMWSLl0scFpTmFkvyg9FuBtqFxgvPgDece8IRCkDsuoKMRj3XyAe8czAqxXdI4qZnIAP0At6+D9oAYKEYBXNVSBvKdIAJFWcxyLabc4u1tHcpAaVxDn2bJVZp/Kj8w9yKMuJHkuwlrfL1hpG3vkSS2UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q5oakBH2; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q5oakBH2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718132; x=1765254132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fioZyazK2wMAHB48EwQV0DGRd/URREtjodnsulS02Ck=;
  b=Q5oakBH252nNyMQMzXcqXV6130rd9VW/J3KZY3VyZCNDREd7mcRHrCCl
   6UPu9bHZV5ZjIuYV4mF7tqdimcTuF9sgZHN7JU2iXWEr+8Xc343cEqswz
   8f+XUygYioZzcyd4PTZ5QL+Kpm0gRi1Xi7uuvUQYNGUgDdLSFKguiN/xo
   2SU93zIsyPi3m/RbOnqbqT9KB8hINiWQKba63/1BbE59dXjnCsLul0Chn
   er9eQjYThXTTYOJAQiOMjEDi5bDaqFKYdyyIvvyMbGyRRTJyOxtgHwXD8
   L82MxBRNeI7apVBsEb6LG+SHTH3b6+XsMP3k0Y/iQBpMqDCsaaaCnt11E
   A==;
X-CSE-ConnectionGUID: PQENF2CHTsu5e5K6dLhIng==
X-CSE-MsgGUID: M6Hf7FzfSASR8GEf/rIcHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45379956"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="45379956"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:22:11 -0800
X-CSE-ConnectionGUID: ZbVyVuvASc+IT0gpRm4UFg==
X-CSE-MsgGUID: mKcHchFPS2aePwt8c8dgRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="99005793"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Dec 2024 20:22:09 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVHb-0003q5-0H;
	Mon, 09 Dec 2024 04:22:07 +0000
Date: Mon, 9 Dec 2024 12:21:55 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 166/172] include/linux/memfd.h:27:5: warning:
 no previous prototype for function 'memfd_check_seals_mmap'
Message-ID: <202412072101.6xUaltAj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   6e165f54437931f329d09dca6c19d99af08a36e1
commit: 6b72648c4e2b94fc7df65cab28a59b185a37c997 [166/172] mm: perform all memfd seal checks in a single place
config: arm-randconfig-004-20241207 (https://download.01.org/0day-ci/archive/20241207/202412072101.6xUaltAj-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412072101.6xUaltAj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412072101.6xUaltAj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/fcntl.c:8:
   In file included from include/linux/syscalls.h:94:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2287:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/fcntl.c:26:
>> include/linux/memfd.h:27:5: warning: no previous prototype for function 'memfd_check_seals_mmap' [-Wmissing-prototypes]
      27 | int memfd_check_seals_mmap(struct file *file, unsigned long *vm_flags)
         |     ^
   include/linux/memfd.h:27:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      27 | int memfd_check_seals_mmap(struct file *file, unsigned long *vm_flags)
         | ^
         | static 
   2 warnings generated.


vim +/memfd_check_seals_mmap +27 include/linux/memfd.h

     6	
     7	#ifdef CONFIG_MEMFD_CREATE
     8	extern long memfd_fcntl(struct file *file, unsigned int cmd, unsigned int arg);
     9	struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx);
    10	/*
    11	 * Check for any existing seals on mmap, return an error if access is denied due
    12	 * to sealing, or 0 otherwise.
    13	 *
    14	 * We also update VMA flags if appropriate by manipulating the VMA flags pointed
    15	 * to by vm_flags_ptr.
    16	 */
    17	int memfd_check_seals_mmap(struct file *file, unsigned long *vm_flags_ptr);
    18	#else
    19	static inline long memfd_fcntl(struct file *f, unsigned int c, unsigned int a)
    20	{
    21		return -EINVAL;
    22	}
    23	static inline struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
    24	{
    25		return ERR_PTR(-EINVAL);
    26	}
  > 27	int memfd_check_seals_mmap(struct file *file, unsigned long *vm_flags)
    28	{
    29		return 0;
    30	}
    31	#endif
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
