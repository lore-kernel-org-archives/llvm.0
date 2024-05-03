Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9256C18E1E;
	Fri,  3 May 2024 02:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714704735; cv=none; b=d0BlL2gRMJI6IMFRhCwpNum6LP+pP986OTfXi6WYnZC6UO1AW36VQcyDJo/S3w6i299WzUcPE7hSo/HYFiAPxvBWz7iGSsg3arsUHuZAWiVeNEjZacI21UZWpUsnymJYmqlOcUKYloQheRePwfQ5+1dQJ8E438NTuriBkShSpTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714704735; c=relaxed/simple;
	bh=0Pf205u88RUt3zDWjjrsr1oLE34WySUHPBw3G302z4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mPe4hSvgBe2V39nASQZFL8lg/ZQVPFdb3u82eDEdnfD+odyNGFPgKelphcFkj9KBcUiyMDzZvcyl6c+OMXoSUpfoa8cz1lOIcO/ooQnt4k+lzxDidaJkCZwH78oct1FvCUEsqaLBVPEu/Nu65Gfr3REOtYBXk1ct2/UoF26hFbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hNA0UTMt; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hNA0UTMt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714704734; x=1746240734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Pf205u88RUt3zDWjjrsr1oLE34WySUHPBw3G302z4I=;
  b=hNA0UTMtZMsunCHmagfSepoDipGa++tRI34XXACl/qHxpxPpU3HVR+CO
   aZN+0Qa2A8uRAjlRPI0VsfgeDoSJRD9lHKvSLYtbfWyE5IyqFDfl7ofIV
   qYweVakVunI1if34u8POdeuqXlx9/ibNYp1iKkPWkc0KICAZxAl0Y1XDz
   MiEQcKThH1pSkOPJCEBRJMGMqXViD0njd67QSz2cbPJPd8fc/eInYoW/Z
   fBzuND1hW7HAkwi6T1EJN+gG3ZhG440s57N3CuG3xpI6nxKO/IlmcyZEJ
   NombOBghEjhOQnW9GwZcFgva53FXVNnBs+7toIZhUUPQXJ63l0RiThWqU
   g==;
X-CSE-ConnectionGUID: 4nn52RrlTJubD0JTqoKpeQ==
X-CSE-MsgGUID: 34BEmDuVT/yyK2A96xksTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10435686"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="10435686"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 19:52:13 -0700
X-CSE-ConnectionGUID: xedDZ5ELQs2svZdNnEMRew==
X-CSE-MsgGUID: Jor1D1gaTBaPYh5VLwlycg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="27412751"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 May 2024 19:52:11 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2j1t-000BFE-0H;
	Fri, 03 May 2024 02:52:09 +0000
Date: Fri, 3 May 2024 10:52:03 +0800
From: kernel test robot <lkp@intel.com>
To: Dongsheng Yang <dongsheng.yang@easystack.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Coly Li <colyli@suse.de>
Subject: [colyli-bcache:for-next 3/3] drivers/md/bcache/btree.c:1774:21:
 warning: variable 'ca' is uninitialized when used here
Message-ID: <202405031034.WlmParsM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/colyli/linux-bcache.git for-next
head:   f7093093e7a41cc15a90a97581d77d4c4af54cc5
commit: f7093093e7a41cc15a90a97581d77d4c4af54cc5 [3/3] bcache: allow allocator to invalidate bucket in gc
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240503/202405031034.WlmParsM-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405031034.WlmParsM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405031034.WlmParsM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/md/bcache/btree.c:24:
   In file included from drivers/md/bcache/bcache.h:181:
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
>> drivers/md/bcache/btree.c:1774:21: warning: variable 'ca' is uninitialized when used here [-Wuninitialized]
    1774 |         for_each_bucket(b, ca)
         |                            ^~
   drivers/md/bcache/bcache.h:892:12: note: expanded from macro 'for_each_bucket'
     892 |         for (b = (ca)->buckets + (ca)->sb.first_bucket;                 \
         |                   ^~
   drivers/md/bcache/btree.c:1764:18: note: initialize the variable 'ca' to silence this warning
    1764 |         struct cache *ca;
         |                         ^
         |                          = NULL
   6 warnings generated.


vim +/ca +1774 drivers/md/bcache/btree.c

  1760	
  1761	static void bch_btree_gc_finish(struct cache_set *c)
  1762	{
  1763		struct bucket *b;
  1764		struct cache *ca;
  1765		unsigned int i, j;
  1766		uint64_t *k;
  1767	
  1768		mutex_lock(&c->bucket_lock);
  1769	
  1770		set_gc_sectors(c);
  1771		c->gc_mark_valid = 1;
  1772		c->need_gc	= 0;
  1773	
> 1774		for_each_bucket(b, ca)
  1775			if (b->reclaimable_in_gc)
  1776				b->reclaimable_in_gc = 0;
  1777	
  1778		for (i = 0; i < KEY_PTRS(&c->uuid_bucket); i++)
  1779			SET_GC_MARK(PTR_BUCKET(c, &c->uuid_bucket, i),
  1780				    GC_MARK_METADATA);
  1781	
  1782		/* don't reclaim buckets to which writeback keys point */
  1783		rcu_read_lock();
  1784		for (i = 0; i < c->devices_max_used; i++) {
  1785			struct bcache_device *d = c->devices[i];
  1786			struct cached_dev *dc;
  1787			struct keybuf_key *w, *n;
  1788	
  1789			if (!d || UUID_FLASH_ONLY(&c->uuids[i]))
  1790				continue;
  1791			dc = container_of(d, struct cached_dev, disk);
  1792	
  1793			spin_lock(&dc->writeback_keys.lock);
  1794			rbtree_postorder_for_each_entry_safe(w, n,
  1795						&dc->writeback_keys.keys, node)
  1796				for (j = 0; j < KEY_PTRS(&w->key); j++)
  1797					SET_GC_MARK(PTR_BUCKET(c, &w->key, j),
  1798						    GC_MARK_DIRTY);
  1799			spin_unlock(&dc->writeback_keys.lock);
  1800		}
  1801		rcu_read_unlock();
  1802	
  1803		c->avail_nbuckets = 0;
  1804	
  1805		ca = c->cache;
  1806		ca->invalidate_needs_gc = 0;
  1807	
  1808		for (k = ca->sb.d; k < ca->sb.d + ca->sb.keys; k++)
  1809			SET_GC_MARK(ca->buckets + *k, GC_MARK_METADATA);
  1810	
  1811		for (k = ca->prio_buckets;
  1812		     k < ca->prio_buckets + prio_buckets(ca) * 2; k++)
  1813			SET_GC_MARK(ca->buckets + *k, GC_MARK_METADATA);
  1814	
  1815		for_each_bucket(b, ca) {
  1816			c->need_gc	= max(c->need_gc, bucket_gc_gen(b));
  1817	
  1818			if (atomic_read(&b->pin))
  1819				continue;
  1820	
  1821			BUG_ON(!GC_MARK(b) && GC_SECTORS_USED(b));
  1822	
  1823			if (!GC_MARK(b) || GC_MARK(b) == GC_MARK_RECLAIMABLE)
  1824				c->avail_nbuckets++;
  1825		}
  1826	
  1827		mutex_unlock(&c->bucket_lock);
  1828	}
  1829	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
