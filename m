Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C1716FF3B;
	Sat,  2 Nov 2024 10:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730542592; cv=none; b=Ghmme0l/bmqHxBF3K8ZMoeNRQZy08ljecMaf+mM2SnHvtlFKtR+sKb/3/cYmRLT8S2TlOvuTm8dQKuybpx/ocB7DXPoEfrp7yFzrR1lVhf1F2zKYVEZ5uwgvSW/ENs25oTiV13dKwpEwyIubzNdnFG4mo+E1xHu9+A/BZwxKBRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730542592; c=relaxed/simple;
	bh=NcL/BHhK3CKv5Q9Jh6CWdylKR+TqP2qeP2vrpHDO1g0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TJoKXJrKXxqmuQCN+yOuWD2NKK50ybDFPI8ymip94eWaoRc9FHVez7/LAhRL6dX3tuLhDE5Q0f6COXDBioiZLXLO4pVMNfAvfE9UQEcO7LVhJjf7trcpZfHrVVQHHuta/k4IqsCeCCSfZNargknqBN1KFnfzZG3VYoxdhlaaZy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hslIb5Ir; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hslIb5Ir"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730542590; x=1762078590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NcL/BHhK3CKv5Q9Jh6CWdylKR+TqP2qeP2vrpHDO1g0=;
  b=hslIb5Irot7RXA3AYh96Ef4SqfHz/xsilyXfAfnR5PGl70JiZeJAbTwn
   hZ3+iZY3INeebMe08iP7lunwuUgvlxa4qOuyTUVQ2Ny9uCJBWAjshSSZw
   RNzJZwBDowzGih7HKJvdaoEu4tLrdqpxNYnkDn3f3WFII9Lj9i4vD+pVX
   8B2nptR7jrnaErYxb+0JIQDzwJUN++Ra6fMkkRmJroRczJpIVSd0xaNuX
   SwFaT3J4mNcKMYtTEPEuO1VpkO7gtjXlpTp42P56RoDzdeNxXyqGV9cxO
   YfOFnFri41+Lr6UUD4Tbh8cjyqaZCR8mLl56Cpx1R64khJeVNESTtER0M
   w==;
X-CSE-ConnectionGUID: g78mTYMqSaqLSE9iI041Qw==
X-CSE-MsgGUID: x1Tz74KOT8y27bCZizaEFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="33144424"
X-IronPort-AV: E=Sophos;i="6.11,252,1725346800"; 
   d="scan'208";a="33144424"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 03:16:29 -0700
X-CSE-ConnectionGUID: DGk9crD7Q6qaZAaIzpoukw==
X-CSE-MsgGUID: B+LBAOZtR5md8+WwE8D9PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,252,1725346800"; 
   d="scan'208";a="83308159"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Nov 2024 03:16:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7BBC-000ijJ-06;
	Sat, 02 Nov 2024 10:16:26 +0000
Date: Sat, 2 Nov 2024 18:16:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 4/4] ext4: Do not fallback to buffered-io for DIO
 atomic write
Message-ID: <202411021812.J6p7IRRP-lkp@intel.com>
References: <78fb5c40dde4847dc32af09e668a6f81fa251137.1730437365.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78fb5c40dde4847dc32af09e668a6f81fa251137.1730437365.git.ritesh.list@gmail.com>

Hi Ritesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on tytso-ext4/dev]
[also build test ERROR on linus/master v6.12-rc5 next-20241101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ritesh-Harjani-IBM/ext4-Add-statx-support-for-atomic-writes/20241101-145608
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/78fb5c40dde4847dc32af09e668a6f81fa251137.1730437365.git.ritesh.list%40gmail.com
patch subject: [PATCH v4 4/4] ext4: Do not fallback to buffered-io for DIO atomic write
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241102/202411021812.J6p7IRRP-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411021812.J6p7IRRP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411021812.J6p7IRRP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/ext4/inode.c:26:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/ext4/inode.c:3455:14: error: use of undeclared identifier 'IOMAP_ATOMIC'
    3455 |         if (flags & IOMAP_ATOMIC)
         |                     ^
   4 warnings and 1 error generated.


vim +/IOMAP_ATOMIC +3455 fs/ext4/inode.c

  3446	
  3447	static inline bool ext4_want_directio_fallback(unsigned flags, ssize_t written)
  3448	{
  3449		/* must be a directio to fall back to buffered */
  3450		if ((flags & (IOMAP_WRITE | IOMAP_DIRECT)) !=
  3451			    (IOMAP_WRITE | IOMAP_DIRECT))
  3452			return false;
  3453	
  3454		/* atomic writes are all-or-nothing */
> 3455		if (flags & IOMAP_ATOMIC)
  3456			return false;
  3457	
  3458		/* can only try again if we wrote nothing */
  3459		return written == 0;
  3460	}
  3461	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
