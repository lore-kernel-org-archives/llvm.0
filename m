Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010041DA53;
	Wed,  8 May 2024 13:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715175758; cv=none; b=KkRiwMwq8WbmzC/v8lyb9Fs96ECqNiTVwc9yeySxKatWMg9XzAcViHmQOoyu6U2PqxQKFKriD5NjRCuw2AB95bKxMowRuEjP4erVsGDqdmMrYe/ORMwXzQh/ocMwt6sRUnS0ssv66nDq4d7PM0W1GvZdgdSxVbgNC1iQZ5uuha8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715175758; c=relaxed/simple;
	bh=mRqxaQmlzN7ZEwAbgOcUYChs9GFrEJyRJoFZCe98hI0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fix5eMH8FibYFkMDcI26N2gqeNtMePFrzoHR6JkdAfpTWytliTJYNTzQfYtFMd003LKIMc2gqRw2p7n8msUkTiLKE/NdsB+bzir1qHXkN7D0Afwvya6NPNs1frQ54FZvuOlqQZivQWFmYah/HeAaaTH+ZdHXiShcet9bsshCrkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hALdA0mh; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hALdA0mh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715175757; x=1746711757;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mRqxaQmlzN7ZEwAbgOcUYChs9GFrEJyRJoFZCe98hI0=;
  b=hALdA0mhs4bhD2eD0SMsrFE/ZVY2zMHM9aHyUNptcwt6ebl1M5e9NyTE
   11LABzy+VRZ/yVRV9zyqS5XJz4vhLT9RCe9XCdRVwjP8icDxuPPVTTjzS
   Ns3G2jWMTi2M413N3jKUOFNIiM8L8b9CO/SEvkoKypjGCqeljM1KOrwGT
   8SHNfntLZIFkwRM0t/pw0LRpKomdP84Mq/bxO02TzMJNfLOoMJJCMlaVB
   h80nNlIHCi+QOqg5Th8lk0+X92sAo4kHBLMN43rE+4wRzT49SmcDQPywa
   IeZPe5AURMOdK62uXmHsVJAHIvEfhqX+9z5J4sCuewqqjzfttoo1NSLn1
   Q==;
X-CSE-ConnectionGUID: SCu647axQ3Sw2eXwMfHYUw==
X-CSE-MsgGUID: qHzfNvBTRnqzoSFZ7hAovQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="10887088"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="10887088"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 06:42:36 -0700
X-CSE-ConnectionGUID: To5F5ZaWTMCOt39+pWTllQ==
X-CSE-MsgGUID: ZiwXLHQLTA+VuibInGM3qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="29294039"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 May 2024 06:42:36 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4hZ2-0003SE-3A;
	Wed, 08 May 2024 13:42:32 +0000
Date: Wed, 8 May 2024 21:42:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 166/167] fs/bcachefs/bset.c:219:7:
 warning: explicitly assigning value of variable of type 'struct
 btree_node_iter_set *' to itself
Message-ID: <202405082117.aZrGX86B-lkp@intel.com>
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
commit: 50c70bbc00a9a420984148aefde1b593d3679848 [166/167] bcachefs: for_each_bset() declares loop iter
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240508/202405082117.aZrGX86B-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 0ab4458df0688955620b72cc2c72a32dffad3615)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405082117.aZrGX86B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405082117.aZrGX86B-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/bset.c:9:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/bcachefs/bset.c:9:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/bcachefs/bset.c:9:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/bcachefs/bset.c:9:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> fs/bcachefs/bset.c:219:7: warning: explicitly assigning value of variable of type 'struct btree_node_iter_set *' to itself [-Wself-assign]
     219 |                 set = set;
         |                 ~~~ ^ ~~~
   8 warnings generated.


vim +219 fs/bcachefs/bset.c

   192	
   193	void bch2_btree_node_iter_verify(struct btree_node_iter *iter,
   194					 struct btree *b)
   195	{
   196		struct btree_node_iter_set *set, *s2;
   197		struct bkey_packed *k, *p;
   198	
   199		if (bch2_btree_node_iter_end(iter))
   200			return;
   201	
   202		/* Verify no duplicates: */
   203		btree_node_iter_for_each(iter, set) {
   204			BUG_ON(set->k > set->end);
   205			btree_node_iter_for_each(iter, s2)
   206				BUG_ON(set != s2 && set->end == s2->end);
   207		}
   208	
   209		/* Verify that set->end is correct: */
   210		btree_node_iter_for_each(iter, set) {
   211			for_each_bset(b, t)
   212				if (set->end == t->end_offset) {
   213					BUG_ON(set->k < btree_bkey_first_offset(t) ||
   214					       set->k >= t->end_offset);
   215					goto found;
   216				}
   217			BUG();
   218	found:
 > 219			set = set;
   220		}
   221	
   222		/* Verify iterator is sorted: */
   223		btree_node_iter_for_each(iter, set)
   224			BUG_ON(set != iter->data &&
   225			       btree_node_iter_cmp(b, set[-1], set[0]) > 0);
   226	
   227		k = bch2_btree_node_iter_peek_all(iter, b);
   228	
   229		for_each_bset(b, t) {
   230			if (iter->data[0].end == t->end_offset)
   231				continue;
   232	
   233			p = bch2_bkey_prev_all(b, t,
   234				bch2_btree_node_iter_bset_pos(iter, b, t));
   235	
   236			BUG_ON(p && bkey_iter_cmp(b, k, p) < 0);
   237		}
   238	}
   239	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
