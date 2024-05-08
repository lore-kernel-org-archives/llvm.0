Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4809476;
	Wed,  8 May 2024 08:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715158699; cv=none; b=oO/4/1XuRz068Oj7fxScb9K+V1p3AtIYn2XANbkOi4HLKI0zsDDu6y50n89Fzg0bfjNEDe+M/27HOV/YzOGTRsgF5lG8fKRmoLhA/mPybZN3okUxN51qfYERES7Xvjt7ZHqe9ddT9D55YVimRYR/nJVhyQpsWULg5XbxamuqMR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715158699; c=relaxed/simple;
	bh=FAL6TpmLghsL+pNKj3y6Xs67lv3hH64ffYCsHRGBkng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p2Ey/adgjbI1ESm/j20oq8g3E3qpCro/Mz8F65qx10T45665OgERLRUBLcY1CjlV35Q3zNgxzysuk+x94Vd7VZ0ODOkXdidG1ZSsm7CABgNsutocWovVgr3z8O0IP2OCZXqDKpU+f1BisMpC3eAExGjio1ErN0XG5EkgXL536cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nubkWa0C; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nubkWa0C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715158697; x=1746694697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FAL6TpmLghsL+pNKj3y6Xs67lv3hH64ffYCsHRGBkng=;
  b=nubkWa0CJrF+xNVWbazdFRqN0Ceiw2BzcyhFulq3FkiRrIptwUBjTZC9
   3Tot4fDil4Lxr1l2/CQgjQ/qIsfxQ9mx7+mlceQ9cRuJafb7WCxBJmD+4
   jd/OQpontBzFfL9zRW6LgvSgLzL1eM5kHECVpzQrsmkdsQiXqA69/Ozlo
   dQ57rgZqNllEIuiqmEmIRvu6UdwUSdPQSgTdjqO+PTjYVQGVfEcscOS82
   FdAm3/7WBeopxcgXGnx2JBtaPbZ4kcA+wXmNhqMKQ8iMMzuZD4++PTK6W
   hnlgL353HkJkG7ws8vtoCYxZmm01quo3nH9P1mGeUfZ0qXMOuMXZINdIp
   Q==;
X-CSE-ConnectionGUID: +V8Wlab7SECu3Q7ELS29aA==
X-CSE-MsgGUID: HLXbLZamS4iuLfjWUQUf0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="10857264"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="10857264"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 01:58:17 -0700
X-CSE-ConnectionGUID: SVxy8aSAQcK3d+rNinB6bQ==
X-CSE-MsgGUID: Bzj0hahpROiR3fht4XIhyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="29347238"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 May 2024 01:58:16 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4d7s-0003BE-32;
	Wed, 08 May 2024 08:58:12 +0000
Date: Wed, 8 May 2024 16:57:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 167/167] fs/bcachefs/bkey_sort.c:170:28:
 warning: unused variable 'f'
Message-ID: <202405081651.dAvosJcU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   820055ea04424d9c5d0d58322888ee46fefb55bc
commit: 820055ea04424d9c5d0d58322888ee46fefb55bc [167/167] bcachefs: whiteout fix
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240508/202405081651.dAvosJcU-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 0ab4458df0688955620b72cc2c72a32dffad3615)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405081651.dAvosJcU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405081651.dAvosJcU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/bkey_sort.c:2:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/bcachefs/bkey_sort.c:170:28: warning: unused variable 'f' [-Wunused-variable]
     170 |         const struct bkey_format *f = &iter->b->format;
         |                                   ^
   6 warnings generated.


vim +/f +170 fs/bcachefs/bkey_sort.c

820055ea04424d Kent Overstreet 2024-05-08  167  
820055ea04424d Kent Overstreet 2024-05-08  168  unsigned bch2_sort_keys_keep_unwritten_whiteouts(struct bkey_packed *dst, struct sort_iter *iter)
5b8a9227f8a4ac Kent Overstreet 2018-11-27  169  {
5b8a9227f8a4ac Kent Overstreet 2018-11-27 @170  	const struct bkey_format *f = &iter->b->format;
5b8a9227f8a4ac Kent Overstreet 2018-11-27  171  	struct bkey_packed *in, *next, *out = dst;
5b8a9227f8a4ac Kent Overstreet 2018-11-27  172  
820055ea04424d Kent Overstreet 2024-05-08  173  	sort_iter_sort(iter, keep_unwritten_whiteouts_cmp);
5b8a9227f8a4ac Kent Overstreet 2018-11-27  174  
820055ea04424d Kent Overstreet 2024-05-08  175  	while ((in = sort_iter_next(iter, keep_unwritten_whiteouts_cmp))) {
820055ea04424d Kent Overstreet 2024-05-08  176  		if (bkey_deleted(in) && in < unwritten_whiteouts_start(iter->b))
820055ea04424d Kent Overstreet 2024-05-08  177  			continue;
a965ef4986243b Kent Overstreet 2020-01-15  178  
820055ea04424d Kent Overstreet 2024-05-08  179  		if ((next = sort_iter_peek(iter)) &&
820055ea04424d Kent Overstreet 2024-05-08  180  		    !bch2_bkey_cmp_packed_inlined(iter->b, in, next))
5b8a9227f8a4ac Kent Overstreet 2018-11-27  181  			continue;
5b8a9227f8a4ac Kent Overstreet 2018-11-27  182  
820055ea04424d Kent Overstreet 2024-05-08  183  		bkey_p_copy(out, in);
820055ea04424d Kent Overstreet 2024-05-08  184  		out = bkey_p_next(out);
5b8a9227f8a4ac Kent Overstreet 2018-11-27  185  	}
5b8a9227f8a4ac Kent Overstreet 2018-11-27  186  
820055ea04424d Kent Overstreet 2024-05-08  187  	return (u64 *) out - (u64 *) dst;
5b8a9227f8a4ac Kent Overstreet 2018-11-27  188  }
820055ea04424d Kent Overstreet 2024-05-08  189  

:::::: The code at line 170 was first introduced by commit
:::::: 5b8a9227f8a4acd9652d6d89a608fbf4c39c6f44 bcachefs: Split out bkey_sort.c

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
