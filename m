Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91634A92D;
	Sun, 17 Nov 2024 01:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731807575; cv=none; b=skVclNd1s4ZjKKnivVGYY06i+YB74SCIM6z6nRIDttiOogPfjS5JgOGFtM4Nk+olWmnuygZuYcKj0KRWM8/k41dn8OZNgedI4O2yTK9RaVyQL8Ytou9CvsB4jx2tQXQ93F2dyBq7jQ4uuo5nlHIPHulfP0tuMUjojhheSkeAZZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731807575; c=relaxed/simple;
	bh=BEdOQeNAYRmY1nTLzYIXuE80Gqp+rmFNpibzVJP9iZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VTMvQHud4Xcjwn9oyjrf9QdTbIpvC1PuSabfdAUbrH8dObu/PzEjXbdKNryKc+QPgq7ZcnLWWWjWDyutMhzKWK3rgEaw7e0UjUH5tH8q91yQv5fL2iHQD6HyA5txAWIo8XQwa11TzbqeBnP6apx9Mx+r4aYz13eC+yYV1VW9uXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PyWQtcJn; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PyWQtcJn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731807573; x=1763343573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BEdOQeNAYRmY1nTLzYIXuE80Gqp+rmFNpibzVJP9iZQ=;
  b=PyWQtcJnDIDD1XhiRyIY/RKAOsrQA1YoeafZs1Uj44ITD8Q3swimrVRx
   +RlN11uBaGGEXtWrJiaDM0/2G0OgenMXQShVuA2E6A0Q4qgXSjZcRoBDV
   IQxLOnyxI+ItcDwdpo+0+g+XSYyejx8a/gXfksUNvaiRlQdP6j0ctcPCL
   6ko9bfrT/tJszG9CMRHFz6zXuztUy9pJ89ixffujEApVbZTXmOtB2tB+w
   WastNKPMhmU7C1cX65MpGP204BfdWcr1+Roumntu1wjntpB3hkpyl+Jn/
   S2pfOZb/VrGfCzFnkSBNRuQhK4QzFF5VwOJPr9VTrREfqtUkN4Wms4NE9
   w==;
X-CSE-ConnectionGUID: TvGsIgRrTYSJoAZXGNxUQw==
X-CSE-MsgGUID: b3F9YUh2R9Oj46bGYgHjBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="35463180"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="35463180"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 17:39:31 -0800
X-CSE-ConnectionGUID: rKO5WFrRSBOis41a8AYCoA==
X-CSE-MsgGUID: Oh5TG1G9SveF29LLzBpeEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="119741585"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Nov 2024 17:39:29 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCUG6-0001DN-24;
	Sun, 17 Nov 2024 01:39:26 +0000
Date: Sun, 17 Nov 2024 09:38:29 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea Gelmini <andrea.gelmini@gelma.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:pr/739 1/1] fs/bcachefs/acl.c:139:8: error:
 use of undeclared identifier 'PF_MEMALLOC_NORECLAIM'
Message-ID: <202411170906.GCK3OZr6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs pr/739
head:   6b0cc29d15ef1d80120c936e982104c33e757ba2
commit: 47cda59a3c898ef9dc663848b9ce8e138c076aca [1/1] Fix typos
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241117/202411170906.GCK3OZr6-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170906.GCK3OZr6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170906.GCK3OZr6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/acl.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
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
>> fs/bcachefs/acl.c:139:8: error: use of undeclared identifier 'PF_MEMALLOC_NORECLAIM'
     139 |         acl = allocate_dropping_locks(trans, ret,
         |               ^
   fs/bcachefs/btree_iter.h:917:37: note: expanded from macro 'allocate_dropping_locks'
     917 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                            ^
>> fs/bcachefs/acl.c:139:8: error: use of undeclared identifier 'PF_MEMALLOC_NOWARN'
   fs/bcachefs/btree_iter.h:917:59: note: expanded from macro 'allocate_dropping_locks'
     917 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                                                  ^
   fs/bcachefs/acl.c:425:8: error: use of undeclared identifier 'PF_MEMALLOC_NORECLAIM'
     425 |         ret = allocate_dropping_locks_errcode(trans,
         |               ^
   fs/bcachefs/btree_iter.h:907:31: note: expanded from macro 'allocate_dropping_locks_errcode'
     907 |         int _ret = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                      ^
   fs/bcachefs/acl.c:425:8: error: use of undeclared identifier 'PF_MEMALLOC_NOWARN'
   fs/bcachefs/btree_iter.h:907:53: note: expanded from macro 'allocate_dropping_locks_errcode'
     907 |         int _ret = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                                            ^
   4 warnings and 4 errors generated.
--
   In file included from fs/bcachefs/btree_cache.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
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
>> fs/bcachefs/btree_cache.c:832:24: error: use of undeclared identifier 'PF_MEMALLOC_NORECLAIM'; did you mean 'KMALLOC_RECLAIM'?
     832 |         if (memalloc_flags_do(PF_MEMALLOC_NORECLAIM,
         |                               ^~~~~~~~~~~~~~~~~~~~~
         |                               KMALLOC_RECLAIM
   fs/bcachefs/btree_iter.h:899:46: note: expanded from macro 'memalloc_flags_do'
     899 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^
   include/linux/slab.h:584:2: note: 'KMALLOC_RECLAIM' declared here
     584 |         KMALLOC_RECLAIM = KMALLOC_NORMAL,
         |         ^
   4 warnings and 1 error generated.
--
   In file included from fs/bcachefs/btree_key_cache.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
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
>> fs/bcachefs/btree_key_cache.c:149:7: error: use of undeclared identifier 'PF_MEMALLOC_NORECLAIM'
     149 |         ck = allocate_dropping_locks(trans, ret,
         |              ^
   fs/bcachefs/btree_iter.h:917:37: note: expanded from macro 'allocate_dropping_locks'
     917 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                            ^
>> fs/bcachefs/btree_key_cache.c:149:7: error: use of undeclared identifier 'PF_MEMALLOC_NOWARN'
   fs/bcachefs/btree_iter.h:917:59: note: expanded from macro 'allocate_dropping_locks'
     917 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                                                  ^
   fs/bcachefs/btree_key_cache.c:243:26: error: use of undeclared identifier 'PF_MEMALLOC_NORECLAIM'
     243 |                 struct bkey_i *new_k = allocate_dropping_locks(trans, ret,
         |                                        ^
   fs/bcachefs/btree_iter.h:917:37: note: expanded from macro 'allocate_dropping_locks'
     917 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                            ^
   fs/bcachefs/btree_key_cache.c:243:26: error: use of undeclared identifier 'PF_MEMALLOC_NOWARN'
   fs/bcachefs/btree_iter.h:917:59: note: expanded from macro 'allocate_dropping_locks'
     917 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                                                  ^
   4 warnings and 4 errors generated.
--
   In file included from fs/bcachefs/ec.c:5:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
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
>> fs/bcachefs/ec.c:952:9: error: use of undeclared identifier 'PF_MEMALLOC_NORECLAIM'
     952 |         return allocate_dropping_locks_errcode(trans,
         |                ^
   fs/bcachefs/btree_iter.h:907:31: note: expanded from macro 'allocate_dropping_locks_errcode'
     907 |         int _ret = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                      ^
>> fs/bcachefs/ec.c:952:9: error: use of undeclared identifier 'PF_MEMALLOC_NOWARN'
   fs/bcachefs/btree_iter.h:907:53: note: expanded from macro 'allocate_dropping_locks_errcode'
     907 |         int _ret = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                                            ^
   4 warnings and 2 errors generated.


vim +/PF_MEMALLOC_NORECLAIM +139 fs/bcachefs/acl.c

1c6fdbd8f2465dd Kent Overstreet 2017-03-16   87  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   88  /*
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   89   * Convert from filesystem to in-memory representation.
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   90   */
5ff10c0a04c4217 Kent Overstreet 2023-05-28   91  static struct posix_acl *bch2_acl_from_disk(struct btree_trans *trans,
5ff10c0a04c4217 Kent Overstreet 2023-05-28   92  					    const void *value, size_t size)
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   93  {
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   94  	const void *p, *end = value + size;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   95  	struct posix_acl *acl;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   96  	struct posix_acl_entry *out;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   97  	unsigned count = 0;
5ff10c0a04c4217 Kent Overstreet 2023-05-28   98  	int ret;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   99  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  100  	if (!value)
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  101  		return NULL;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  102  	if (size < sizeof(bch_acl_header))
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  103  		goto invalid;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  104  	if (((bch_acl_header *)value)->a_version !=
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  105  	    cpu_to_le32(BCH_ACL_VERSION))
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  106  		goto invalid;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  107  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  108  	p = value + sizeof(bch_acl_header);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  109  	while (p < end) {
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  110  		const bch_acl_entry *entry = p;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  111  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  112  		if (p + sizeof(bch_acl_entry_short) > end)
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  113  			goto invalid;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  114  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  115  		switch (le16_to_cpu(entry->e_tag)) {
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  116  		case ACL_USER_OBJ:
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  117  		case ACL_GROUP_OBJ:
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  118  		case ACL_MASK:
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  119  		case ACL_OTHER:
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  120  			p += sizeof(bch_acl_entry_short);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  121  			break;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  122  		case ACL_USER:
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  123  		case ACL_GROUP:
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  124  			p += sizeof(bch_acl_entry);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  125  			break;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  126  		default:
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  127  			goto invalid;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  128  		}
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  129  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  130  		count++;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  131  	}
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  132  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  133  	if (p > end)
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  134  		goto invalid;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  135  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  136  	if (!count)
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  137  		return NULL;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  138  
5ff10c0a04c4217 Kent Overstreet 2023-05-28 @139  	acl = allocate_dropping_locks(trans, ret,
47cda59a3c898ef Andrea Gelmini  2024-11-12  140  			posix_acl_alloc(count, GFP_KERNEL));
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  141  	if (!acl)
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  142  		return ERR_PTR(-ENOMEM);
5ff10c0a04c4217 Kent Overstreet 2023-05-28  143  	if (ret) {
5ff10c0a04c4217 Kent Overstreet 2023-05-28  144  		kfree(acl);
5ff10c0a04c4217 Kent Overstreet 2023-05-28  145  		return ERR_PTR(ret);
5ff10c0a04c4217 Kent Overstreet 2023-05-28  146  	}
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  147  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  148  	out = acl->a_entries;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  149  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  150  	p = value + sizeof(bch_acl_header);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  151  	while (p < end) {
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  152  		const bch_acl_entry *in = p;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  153  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  154  		out->e_tag  = le16_to_cpu(in->e_tag);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  155  		out->e_perm = le16_to_cpu(in->e_perm);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  156  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  157  		switch (out->e_tag) {
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  158  		case ACL_USER_OBJ:
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  159  		case ACL_GROUP_OBJ:
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  160  		case ACL_MASK:
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  161  		case ACL_OTHER:
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  162  			p += sizeof(bch_acl_entry_short);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  163  			break;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  164  		case ACL_USER:
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  165  			out->e_uid = make_kuid(&init_user_ns,
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  166  					       le32_to_cpu(in->e_id));
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  167  			p += sizeof(bch_acl_entry);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  168  			break;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  169  		case ACL_GROUP:
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  170  			out->e_gid = make_kgid(&init_user_ns,
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  171  					       le32_to_cpu(in->e_id));
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  172  			p += sizeof(bch_acl_entry);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  173  			break;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  174  		}
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  175  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  176  		out++;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  177  	}
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  178  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  179  	BUG_ON(out != acl->a_entries + acl->a_count);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  180  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  181  	return acl;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  182  invalid:
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  183  	pr_err("invalid acl entry");
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  184  	return ERR_PTR(-EINVAL);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  185  }
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  186  

:::::: The code at line 139 was first introduced by commit
:::::: 5ff10c0a04c4217b24997d9b127c50602d717ab3 bcachefs: Convert acl.c to allocate_dropping_locks()

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
