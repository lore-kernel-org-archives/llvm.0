Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A153A9626;
	Tue, 19 May 2026 10:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779186138; cv=none; b=SnA0Tk3yWb6PEORsP+G4uuaw0bUJRlaqQCQ0+piQH7nYWyypvApp2lVWh3CQ1lnEgc9STIuP2fC03MpFSJjNdYTtTvWARkSrW14QGh0CcdJniOS8Z+cZ28nt/AQ0ivEMz6NHA/qdWQihLmt3x0UcxhSFsk1QsNFH5PuKDZFvDNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779186138; c=relaxed/simple;
	bh=ULeatyi9DNUG20aqHLOaYIRBmjWbJLwrN+Zf2xRASnA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XqSals8QurqwHnnS7nEb+6EFCY9GCy44rBvW8XIVGxZu8iBwdloIVN+WeFHw1HWLPd1IbnBeCjvtTTu9vEyrDAo6cdFJp6T56GQxEXyF0HyFCPx/ouOtcxQN1RGSDlwO/6OvZRzLbfMSyU1sXZSfvq/3fjIlssxiRXO3MfsMPhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FjkAVDJy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FjkAVDJy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779186137; x=1810722137;
  h=date:from:to:cc:subject:message-id;
  bh=ULeatyi9DNUG20aqHLOaYIRBmjWbJLwrN+Zf2xRASnA=;
  b=FjkAVDJyQo8FC/1aaQQkwd6Mwpd6z/zaXUq8g8F8WU0ufCSe+1CtIhba
   OTdPkS3zr6SsXeeHS1+SFqcZA2ri4ps2RDxaW/PlbwO+ESXJm4jTrmI0r
   nBOBOzSfwUdGkQTfJvMTAsBQMB8IKqUFYM3ncOACPA0Qt1kFEqt7h+2Fn
   32EfD0KZ9vBzje9/Rje0RZ7znw7bulnVSuo3H9TNYn6/wGv+LGfnYD0p4
   +GSucn6avQHuNgqYrmsYXj/1DPMcgS/YP1c9JSF6n4Q2aK19zOO723gFM
   zHVP3mGBPfhvWUPaTK/j1PLRcRQaAr8Ko8rHET/5UiX7rqjBOQwY6y9rT
   A==;
X-CSE-ConnectionGUID: qxo7cqVQQS25s4JJYw5Gvg==
X-CSE-MsgGUID: 3OqOJcr1R5+xfLL6C3HzGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="105519958"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="105519958"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 03:22:16 -0700
X-CSE-ConnectionGUID: HxzcraCLQTaR7h2TEVK3qA==
X-CSE-MsgGUID: 6cwvhPP+QgWI6yuYRBHP0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="239782929"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 19 May 2026 03:22:15 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPHaW-00000000A9n-0eCg;
	Tue, 19 May 2026 10:22:12 +0000
Date: Tue, 19 May 2026 12:21:38 +0200
From: kernel test robot <lkp@intel.com>
To: Justin Suess <utilityemal77@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: kernel/bpf/hashtab.c:1514:6: warning: variable 'l_old' is
 used uninitialized whenever 'if' condition is true
Message-ID: <202605191228.QnCSZO0z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Justin-Suess/bpf-fix-deadlock-in-special-field-destruction-in-NMI/20260519-123808
head:   d05cda57f3acd924fb36753d8681aa2c1084617f
commit: d05cda57f3acd924fb36753d8681aa2c1084617f bpf: fix deadlock in special field destruction in NMI
date:   6 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260519/202605191228.QnCSZO0z-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605191228.QnCSZO0z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605191228.QnCSZO0z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/hashtab.c:1514:6: warning: variable 'l_old' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1514 |         if (ret)
         |             ^~~
   kernel/bpf/hashtab.c:1553:6: note: uninitialized use occurs here
    1553 |         if (l_old && !ret && htab_has_nmi_special_fields(htab))
         |             ^~~~~
   kernel/bpf/hashtab.c:1514:2: note: remove the 'if' if its condition is always false
    1514 |         if (ret)
         |         ^~~~~~~~
    1515 |                 goto err_lock_bucket;
         |                 ~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/hashtab.c:1482:40: note: initialize the variable 'l_old' to silence this warning
    1482 |         struct htab_elem *l_new = NULL, *l_old;
         |                                               ^
         |                                                = NULL
   1 warning generated.


vim +1514 kernel/bpf/hashtab.c

824bd0ce6c7c43 Alexei Starovoitov      2016-02-01  1476  
d7ba4cc900bf1e JP Kobryn               2023-03-22  1477  static long __htab_lru_percpu_map_update_elem(struct bpf_map *map, void *key,
8f8449384ec364 Martin KaFai Lau        2016-11-11  1478  					      void *value, u64 map_flags,
8f8449384ec364 Martin KaFai Lau        2016-11-11  1479  					      bool onallcpus)
8f8449384ec364 Martin KaFai Lau        2016-11-11  1480  {
8f8449384ec364 Martin KaFai Lau        2016-11-11  1481  	struct bpf_htab *htab = container_of(map, struct bpf_htab, map);
8f8449384ec364 Martin KaFai Lau        2016-11-11  1482  	struct htab_elem *l_new = NULL, *l_old;
4fe8435909fddc Alexei Starovoitov      2017-03-07  1483  	struct hlist_nulls_head *head;
8f8449384ec364 Martin KaFai Lau        2016-11-11  1484  	unsigned long flags;
8f8449384ec364 Martin KaFai Lau        2016-11-11  1485  	struct bucket *b;
8f8449384ec364 Martin KaFai Lau        2016-11-11  1486  	u32 key_size, hash;
8f8449384ec364 Martin KaFai Lau        2016-11-11  1487  	int ret;
8f8449384ec364 Martin KaFai Lau        2016-11-11  1488  
c6936161fd55d0 Leon Hwang              2026-01-07  1489  	ret = htab_map_check_update_flags(onallcpus, map_flags);
c6936161fd55d0 Leon Hwang              2026-01-07  1490  	if (unlikely(ret))
c6936161fd55d0 Leon Hwang              2026-01-07  1491  		return ret;
8f8449384ec364 Martin KaFai Lau        2016-11-11  1492  
48a97ffc6c8266 Andrii Nakryiko         2025-10-14  1493  	WARN_ON_ONCE(!bpf_rcu_lock_held());
8f8449384ec364 Martin KaFai Lau        2016-11-11  1494  
8f8449384ec364 Martin KaFai Lau        2016-11-11  1495  	key_size = map->key_size;
8f8449384ec364 Martin KaFai Lau        2016-11-11  1496  
c0203475765f82 Daniel Borkmann         2018-08-22  1497  	hash = htab_map_hash(key, key_size, htab->hashrnd);
8f8449384ec364 Martin KaFai Lau        2016-11-11  1498  
8f8449384ec364 Martin KaFai Lau        2016-11-11  1499  	b = __select_bucket(htab, hash);
8f8449384ec364 Martin KaFai Lau        2016-11-11  1500  	head = &b->head;
8f8449384ec364 Martin KaFai Lau        2016-11-11  1501  
8f8449384ec364 Martin KaFai Lau        2016-11-11  1502  	/* For LRU, we need to alloc before taking bucket's
8f8449384ec364 Martin KaFai Lau        2016-11-11  1503  	 * spinlock because LRU's elem alloc may need
8f8449384ec364 Martin KaFai Lau        2016-11-11  1504  	 * to remove older elem from htab and this removal
8f8449384ec364 Martin KaFai Lau        2016-11-11  1505  	 * operation will need a bucket lock.
8f8449384ec364 Martin KaFai Lau        2016-11-11  1506  	 */
d05cda57f3acd9 Justin Suess            2026-05-18  1507  	if (map_flags != BPF_EXIST || htab_has_nmi_special_fields(htab)) {
8f8449384ec364 Martin KaFai Lau        2016-11-11  1508  		l_new = prealloc_lru_pop(htab, key, hash);
8f8449384ec364 Martin KaFai Lau        2016-11-11  1509  		if (!l_new)
8f8449384ec364 Martin KaFai Lau        2016-11-11  1510  			return -ENOMEM;
8f8449384ec364 Martin KaFai Lau        2016-11-11  1511  	}
8f8449384ec364 Martin KaFai Lau        2016-11-11  1512  
4fa8d68aa53e6d Kumar Kartikeya Dwivedi 2025-03-15  1513  	ret = htab_lock_bucket(b, &flags);
20b6cc34ea74b6 Song Liu                2020-10-29 @1514  	if (ret)
b34ffb0c6d2358 Anton Protopopov        2023-05-22  1515  		goto err_lock_bucket;
8f8449384ec364 Martin KaFai Lau        2016-11-11  1516  
8f8449384ec364 Martin KaFai Lau        2016-11-11  1517  	l_old = lookup_elem_raw(head, hash, key, key_size);
8f8449384ec364 Martin KaFai Lau        2016-11-11  1518  
8f8449384ec364 Martin KaFai Lau        2016-11-11  1519  	ret = check_flags(htab, l_old, map_flags);
8f8449384ec364 Martin KaFai Lau        2016-11-11  1520  	if (ret)
8f8449384ec364 Martin KaFai Lau        2016-11-11  1521  		goto err;
8f8449384ec364 Martin KaFai Lau        2016-11-11  1522  
8f8449384ec364 Martin KaFai Lau        2016-11-11  1523  	if (l_old) {
d05cda57f3acd9 Justin Suess            2026-05-18  1524  		if (htab_has_nmi_special_fields(htab)) {
d05cda57f3acd9 Justin Suess            2026-05-18  1525  			pcpu_init_value(htab,
d05cda57f3acd9 Justin Suess            2026-05-18  1526  					htab_elem_get_ptr(l_new, key_size),
d05cda57f3acd9 Justin Suess            2026-05-18  1527  					value, onallcpus, map_flags);
d05cda57f3acd9 Justin Suess            2026-05-18  1528  			hlist_nulls_add_head_rcu(&l_new->hash_node, head);
d05cda57f3acd9 Justin Suess            2026-05-18  1529  			hlist_nulls_del_rcu(&l_old->hash_node);
d05cda57f3acd9 Justin Suess            2026-05-18  1530  			bpf_lru_node_set_ref(&l_new->lru_node);
d05cda57f3acd9 Justin Suess            2026-05-18  1531  			l_new = NULL;
d05cda57f3acd9 Justin Suess            2026-05-18  1532  		} else {
8f8449384ec364 Martin KaFai Lau        2016-11-11  1533  			bpf_lru_node_set_ref(&l_old->lru_node);
8f8449384ec364 Martin KaFai Lau        2016-11-11  1534  
8f8449384ec364 Martin KaFai Lau        2016-11-11  1535  			/* per-cpu hash map can update value in-place */
8f8449384ec364 Martin KaFai Lau        2016-11-11  1536  			pcpu_copy_value(htab, htab_elem_get_ptr(l_old, key_size),
c6936161fd55d0 Leon Hwang              2026-01-07  1537  					value, onallcpus, map_flags);
d05cda57f3acd9 Justin Suess            2026-05-18  1538  		}
8f8449384ec364 Martin KaFai Lau        2016-11-11  1539  	} else {
d3bec0138bfbe5 David Verbeiren         2020-11-04  1540  		pcpu_init_value(htab, htab_elem_get_ptr(l_new, key_size),
c6936161fd55d0 Leon Hwang              2026-01-07  1541  				value, onallcpus, map_flags);
4fe8435909fddc Alexei Starovoitov      2017-03-07  1542  		hlist_nulls_add_head_rcu(&l_new->hash_node, head);
8f8449384ec364 Martin KaFai Lau        2016-11-11  1543  		l_new = NULL;
8f8449384ec364 Martin KaFai Lau        2016-11-11  1544  	}
8f8449384ec364 Martin KaFai Lau        2016-11-11  1545  	ret = 0;
8f8449384ec364 Martin KaFai Lau        2016-11-11  1546  err:
4fa8d68aa53e6d Kumar Kartikeya Dwivedi 2025-03-15  1547  	htab_unlock_bucket(b, flags);
b34ffb0c6d2358 Anton Protopopov        2023-05-22  1548  err_lock_bucket:
9bc421b6be955c Anton Protopopov        2023-07-06  1549  	if (l_new) {
9bc421b6be955c Anton Protopopov        2023-07-06  1550  		bpf_map_dec_elem_count(&htab->map);
8f8449384ec364 Martin KaFai Lau        2016-11-11  1551  		bpf_lru_push_free(&htab->lru, &l_new->lru_node);
9bc421b6be955c Anton Protopopov        2023-07-06  1552  	}
d05cda57f3acd9 Justin Suess            2026-05-18  1553  	if (l_old && !ret && htab_has_nmi_special_fields(htab))
d05cda57f3acd9 Justin Suess            2026-05-18  1554  		htab_lru_push_free(htab, l_old);
8f8449384ec364 Martin KaFai Lau        2016-11-11  1555  	return ret;
8f8449384ec364 Martin KaFai Lau        2016-11-11  1556  }
8f8449384ec364 Martin KaFai Lau        2016-11-11  1557  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
